import pandas as pd
from mysql.connector import Error
from sqlalchemy import create_engine
from sqlalchemy import insert
import sys
import re
import json

# INSERT IGNORE
from sqlalchemy.ext.compiler import compiles
from sqlalchemy.sql.expression import Insert

fine_cols = ['date', 'site_name', 'dial_acc', 'call_acc', 'dial_not_acc', 'call_not_acc', 'dial_noreply', 'offline_msg']

@compiles(Insert)
def _prefix_insert_with_ignore(insert, compiler, **kw):
    return compiler.visit_insert(insert.prefix_with('IGNORE'), **kw)

def format_date(raw):
    date = re.search(r"\D(\d{1,}).(\d{1,}).(\d{1,})", raw)
    return date.group(3) + '-' + date.group(2) + '-' + date.group(1)

def format_new_table(old):
    start = old.loc[file['x0'] == 'Сводный отчет по сайтам'].index[0]
    ends = old.loc[file['x0'] == 'ИТОГО'].index[0]
    new = pd.DataFrame(old.iloc[start + 3:ends, :7])
    new['date'] = format_date(old.iloc[0, 0])
    new.insert(0, 'date', new.pop('date'))
    new.reset_index(drop=True, inplace=True)
    new.columns = fine_cols
    return new

def get_engine(data):
    user = data['user']
    password = data['password']
    host = data['host']
    port = data['port']
    if len(user)==0 or len(password)==0 or len(host)==0 or port==0:
        raise SystemExit('Некоторые данные не были введены')
    engine = create_engine('mysql+mysqlconnector://{0}:{1}@{2}:{3}'.format(user, password, host, port))
    return engine

def create_statement(table, sql_table):
    values = ""
    for ind in table.index:
        lst = [str(el) for el in table.iloc[ind].to_list()]
        for i in range(2):
            lst[i] = "\'" + lst[i] + "\'"
        values += "({})".format(", ".join(lst))
        if ind != table.last_valid_index():
            values+=", "
    values = re.sub('Мишлен', 'Michelin', values)
    return "INSERT IGNORE INTO {}(".format(sql_table) + ', '.join(fine_cols) + ") VALUES {};".format(values)

try:
    if len(sys.argv) < 2:
        raise SystemExit('Имя файла должно быть аргументом к скрипту')
    with open('conf.json', 'r') as f:
        data = json.load(f)
    file = pd.read_excel(sys.argv[1], sheet_name=0)
    if len(file.columns.to_list()) != 13:
        raise ValueError("В таблице неверное количество столбцов, должно быть 13")
    file.columns = ['x' + str(x) for x in range(13)]
    
    table = format_new_table(file)
    if table.empty:
        raise SystemExit("Некорректное имя excel файла, либо нет доступа")

    engine = get_engine(data)
    sql_table = "{}.{}".format(data['schema'], data['table_site_reports'])
    with engine.connect() as conn:
        statement = create_statement(table, sql_table)
        conn.execute(statement)
    print("Добавлены данные из {}".format(sys.argv[1]))
    engine.dispose()

except ValueError as vx: print(vx)
except Exception as ex: print(ex)
except ConnectionRefusedError as e:
    print("Не удалось подключиться к базе: ", e)
except Error as e:
    print("Возникла ошибка:", e)
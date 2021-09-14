from mysql.connector import Error
from sqlalchemy import create_engine
import pandas
import sys
import sqlalchemy
import json
import re


# INSERT IGNORE
from sqlalchemy.ext.compiler import compiles
from sqlalchemy.sql.expression import Insert

@compiles(Insert)
def _prefix_insert_with_ignore(insert, compiler, **kw):
    return compiler.visit_insert(insert.prefix_with('IGNORE'), **kw)

def get_engine(data):
    user = data['user']
    password = data['password']
    host = data['host']
    port = data['port']
    if len(user)==0 or len(password)==0 or len(host)==0 or port==0:
        raise SystemExit('Некоторые данные не были введены')
    engine = create_engine('mysql+mysqlconnector://{0}:{1}@{2}:{3}'.format(user, password, host, port))
    return engine

def match_time(line):
    res = re.search(r"(\d+)\D+(\d+)\D+(\d+)", line)
    if not res:
        res = re.search(r"(\d+)\D+(\d+)", line)
    if res.lastindex == 2:
        val = res.group(1) + ":" + res.group(2) + ":00"
    elif res.lastindex == 3:
        val = str(int(res.group(1)) * 24 + int(res.group(2))) + ":" + res.group(3) + ":00"
    else:
        val = "00:00:00"
    return val

def get_data_frame():
    filename = sys.argv[1]
    excel = pandas.read_excel('./'+filename, sheet_name=0)
    if excel.empty:
        return excel
    if len(excel.columns.to_list()) != 23:
        raise ValueError("В таблице неверное количество столбцов, должно быть 23")
    excel.set_axis(['ticket_id', 'age', 'created', 'closed', 'first_block', 'first_repl', 'state', 'priority', 'queue', 'to_block', 'owner', 'first_name', 'last_name', 'company_id', 'customer_name', 'sender', 'subject', 'spent_time', 'message_tree', 'solution_in_min', 'solution_diff_min', 'first_response_in_min', 'first_response_diff_min'], axis=1, inplace=True)
    excel.iloc[:, 1] = excel.iloc[:, 1].apply(match_time)
    return excel

try:
    if len(sys.argv) < 2:
        raise SystemExit("Имя файла должно быть аргументом к скрипту")
    with open('conf.json', 'r') as f:
        data = json.load(f)
    engine = get_engine(data)
    df = get_data_frame()
    if df.empty:
        engine.dispose()
        raise SystemExit("Некорректное имя excel файла, либо нет доступа")
    tname = data['schema']
    ttable = data['table_tickets']
    
    df.to_sql(name=ttable, schema=tname, con=engine, index=False, if_exists='append')
    print('Данные из файла {} были загружены в базу данных.'.format(sys.argv[1]))
    engine.dispose()

except ValueError as vx: print(vx)
except Exception as ex: print(ex)
except ConnectionRefusedError as e:
    print("Не удалось подключиться к базе: ", e)
except sqlalchemy.exc.InterfaceError as e:
    print("Не удалось подключиться к базе: ", e)
except Error as e:
    print("Возникла ошибка:", e)
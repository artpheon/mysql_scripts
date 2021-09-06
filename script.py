from mysql.connector import Error
from sqlalchemy import create_engine
import pandas
import sys

def get_engine():
    # rename columns in excel - yes
    user = input('Введите имя пользователя: ')
    password = input('Введите пароль: ')
    host = input('Введите имя хоста: ')
    port = input('Введите порт: ')
    if not user or not password or not host or not port:
        return None
    engine = create_engine('mysql+mysqlconnector://{0}:{1}@{2}:{3}'.format(user, password, host, port))
    return engine

def get_data_frame():
    filename = sys.argv[1]
    excel = pandas.read_excel('./'+filename, sheet_name=0)
    if excel.empty:
        return excel
    excel.drop(['Дата первого ответа', 'ID компании', 'Customer Name', 'Дерево сообщений', 'FirstResponseInMin', 'FirstResponseDiffInMin'], axis=1, inplace=True)
    excel.set_axis(['ticket_id', 'age', 'created_time', 'closed', 'date_first_block', 'state', 'priority', 'queue', 'to_block', 'owner', 'name', 'surname', 'sender', 'subject', 'spent_time', 'SolutionInMin', 'SolutionDiffInMin'], axis=1, inplace=True)
    return excel

try:
    if len(sys.argv) != 2:
        raise SystemExit("Имя файла должно быть аргументом к скрипту")
    engine = get_engine()
    df = get_data_frame()
    if df.empty:
        engine.dispose()
        raise SystemExit("Некорректное имя excel файла, либо нет доступа")
    tname = input('Введите имя базы/схемы: ')
    ttable = input('Введите имя таблицы: ')
    df.to_sql(name=ttable, schema=tname, con=engine, index=False, if_exists='append')
    print('Данные из файла {} были загружены в базу данных.'.format(sys.argv[1]))

except Error as e:
    print("Возникла ошибка:", e)

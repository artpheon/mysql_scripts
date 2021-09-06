import mysql.connector
from mysql.connector import Error
from sqlalchemy import create_engine
import pandas

def getValues(filename):
    excel = pandas.read_excel('./'+filename, sheet_name=0)
    excel.drop(['Дата первого ответа', 'ID компании', 'Customer Name', 'Дерево сообщений', 'FirstResponseInMin', 'FirstResponseDiffInMin'], axis=1, inplace=True)
    # rename columns in excel?
    engine = create_engine('mysql://root:python@127.0.0.1:3306/chats')
    excel.to_sql('tickets', engine, index=False, if_exists='append')
    dsql = pandas.read_sql_table('tickets', engine)



try:
    connection = mysql.connector.connect(host='localhost',
                                         database='chats',
                                         user='root',
                                         password='pass')
    if connection.is_connected():
        db_Info = connection.get_server_info()
        print("Connected to MySQL Server version ", db_Info)
        cursor = connection.cursor()
        cursor.execute('insert into chats.tickets VALUE (10101259, "1 h 52 min", "2021-09-02 06:20:24", "2021-09-02 06:37:04", "2021-09-02 06:36:58", "closed successfully", "3 normal", "BSC Support::Urgent", "unlocked", "GAR5KSN", "Regina", "Gainullina", "Robot <landing@boschcarservice.ru>", "Filled form on a site", 0, 16, 13);')
        #record = cursor.fetchall()
        #print("You're connected to database: ", record)

except Error as e:
    print("Error while connecting to MySQL", e)
finally:
    if connection.is_connected():
        cursor.close()
        connection.commit()
        connection.close()
        print("MySQL connection is closed")

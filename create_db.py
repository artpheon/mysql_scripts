from mysql import connector
from mysql.connector import Error
import sys


def scrub(table):
    return ''.join(chr for chr in table if chr.isalnum())


def createStatement(table, cols):
    return f"CREATE TABLE {table} ({cols[0]} INT NOT NULL AUTOINCREMENT" + \
           (", {} VARCHAR(40) NOT NULL" * (len(cols) - 1)).format(*map(scrub, cols[1:])) + \
           f"), PRIMARY KEY ({cols[0]}));"


def create_db(fields):
    try:
        connection = connector.connect(host='localhost',
                                       database='mysql',
                                       user='root',
                                       password='pass')
        if connection.is_connected():
            db_Info = connection.get_server_info()
            print("Connected to MySQL Server version ", db_Info)
            cursor = connection.cursor()
            stat = createStatement(fields.pop(0), fields)
            print("\n" + stat + "\n")
            cursor.execute(stat)
            record = cursor.fetchone()
            print("You're connected to database: ", record)

    except Error as e:
        print("Error while connecting to MySQL", e)
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")


if __name__ == '__main__':
    fields = list(sys.argv)
    if len(fields) < 3:
        print('Wrong script arguments. Sample: python create_db.py <db name> <db field1> <db field2> ...')
    else:
        fields.pop(0)
        create_db(fields)

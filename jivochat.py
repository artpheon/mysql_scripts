import pandas as pd
import numpy as np
import sqlalchemy
import sys

try:
    if len(sys.argv) < 2:
        raise SystemExit('Имя файла должно быть аргументом к скрипту')
    file = pd.read_excel(sys.argv[1], sheet_name=0)
    collist = ['x' + str(x) for x in range(13)]
    file.columns = collist
    start = file.loc[file['x0'] == 'Сводный отчет по сайтам'].index[0]
    ends = file.loc[file['x0'] == 'ИТОГО'].index
    file2 = pd.DataFrame(file.iloc[start:ends[0]+1])
except: print("Ошибка")
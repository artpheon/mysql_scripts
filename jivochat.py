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
    file2 = pd.DataFrame(file.iloc[4:17])
except:
    exit(1)
!pip install PyMySQL
!pip install tabulate

# apro la connessione al database, provo fetching con tutte le righe
import pymysql
from tabulate import tabulate
import pandas as pd

# Open database connection
db = pymysql.connect(host='db4free.net',
        user='prova_admin', 
        password = "prova_admin",
        db='provadbsia')
        
try:

    with db.cursor() as cur:

        cur.execute('SELECT * FROM claims')

        data = cur.fetchall()
finally:

    db.close()

num_fields = len(cur.description)
field_names = [i[0] for i in cur.description]
df = pd.DataFrame.from_records(data,columns=field_names)  
print(tabulate(df.head(),headers=field_names))  

# connessione al DB

library(RMySQL)
con <- dbConnect(RMySQL::MySQL(),
                      host   = 'db4free.net',
                      dbname = 'provadbsia',
                      user     = 'prova_admin',
                      password      = 'prova_admin',
                      port     = 3306)

# visualizzo le tabelle del database 
res=DBI::dbListTables(con)
res

# contenuto della tabella claims 

res=DBI::dbSendQuery(con,'DESCRIBE claims;')
res=dbFetch(res)
dbClearResult(dbListResults(con)[[1]])


# seleziono i costi della tabella claims con ID sinistro e ID anagrafica

res=DBI::dbSendQuery(con,'DESCRIBE claims;')
res=dbFetch(res)
dbClearResult(dbListResults(con)[[1]])


res=DBI::dbSendQuery(con,'SELECT ID, 
                      CodAnagrafica AS ID_ANA, 
                     ImportoLiquidato AS Cost 
                     FROM claims
                      LIMIT 10;')
res=dbFetch(res)
dbClearResult(dbListResults(con)[[1]])


# seleziono i costi della tabella claims con ID sinistro e ID anagrafica (ordine discendente)

res=DBI::dbSendQuery(con,'SELECT ID, 
                      CodAnagrafica AS ID_ANA, 
                     ImportoLiquidato AS Cost 
                     FROM claims
                     ORDER BY ID_ANA DESC
                      LIMIT 10;')
res=dbFetch(res)
dbClearResult(dbListResults(con)[[1]])

# conto il numero di sinistri in totale

res=DBI::dbSendQuery(con,'SELECT COUNT(ID) 
                     FROM claims;')
res=dbFetch(res)
dbClearResult(dbListResults(con)[[1]])

# conto il numero di sinistri per tipologia di peril

res=DBI::dbSendQuery(con,'SELECT 
                          Descrizione AS Peril,
                          COUNT(ID) AS N_SX
                          FROM claims
                          GROUP BY Peril;')
res=dbFetch(res)
dbClearResult(dbListResults(con)[[1]])

# calcolo la frequenza sinistri per tipologia di PERIL 
res=DBI::dbSendQuery(con,'SELECT t.Peril as Peril, 
                          t.NUM_SX / t.SUMSX AS FREQ_SX
                          FROM
                          (
                          SELECT Descrizione AS Peril, COUNT(ID) AS NUM_SX, 
                          (
                          SELECT COUNT(ID)
                          FROM claims
                          ) AS SUMSX
                          FROM claims
                          GROUP BY Peril
                          ) t;
                          ')

res=dbFetch(res)

# calcoliamo i rischi anno 
res=DBI::dbSendQuery(con,'WITH 
                          s AS (
                          SELECT DISTINCT IdAnagrafica AS ID_ANA
                          FROM policies
                          ),
                          r AS (
                          SELECT CodAnagrafica AS ID_ANA,
                          COUNT(ID) AS NUM_SX
                          FROM claims 
                          GROUP BY ID_ANA
                          ),
                          t AS (
                          SELECT s.ID_ANA as ID_POL,
                          IFNULL(r.NUM_SX,0) AS SX
                          FROM s LEFT JOIN r ON s.ID_ANA=r.ID_ANA
                          ) 
                          SELECT DISTINCT(SX) AS SINISTRI, COUNT(SX) AS RISCHI_ANNO 
                          FROM t
                          GROUP BY SINISTRI 
                          ORDER BY SINISTRI;')
res=dbFetch(res)
dbClearResult(dbListResults(con)[[1]])

# calcoliamo indice di ripetibilità e indice sinistrosità

res=DBI::dbSendQuery(con,'WITH 
                          s AS (
                          SELECT DISTINCT IdAnagrafica AS ID_ANA
                          FROM policies
                          ),
                          r AS (
                          SELECT CodAnagrafica AS ID_ANA,
                          COUNT(ID) AS NUM_SX
                          FROM claims 
                          GROUP BY ID_ANA
                          ),
                          t AS (
                          SELECT s.ID_ANA as ID_POL,
                          IFNULL(r.NUM_SX,0) AS SX
                          FROM s LEFT JOIN r ON s.ID_ANA=r.ID_ANA
                          ),
                          IndSin AS(
                          SELECT  SUM(w.SINISTRI * w.RISCHI_ANNO) as N,
                          SUM(SINISTRI) AS ID
                          FROM (
                          SELECT DISTINCT(SX) AS SINISTRI, COUNT(SX) AS RISCHI_ANNO 
                          FROM t
                          GROUP BY SINISTRI 
                          ORDER BY SINISTRI
                          ) w
                          ),
                          IndSin2 AS(
                          SELECT  SUM(w.RISCHI_ANNO) as R,
                          SUM(SINISTRI) AS ID
                          FROM (
                          SELECT DISTINCT(SX) AS SINISTRI, COUNT(SX) AS RISCHI_ANNO 
                          FROM t
                          GROUP BY SINISTRI 
                          ORDER BY SINISTRI
                          ) w
                          ),
                          IndSin3 AS(
                          SELECT  SUM(w.SINISTRI * w.RISCHI_ANNO) / SUM(w.RISCHI_ANNO) as IND_RIP,
                          SUM(SINISTRI) AS ID
                          FROM (
                          SELECT DISTINCT(SX) AS SINISTRI, COUNT(SX) AS RISCHI_ANNO 
                          FROM t
                          GROUP BY SINISTRI 
                          ORDER BY SINISTRI
                          ) w
                          WHERE w.SINISTRI>0
                          )
                          
                          SELECT a.N,b.R, a.N / b.R AS IND_SIN, c.IND_RIP
                          FROM IndSin a 
                          INNER JOIN IndSin2 b
                          ON a.ID=b.ID
                          INNER JOIN IndSin3 c
                          ON b.ID=c.ID
                          ;')
res=dbFetch(res)
dbClearResult(dbListResults(con)[[1]])


# calcolo premio equo 
res=DBI::dbSendQuery(con,'WITH 
                          s AS (
                          SELECT DISTINCT IdAnagrafica AS ID_ANA
                          FROM policies
                          ),
                          r AS (
                          SELECT CodAnagrafica AS ID_ANA,
                          SUM(ImportoLiquidato) AS COST
                          FROM claims 
                          GROUP BY ID_ANA
                          ),
                          t AS (
                          SELECT s.ID_ANA as ID_POL,
                          IFNULL(r.COST,0) AS Y
                          FROM s LEFT JOIN r ON s.ID_ANA=r.ID_ANA
                          ) 
                          SELECT AVG(Y) AS PREMIO_EQUO 
                          FROM t
                     ;')
res=dbFetch(res)
dbClearResult(dbListResults(con)[[1]])

# calcolo premio equo per peril

res=DBI::dbSendQuery(con,'WITH 
                          s AS (
                          SELECT DISTINCT IdAnagrafica AS ID_ANA
                          FROM policies
                          ),
                          r AS (
                          SELECT CodAnagrafica AS ID_ANA, 
                          SUM(ImportoLiquidato) AS COST,
                          Descrizione AS Peril
                          FROM claims 
                          GROUP BY ID_ANA, Peril
                          ),
                          t AS (
                          SELECT s.ID_ANA as ID_POL,
                          IFNULL(r.COST,0) AS Y,
                          r.Peril
                          FROM s LEFT JOIN r ON s.ID_ANA=r.ID_ANA
                          ) 
                          SELECT Peril, AVG(Y) AS PREMIO_EQUO 
                          FROM t
                          WHERE Peril IS NOT NULL
                          GROUP BY Peril
                     ;')
res=dbFetch(res)
dbClearResult(dbListResults(con)[[1]])



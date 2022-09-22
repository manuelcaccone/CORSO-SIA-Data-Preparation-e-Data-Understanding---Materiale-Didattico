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

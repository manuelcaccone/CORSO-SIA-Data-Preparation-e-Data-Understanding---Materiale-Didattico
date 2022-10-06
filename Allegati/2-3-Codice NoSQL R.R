# importo i dati dal Db 
res=DBI::dbSendQuery(con,'SELECT * FROM claims;')
res=dbFetch(res)
dbClearResult(dbListResults(con)[[1]])
claims=res

# calcolo importo medio del liquidato per peril

library(dplyr)
claims %>% 
  group_by(peril=Descrizione) %>%
  summarize(Mean_Cost=mean(ImportoLiquidato))

# calcolo numero di sinistri per peril

claims %>% 
  group_by(peril=Descrizione) %>%
  summarize(Num_Sx=length(ID))

# calcolo costo medio per peril con data.table

library(data.table)
claims=data.table(claims)
claims[,Mean_Cost:=mean(ImportoLiquidato),by=.(Peril=Descrizione)]

# calcolo il premio equo per peril 

claims[,D:=.N]
claims[,.(Equity_Premium=mean(ImportoLiquidato)*length(Descrizione)/unique(D)),by=.(Peril=Descrizione)]



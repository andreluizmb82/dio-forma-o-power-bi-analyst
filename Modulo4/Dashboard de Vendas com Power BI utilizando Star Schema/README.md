# DAX

## Tabela Calendário

- A tabela calendário é uma tabela foi gerada pela formula DAX abaixo:

```
Calendario =
var dataminima = DATE(YEAR(MIN(F_Vendas[Date])),1,1)
var datamaxima = DATE(YEAR(MAX(F_Vendas[Date])),1,1)
return
CALENDAR(dataminima, datamaxima)
```

- A coluna Data contem os dias, meses, e anos.

- A coluna Ano foi gerada pela formula DAX abaixo:

```
Ano = YEAR(Calendario[Data])
```

- A cluna Trimestre foi gerada pela formula DAX abaixo:

```
Trimestre = Calendario[Data].[Trimestre]
```

- A coluna Nome_Mes foi gerada pela formula DAX abaixo:

```
Nome_Mes = Calendario[Data].[Mês]
```

- A coluna Num_Mes foi gerada pela formula DAX abaixo:

```
Numero_Mes = MONTH(Calendario[Data])
```

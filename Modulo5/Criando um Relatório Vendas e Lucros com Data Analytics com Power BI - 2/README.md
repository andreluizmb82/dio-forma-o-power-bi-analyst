# Ultimo desafio

#### Nesse README.md eu pretendo deixar registrado as decisões tomadas durante o desenvolvimento do projeto e os passos executados para a sua realização.

## 1. Alteração de cabeçalho das colunas

Afim de facilitar o processo de execução de solução de desafio, decidi traduzir os nomes das colunas da planilha utilizada como base de dados.

| Original            | Traduzido           |
| ------------------- | ------------------- |
| Segment             | Segmento            |
| Country             | País                |
| Product             | Produto             |
| Discount Band       | Faixa de desconto   |
| Units Sold          | Unidades vendidas   |
| Manufacturing Price | Preço de fabricação |
| Sale Price          | Preço de venda      |
| Gross Sales         | Vendas brutas       |
| Discounts           | Desconto            |
| Sales               | Vendas              |
| COGS                | COGS\*              |
| Profit              | Lucro               |
| Date                | Data                |
| Month Number        | Número do mês       |
| Month Name          | Nome do mês         |
| Year                | Ano                 |

\*COGS (Cost of Goods Sold - Custo dos Produtos Vendidos): representa o custo direto associado à produção ou aquisição dos produtos vendidos pela empresa. Esse valor inclui os custos de materiais, fabricação e outros custos diretamente envolvidos na produção do produto, mas exclui custos indiretos como despesas administrativas e de marketing.

## 2. Criação de tabelas

A partir da planilha original, foram criadas a tabla fato e as tabelas dimensões.

A tabela fato foi criada com base nas colunas "Faixa de desconto", "Unidades vendidas", "Preço de fabricação", "Preço de venda", "Vendas brutas", "Desconto", "Vendas", "COGS", "Lucro", "Data" e as chaves estrangeiras das tabelas dimensões.

As tabelas dimensões foram criadas a partir das colunas "D_segmento", "D_país" e "D_produto" uma tabela para cada coluna.

A ultima tabela dimensão a ser criada foi a "D_calendário" por meio do seguite código M:

````
let
    // Definir o intervalo de datas desejado
    DataInicial = #date(2013, 1, 1),
    DataFinal = #date(2014, 12, 31),

    // Gerar uma lista de datas
    ListaDatas = List.Dates(DataInicial, Duration.Days(DataFinal - DataInicial) + 1, #duration(1, 0, 0, 0)),

    // Converter a lista de datas para uma tabela
    TabelaCalendario = Table.FromList(ListaDatas, Splitter.SplitByNothing()),

    // Renomear a coluna padrão para "Data"
    TabelaRenomeada = Table.RenameColumns(TabelaCalendario, {{"Column1", "Data"}}),

    // Adicionar colunas para Ano, Mês, Nome do Mês, Trimestre e Fim de Semana
    AdicionarAno = Table.AddColumn(TabelaRenomeada, "Ano", each Date.Year([Data]), Int64.Type),
    AdicionarMes = Table.AddColumn(AdicionarAno, "Mês", each Date.Month([Data]), Int64.Type),
    AdicionarNomeMes = Table.AddColumn(AdicionarMes, "Nome do Mês", each Date.ToText([Data], "MMMM"), type text),
    AdicionarTrimestre = Table.AddColumn(AdicionarNomeMes, "Trimestre", each "Q" & Text.From(Date.QuarterOfYear([Data])), type text),
    AdicionarDiaSemana = Table.AddColumn(AdicionarTrimestre, "Dia da Semana", each Date.DayOfWeek([Data], Day.Monday) + 1, Int64.Type),
    AdicionarNomeDia = Table.AddColumn(AdicionarDiaSemana, "Nome do Dia", each Date.ToText([Data], "dddd"), type text),

    // Adicionar coluna para indicar se é fim de semana (Sim ou Não)
    AdicionarFimDeSemana = Table.AddColumn(AdicionarNomeDia, "Fim de Semana", each if [Dia da Semana] >= 6 then "Sim" else "Não", type text)
in
    AdicionarFimDeSemana
    ```
````

## 3. Criação de relações entre as tabelas

As relações entre as tabelas foram criadas com base nas chaves estrangeiras das tabelas dimensões. E no caso da "D_calendário" foi criada uma relação com a tabela fato com base na coluna "Data" de ambas as tabelas.

## 4. Criação de medidas

Algumas medidas foram criadas afim de facilitar a visualização dos dados. Elas foram concentradas em uma tabela separada para facilitar a visualização e utilização.
Continuarei estudando, e a medida em que eu aprender novas técnicas e boas praticas, vou atualizar o projeto com novas medidas.

## 5. Criação de visualizações

Este bootcamp foi o meu primeiro contato com o Power BI, então ainda estou desenvolvendo um _"Mindset Business Intelligence"_, por isso a escolha das visuais foi feita de forma intuitiva, e não aplicando técnicas ou boas praticas de visuais de dados.

Contudo, busquei atender aos requisitos do desafio, e para isso, criei as seguintes visuais:

- Visuais sobre os TOP3 Produtos - **Na segunda página da solução**
- Principais países em termos de vendas e/ou profit (ou outro campo) - **Na terceira e quinta páginas da solução**
- Gráfico de dispersão sobre Unidades vendidas e Vendas por mês - **Na sexta página da solução**
- Visuais de agrupamentos de dados - **Na quinta página da solução**
- Visuais de compartimentação dos dados - **Na quarta página da solução**

## Conclusão

Este projeto foi uma ótima oportunidade para aprender e aplicar conceitos de Power BI, e também para desenvolver habilidades de análise de dados. Esse foi apenas o primeiro passo de minha jornada em Power BI, continuarei buscando aprender e aplicar conceitos de BI, e também desenvolver habilidades de análise de dados.

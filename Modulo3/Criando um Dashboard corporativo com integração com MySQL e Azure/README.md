# Transformação da fase de dados

Nesta fase, os dados são transformados para que sejam adequados para o processamento e análise.

## Tabela dependent

A tabela dependent é uma tabela que contém informações sobre os dependentes de um funcionário.

- Todos os campos foram importados com os tipos de dados corretos, não sendo necessária a conversão.

### Analise

- A tabela possui chave primaria composta, composta pelo id do funcionário e nome do dependente.
- Todos os campos foram importados com os tipos de dados corretos, não sendo necessária a conversão.
  - o campo Essn, que corresponde a chave primaria do funcionário, foi importado como um campo de texto, apesar de conter apenas dígitos, acreditei ser mais interessante manter o campo como texto, pois o mesmo corresponde ao Social Security Number, similar à CPF brasileiro.

## Tabela dept_locations

- A tabela dept_locations armazena informações sobre os locais de trabalho nos departamentos da empresa.
- Sua chave primaria é composta pelo id do departamento e local.
- Todos os campos foram importados com os tipos de dados corretos, não sendo necessária a conversão.

## Tabela employee

- A tabela employee é uma tabela que contém informações sobre os funcionários de uma empresa.
- o campo Ssn, que corresponde a chave primaria do funcionário, foi importado como um campo de texto, apesar de conter apenas dígitos, acreditei ser mais interessante manter o campo como texto, pois o mesmo corresponde ao Social Security Number, similar à CPF brasileiro.
- Foi encontrado um campo nulo na coluna Super_ssn, que corresponde ao Social Security Number do supervisor do funcionário. Este campo foi preenchido com o valor "NULL", pois o funcionário esta no topo da hierarquia, logo não possui supervisor.
- A coluna Salary, foi importada como número decimal, optei por trocar seu tipo para número decimal fixo, por ser mais adequado nesse contexto.
- A coluna Address era composto por campos multivalorados, então foi dividido em 4 campos separados, sendo eles: Street, Add-Number, City, State.

## Tabela project

- A tabela project é uma tabela que contém informações sobre os projetos de uma empresa.
- Ela possui uma chave primaria chamada de Pnumber.
- Todos os campos foram importados com os tipos de dados corretos, não sendo necessária a conversão.

## Tabela Works_on

- Esta tabela relaciona quanto tempo um funcionario trabalhou em um determinado projeto.
- Sua chave primaria é composta por Pno é a chave primaria da tabela project e Essn que é chave primaria da tabela employee.
- O campo Hours do funcionário 888665555 esta com 0h, isso se deve ao fato dele ser o gerente geral da empresa, logo supervisa todos os projetos, não trabalhando em nenhum projeto especifico. Este registro foi removido via filtro, para não interferir na analise dos dados.
- Todos os campos foram importados com os tipos de dados corretos, não sendo necessária a conversão.

## Tabela departament

- A tabela departament é uma tabela que contém informações sobre os departamentos da empresa.
- Ela possui uma chave primaria chamada de Dnumber.
- Todos os campos foram importados com os tipos de dados corretos, não sendo necessária a conversão.

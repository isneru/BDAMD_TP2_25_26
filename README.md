> [!WARNING]
>
> Este repositório serve apenas como bloco de notas pessoal/Second Brain para o desenvolvimento do projeto.

- [ ] **Desenvolver um Data Mart que permita a realização de análises variadas às vendas efetuadas aos clientes.**

![ER_Diagram](assets/ER_Diagram.png)

# Phase 1

## Kimball Dimensional Modelling

- **Área de Negócio:** Vendas (de produtos musicais)
- **Granularidade:** Uma linha por produto diferente numa fatura.
- **Dimensões:** DimDate; DimCustomer; DimEmployee; DimProduct;
- **Factos:** Quantity; UnitPrice; TotalLineAmount;

```plantuml
@startuml Dimensions
!theme plain
hide circle
skinparam linetype ortho

entity "FactSales" as fact {
  *SalesSK : int <<PK>>
  --
  *DateSK : int <<FK>>
  *ProductSK : int <<FK>>
  *CustomerSK : int <<FK>>
  *EmployeeSK : int <<FK>>
  --
  InvoiceID_DD : int
  --
  Quantity : int
  UnitPrice : money
  TotalLineAmount : money
}

entity "DimDate" as date {
  *Date: int <<PK>>
  FullDate: date
  Year: int
  Month: int
  MonthName: varchar
  Quarter: int
  DayOfWeek: varchar
  Semester: int
  Week: int
  DayNumberOfYear: int
  DayNumberOfMonth: int
  DayNumberOfWeek: int
  Weekend: boolean
}

entity "DimProduct" as prod {
  *ProductSK : int <<PK>>
  --
  ProductID_BK : int <<Business Key>>
  ProductName : varchar
  FamilyName : varchar
  EffectiveDate : datetime
  ExpiredDate : datetime
  IsCurrent : bit
}

entity "DimCustomer" as cust {
  *CustomerSK : int <<PK>>
  --
  CustomerID_BK : int <<Business Key>>
  CustomerName : varchar
  CustomerAddress : varchar
  CustomerType : varchar
  EffectiveDate : datetime
  ExpiredDate : datetime
  IsCurrent : bit
}

entity "DimEmployee" as emp {
  *EmployeeSK : int <<PK>>
  --
  EmployeeID_BK : int <<Business Key>>
  EmployeeName : varchar
  DepartmentName : varchar
}

date -down-|| fact
fact -down-|| prod
cust -right-|| fact
fact -right-|| emp

@enduml
```

# Phase 2

~~Assumindo que a base de dados disponibilizada pelo professor pode ser utilizada como a Staging Area~~ Utilizando a BD disponibilizada como a fonte de dados (e sem os alterar), estou a criar os scripts de criação das tabelas SQL para a Staging Area para seguir o tutorial do [Exercício 2](https://moodle.diogo.wtf/Base%20de%20Dados%20e%20Armaz%C3%A9m%20de%20Dados%2F11%20-%20Semana%20de%2024%20Nov%20a%2028%20Nov%2FExercise%202.zip) que, essencialmente automatiza a criação de uma BD Staging e corre $N$ scripts SQL que estão numa [pasta](SQLScripts/Staging) para criar as tabelas da Staging Area. (...)

# Phase 3

Utilizando o modelo dimensional criado na Fase 1, estou a criar os scripts SQL de ETL para popular o Data Mart a partir da Staging Area. Estes scripts estão na [pasta](SQLScripts/DataMart) e são executados por um script principal que automatiza o processo de ETL.

# Phase 4 (SSIS)

Utilizando o **Visual Studio 2022** e com ajuda do **SQL Server Management Studio** estou a criar um pacote SSIS que automatiza o processo de ETL (Extraction, Transformation e Loading), executando os scripts SQL criados na Fase 3.

~~Atualmente, o pacote cria a BD `Steinway_Staging`, executa os scripts de criação das tabelas e, por fim, "copia" os dados da `Steinway` para a `Steinway_Staging`.
A DB `Steinway_DataMart` e as suas tabelas também são criadas, mas como os dados ainda não sofreram **Transform**, não poderão ser carregados.~~

Seguindo o [Exercício 3](https://moodle.diogo.wtf/Base%20de%20Dados%20e%20Armaz%C3%A9m%20de%20Dados%2F12%20-%20Semana%20de%2001%20Dez%20a%2005%20Dez%2FExercise%203.zip), entende-se que a tabela `DimDate` difere entre as BD's **Staging** e **DataMart**:
> The Date dimension could have been created directly in our DataMart
> database (instead of the Staging Area). However, the Date
> dimension defined for our Data Mart project has different
> needs. It uses much less attributes and some of them are not
> present in the dimension just generated (as you’ll see next).
> From this Date dimension we will create a CSV file and complete
> this file with the attributes that are still missing for our Date
> dimension. In the future, you can use this CSV file in any Data
> Warehouse/Mart project to load the Date dimension table.

Atualmente, o projeto cria a BD `Steinway_Staging`, itera e executa os scripts de criação de tabelas da mesma e "copia" os conteúdos da BD Original. Com o exercício 3, foi criado um **Analysis Services Multidimensional Project** que permite automatizar a criação e inserção da tabela `DimDate` na DB **Staging**.

É criado também um segundo **Integration Services Project** com um único propósito: Ler a tabela `DimDate` da **Staging** para extrair para um ficheiro [`DimDate.csv`](Utils/DimDate.csv).

Após a adição manual de algumas colunas no ficheiro `.csv`, são feitas filtragens e mapeamentos para definir os conteúdos inseridos na `DimDate` da BD **DataMart**.

# Phase 5 (Transformation)

## Início do Exercício 4

Ao iniciar o [exercício 4](https://moodle.diogo.wtf/Base%20de%20Dados%20e%20Armaz%C3%A9m%20de%20Dados%2F13%20-%20Semana%20de%2008%20Dez%20a%2012%20Dez%2FExercise%204.zip), notei que a tabela da BD **Original** `Departaments` se encontrava mal escrita e então passei pelo processo de entender como poderia manipular as variáveis de forma a mudar apenas o nome da base de dados, sem mudar o conteúdo ou afetar a automatização das outras tabelas. A alteração foi bastante simples, mas para isso foi necessário aprender a utilizar a função de **debug** e **breakpoints** do Visual Studio.
Primeiramente, tomei iniciativa de corrigir as ocurrências do nome "Departaments" para "Departments" dentro do [script de criação da tabela](SQLScripts/Staging/CreateTableDepartaments.sql) **e mudar também o nome do ficheiro para haver consistência, o que estava errado**.
No começo do trabalho, eu decidi que o mais correto seria criar os scripts de criação das tabelas com o nome exato das tabelas da BD **Original**, independentemente do contexto.

### Porquê?

Neste projeto, a abordagem para o problema foi usar o nome dos ficheiros como método de extrair os nomes das tabelas da `Steinway`, e a `Steinway_Staging` visaria ter tabelas com esses mesmos nomes.
O impedimento começou aí: A tabela `Steinway.Departaments` criaria erradamente a `Steinway_Staging.Departaments`.

Problema ainda maior:
  - Se o nome do ficheiro fosse `CreateTableDepartments.sql`, não seguiria a convenção de ter o nome da BD **original**.
  - Se o nome do ficheiro fosse `CreateTableDepartaments.sql`, seguiria a convenção mas:
    - Se os conteúdos da criação da tabela fossem `Departaments`, estaria a continuar o erro da BD **original**.
    - Se os conteúdos da criação da tabela fossem `Departments`, a variável `User::TableName` seria `Departaments` (valor extraído do nome do ficheiro) e a inserção de dados não funcionaria.

### Solução

No container **Foreach Loop** para a inserção de dados, são atribuidos valores através do **Expression Task** que tem a seguinte expressão:

```
"IF EXISTS (SELECT * FROM Steinway.sys.tables WHERE name = '" + @[User::TableName] + "')
 BEGIN
    INSERT INTO [Steinway_Staging].[dbo].[" + REPLACE(@[User::TableName], "Departaments", "Departments") + "]
    SELECT * FROM [Steinway].[dbo].[" + @[User::TableName] + "]
END"  
```

Note-se que a variável `User::TableName` é usada várias vezes, mas apenas numa ocurrência se faz um `REPLACE(..., "Departaments", "Departments")`. Isto explica-se da seguinte forma:
Querendo ler a tabela `Steinway.Departaments` e inserir na `Steinway_Staging.Departments`, o valor de `User::TableName` continua a ser o nome da tabela da BD **Original**, então é necessário mudar o valor na tabela de destino.

Explicação visual:
```sql
-- @[User::TableName]                                         = "Departaments"
-- REPLACE(@[User::TableName], "Departaments", "Departments") = "Departments"

IF EXISTS (SELECT * FROM Steinway.sys.tables WHERE name = 'Departaments')
 BEGIN
    INSERT INTO [Steinway_Staging].[dbo].[Departments]
    SELECT * FROM [Steinway].[dbo].[Departaments]
END  
```

Durante este processo, reparei também que as tabelas dimensionais estavam bastante incompletas e até mesmo erradas, com menos atributos do que a própria **Staging**. Foram alterados os scripts de criação da **DataMart** para estarem de acordo com a seguinte fórmula:
$$
\text{Nº atributos DimTable} >= \text{Nº atributos StagingTable} + 4
$$

Onde o valor 4 da fórmula refere-se ao número de atributos convencionais das tabelas dimensionais:
  - `<model>`Key
  - EffectiveDate
  - ExpiredDate
  - isCurrent

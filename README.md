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

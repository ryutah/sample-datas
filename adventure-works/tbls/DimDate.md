# DimDate

## Description

## Columns

| Name | Type | Default | Nullable | Children | Parents | Comment |
| ---- | ---- | ------- | -------- | -------- | ------- | ------- |
| DateKey | int |  | false | [FactCallCenter](FactCallCenter.md) [FactCurrencyRate](FactCurrencyRate.md) [FactFinance](FactFinance.md) [FactInternetSales](FactInternetSales.md) [FactProductInventory](FactProductInventory.md) [FactResellerSales](FactResellerSales.md) [FactSalesQuota](FactSalesQuota.md) [FactSurveyResponse](FactSurveyResponse.md) |  |  |
| FullDateAlternateKey | date |  | false |  |  |  |
| DayNumberOfWeek | tinyint |  | false |  |  |  |
| EnglishDayNameOfWeek | nvarchar(10) |  | false |  |  |  |
| SpanishDayNameOfWeek | nvarchar(10) |  | false |  |  |  |
| FrenchDayNameOfWeek | nvarchar(10) |  | false |  |  |  |
| DayNumberOfMonth | tinyint |  | false |  |  |  |
| DayNumberOfYear | smallint |  | false |  |  |  |
| WeekNumberOfYear | tinyint |  | false |  |  |  |
| EnglishMonthName | nvarchar(10) |  | false |  |  |  |
| SpanishMonthName | nvarchar(10) |  | false |  |  |  |
| FrenchMonthName | nvarchar(10) |  | false |  |  |  |
| MonthNumberOfYear | tinyint |  | false |  |  |  |
| CalendarQuarter | tinyint |  | false |  |  |  |
| CalendarYear | smallint |  | false |  |  |  |
| CalendarSemester | tinyint |  | false |  |  |  |
| FiscalQuarter | tinyint |  | false |  |  |  |
| FiscalYear | smallint |  | false |  |  |  |
| FiscalSemester | tinyint |  | false |  |  |  |

## Constraints

| Name | Type | Definition |
| ---- | ---- | ---------- |
| PK_DimDate_DateKey | PRIMARY KEY | CLUSTERED, unique, part of a PRIMARY KEY constraint, [ DateKey ] |

## Indexes

| Name | Definition |
| ---- | ---------- |
| PK_DimDate_DateKey | CLUSTERED, unique, part of a PRIMARY KEY constraint, [ DateKey ] |
| AK_DimDate_FullDateAlternateKey | NONCLUSTERED, unique, [ FullDateAlternateKey ] |

## Relations

```mermaid
erDiagram

"FactCallCenter" }o--|| "DimDate" : ""
"FactCurrencyRate" }o--|| "DimDate" : ""
"FactFinance" }o--|| "DimDate" : ""
"FactInternetSales" }o--|| "DimDate" : ""
"FactInternetSales" }o--|| "DimDate" : ""
"FactInternetSales" }o--|| "DimDate" : ""
"FactProductInventory" }o--|| "DimDate" : ""
"FactResellerSales" }o--|| "DimDate" : ""
"FactResellerSales" }o--|| "DimDate" : ""
"FactResellerSales" }o--|| "DimDate" : ""
"FactSalesQuota" }o--|| "DimDate" : ""
"FactSurveyResponse" }o--|| "DimDate" : ""

"DimDate" {
  int DateKey PK
  date FullDateAlternateKey
  tinyint DayNumberOfWeek
  nvarchar_10_ EnglishDayNameOfWeek
  nvarchar_10_ SpanishDayNameOfWeek
  nvarchar_10_ FrenchDayNameOfWeek
  tinyint DayNumberOfMonth
  smallint DayNumberOfYear
  tinyint WeekNumberOfYear
  nvarchar_10_ EnglishMonthName
  nvarchar_10_ SpanishMonthName
  nvarchar_10_ FrenchMonthName
  tinyint MonthNumberOfYear
  tinyint CalendarQuarter
  smallint CalendarYear
  tinyint CalendarSemester
  tinyint FiscalQuarter
  smallint FiscalYear
  tinyint FiscalSemester
}
"FactCallCenter" {
  int FactCallCenterID PK
  int DateKey FK
  nvarchar_15_ WageType
  nvarchar_20_ Shift
  smallint LevelOneOperators
  smallint LevelTwoOperators
  smallint TotalOperators
  int Calls
  int AutomaticResponses
  int Orders
  smallint IssuesRaised
  smallint AverageTimePerIssue
  float ServiceGrade
  datetime Date
}
"FactCurrencyRate" {
  int CurrencyKey PK
  int DateKey PK
  float AverageRate
  float EndOfDayRate
  datetime Date
}
"FactFinance" {
  int FinanceKey
  int DateKey FK
  int OrganizationKey FK
  int DepartmentGroupKey FK
  int ScenarioKey FK
  int AccountKey FK
  float Amount
  datetime Date
}
"FactInternetSales" {
  int ProductKey FK
  int OrderDateKey FK
  int DueDateKey FK
  int ShipDateKey FK
  int CustomerKey FK
  int PromotionKey FK
  int CurrencyKey FK
  int SalesTerritoryKey FK
  nvarchar_20_ SalesOrderNumber PK
  tinyint SalesOrderLineNumber PK
  tinyint RevisionNumber
  smallint OrderQuantity
  money UnitPrice
  money ExtendedAmount
  float UnitPriceDiscountPct
  float DiscountAmount
  money ProductStandardCost
  money TotalProductCost
  money SalesAmount
  money TaxAmt
  money Freight
  nvarchar_25_ CarrierTrackingNumber
  nvarchar_25_ CustomerPONumber
  datetime OrderDate
  datetime DueDate
  datetime ShipDate
}
"FactProductInventory" {
  int ProductKey PK
  int DateKey PK
  date MovementDate
  money UnitCost
  int UnitsIn
  int UnitsOut
  int UnitsBalance
}
"FactResellerSales" {
  int ProductKey FK
  int OrderDateKey FK
  int DueDateKey FK
  int ShipDateKey FK
  int ResellerKey FK
  int EmployeeKey FK
  int PromotionKey FK
  int CurrencyKey FK
  int SalesTerritoryKey FK
  nvarchar_20_ SalesOrderNumber PK
  tinyint SalesOrderLineNumber PK
  tinyint RevisionNumber
  smallint OrderQuantity
  money UnitPrice
  money ExtendedAmount
  float UnitPriceDiscountPct
  float DiscountAmount
  money ProductStandardCost
  money TotalProductCost
  money SalesAmount
  money TaxAmt
  money Freight
  nvarchar_25_ CarrierTrackingNumber
  nvarchar_25_ CustomerPONumber
  datetime OrderDate
  datetime DueDate
  datetime ShipDate
}
"FactSalesQuota" {
  int SalesQuotaKey PK
  int EmployeeKey FK
  int DateKey FK
  smallint CalendarYear
  tinyint CalendarQuarter
  money SalesAmountQuota
  datetime Date
}
"FactSurveyResponse" {
  int SurveyResponseKey PK
  int DateKey FK
  int CustomerKey FK
  int ProductCategoryKey
  nvarchar_50_ EnglishProductCategoryName
  int ProductSubcategoryKey
  nvarchar_50_ EnglishProductSubcategoryName
  datetime Date
}
```

---

> Generated by [tbls](https://github.com/k1LoW/tbls)

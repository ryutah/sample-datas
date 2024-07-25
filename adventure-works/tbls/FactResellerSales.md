# FactResellerSales

## Description

## Columns

| Name | Type | Default | Nullable | Children | Parents | Comment |
| ---- | ---- | ------- | -------- | -------- | ------- | ------- |
| ProductKey | int |  | false |  | [DimProduct](DimProduct.md) |  |
| OrderDateKey | int |  | false |  | [DimDate](DimDate.md) |  |
| DueDateKey | int |  | false |  | [DimDate](DimDate.md) |  |
| ShipDateKey | int |  | false |  | [DimDate](DimDate.md) |  |
| ResellerKey | int |  | false |  | [DimReseller](DimReseller.md) |  |
| EmployeeKey | int |  | false |  | [DimEmployee](DimEmployee.md) |  |
| PromotionKey | int |  | false |  | [DimPromotion](DimPromotion.md) |  |
| CurrencyKey | int |  | false |  | [DimCurrency](DimCurrency.md) |  |
| SalesTerritoryKey | int |  | false |  | [DimSalesTerritory](DimSalesTerritory.md) |  |
| SalesOrderNumber | nvarchar(20) |  | false |  |  |  |
| SalesOrderLineNumber | tinyint |  | false |  |  |  |
| RevisionNumber | tinyint |  | true |  |  |  |
| OrderQuantity | smallint |  | true |  |  |  |
| UnitPrice | money |  | true |  |  |  |
| ExtendedAmount | money |  | true |  |  |  |
| UnitPriceDiscountPct | float |  | true |  |  |  |
| DiscountAmount | float |  | true |  |  |  |
| ProductStandardCost | money |  | true |  |  |  |
| TotalProductCost | money |  | true |  |  |  |
| SalesAmount | money |  | true |  |  |  |
| TaxAmt | money |  | true |  |  |  |
| Freight | money |  | true |  |  |  |
| CarrierTrackingNumber | nvarchar(25) |  | true |  |  |  |
| CustomerPONumber | nvarchar(25) |  | true |  |  |  |
| OrderDate | datetime |  | true |  |  |  |
| DueDate | datetime |  | true |  |  |  |
| ShipDate | datetime |  | true |  |  |  |

## Constraints

| Name | Type | Definition |
| ---- | ---- | ---------- |
| PK_FactResellerSales_SalesOrderNumber_SalesOrderLineNumber | PRIMARY KEY | CLUSTERED, unique, part of a PRIMARY KEY constraint, [ SalesOrderNumber, SalesOrderLineNumber ] |
| FK_FactResellerSales_DimCurrency | FOREIGN KEY | FOREIGN KEY(CurrencyKey) REFERENCES DimCurrency(CurrencyKey) ON UPDATE NO_ACTION ON DELETE NO_ACTION |
| FK_FactResellerSales_DimDate | FOREIGN KEY | FOREIGN KEY(OrderDateKey) REFERENCES DimDate(DateKey) ON UPDATE NO_ACTION ON DELETE NO_ACTION |
| FK_FactResellerSales_DimDate1 | FOREIGN KEY | FOREIGN KEY(DueDateKey) REFERENCES DimDate(DateKey) ON UPDATE NO_ACTION ON DELETE NO_ACTION |
| FK_FactResellerSales_DimDate2 | FOREIGN KEY | FOREIGN KEY(ShipDateKey) REFERENCES DimDate(DateKey) ON UPDATE NO_ACTION ON DELETE NO_ACTION |
| FK_FactResellerSales_DimEmployee | FOREIGN KEY | FOREIGN KEY(EmployeeKey) REFERENCES DimEmployee(EmployeeKey) ON UPDATE NO_ACTION ON DELETE NO_ACTION |
| FK_FactResellerSales_DimProduct | FOREIGN KEY | FOREIGN KEY(ProductKey) REFERENCES DimProduct(ProductKey) ON UPDATE NO_ACTION ON DELETE NO_ACTION |
| FK_FactResellerSales_DimPromotion | FOREIGN KEY | FOREIGN KEY(PromotionKey) REFERENCES DimPromotion(PromotionKey) ON UPDATE NO_ACTION ON DELETE NO_ACTION |
| FK_FactResellerSales_DimReseller | FOREIGN KEY | FOREIGN KEY(ResellerKey) REFERENCES DimReseller(ResellerKey) ON UPDATE NO_ACTION ON DELETE NO_ACTION |
| FK_FactResellerSales_DimSalesTerritory | FOREIGN KEY | FOREIGN KEY(SalesTerritoryKey) REFERENCES DimSalesTerritory(SalesTerritoryKey) ON UPDATE NO_ACTION ON DELETE NO_ACTION |

## Indexes

| Name | Definition |
| ---- | ---------- |
| PK_FactResellerSales_SalesOrderNumber_SalesOrderLineNumber | CLUSTERED, unique, part of a PRIMARY KEY constraint, [ SalesOrderNumber, SalesOrderLineNumber ] |

## Relations

```mermaid
erDiagram

"FactResellerSales" }o--|| "DimProduct" : ""
"FactResellerSales" }o--|| "DimDate" : ""
"FactResellerSales" }o--|| "DimDate" : ""
"FactResellerSales" }o--|| "DimDate" : ""
"FactResellerSales" }o--|| "DimReseller" : ""
"FactResellerSales" }o--|| "DimEmployee" : ""
"FactResellerSales" }o--|| "DimPromotion" : ""
"FactResellerSales" }o--|| "DimCurrency" : ""
"FactResellerSales" }o--|| "DimSalesTerritory" : ""

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
"DimProduct" {
  int ProductKey PK
  nvarchar_25_ ProductAlternateKey
  int ProductSubcategoryKey FK
  nchar WeightUnitMeasureCode
  nchar SizeUnitMeasureCode
  nvarchar_50_ EnglishProductName
  nvarchar_50_ SpanishProductName
  nvarchar_50_ FrenchProductName
  money StandardCost
  bit FinishedGoodsFlag
  nvarchar_15_ Color
  smallint SafetyStockLevel
  smallint ReorderPoint
  money ListPrice
  nvarchar_50_ Size
  nvarchar_50_ SizeRange
  float Weight
  int DaysToManufacture
  nchar ProductLine
  money DealerPrice
  nchar Class
  nchar Style
  nvarchar_50_ ModelName
  varbinary_MAX_ LargePhoto
  nvarchar_400_ EnglishDescription
  nvarchar_400_ FrenchDescription
  nvarchar_400_ ChineseDescription
  nvarchar_400_ ArabicDescription
  nvarchar_400_ HebrewDescription
  nvarchar_400_ ThaiDescription
  nvarchar_400_ GermanDescription
  nvarchar_400_ JapaneseDescription
  nvarchar_400_ TurkishDescription
  datetime StartDate
  datetime EndDate
  nvarchar_7_ Status
}
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
"DimReseller" {
  int ResellerKey PK
  int GeographyKey FK
  nvarchar_15_ ResellerAlternateKey
  nvarchar_25_ Phone
  varchar_20_ BusinessType
  nvarchar_50_ ResellerName
  int NumberEmployees
  char OrderFrequency
  tinyint OrderMonth
  int FirstOrderYear
  int LastOrderYear
  nvarchar_50_ ProductLine
  nvarchar_60_ AddressLine1
  nvarchar_60_ AddressLine2
  money AnnualSales
  nvarchar_50_ BankName
  tinyint MinPaymentType
  money MinPaymentAmount
  money AnnualRevenue
  int YearOpened
}
"DimEmployee" {
  int EmployeeKey PK
  int ParentEmployeeKey FK
  nvarchar_15_ EmployeeNationalIDAlternateKey
  nvarchar_15_ ParentEmployeeNationalIDAlternateKey
  int SalesTerritoryKey FK
  nvarchar_50_ FirstName
  nvarchar_50_ LastName
  nvarchar_50_ MiddleName
  bit NameStyle
  nvarchar_50_ Title
  date HireDate
  date BirthDate
  nvarchar_256_ LoginID
  nvarchar_50_ EmailAddress
  nvarchar_25_ Phone
  nchar MaritalStatus
  nvarchar_50_ EmergencyContactName
  nvarchar_25_ EmergencyContactPhone
  bit SalariedFlag
  nchar Gender
  tinyint PayFrequency
  money BaseRate
  smallint VacationHours
  smallint SickLeaveHours
  bit CurrentFlag
  bit SalesPersonFlag
  nvarchar_50_ DepartmentName
  date StartDate
  date EndDate
  nvarchar_50_ Status
  varbinary_MAX_ EmployeePhoto
}
"DimPromotion" {
  int PromotionKey PK
  int PromotionAlternateKey
  nvarchar_255_ EnglishPromotionName
  nvarchar_255_ SpanishPromotionName
  nvarchar_255_ FrenchPromotionName
  float DiscountPct
  nvarchar_50_ EnglishPromotionType
  nvarchar_50_ SpanishPromotionType
  nvarchar_50_ FrenchPromotionType
  nvarchar_50_ EnglishPromotionCategory
  nvarchar_50_ SpanishPromotionCategory
  nvarchar_50_ FrenchPromotionCategory
  datetime StartDate
  datetime EndDate
  int MinQty
  int MaxQty
}
"DimCurrency" {
  int CurrencyKey PK
  nchar CurrencyAlternateKey
  nvarchar_50_ CurrencyName
}
"DimSalesTerritory" {
  int SalesTerritoryKey PK
  int SalesTerritoryAlternateKey
  nvarchar_50_ SalesTerritoryRegion
  nvarchar_50_ SalesTerritoryCountry
  nvarchar_50_ SalesTerritoryGroup
  varbinary_MAX_ SalesTerritoryImage
}
```

---

> Generated by [tbls](https://github.com/k1LoW/tbls)

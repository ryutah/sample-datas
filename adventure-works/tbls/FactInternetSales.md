# FactInternetSales

## Description

## Columns

| Name | Type | Default | Nullable | Children | Parents | Comment |
| ---- | ---- | ------- | -------- | -------- | ------- | ------- |
| ProductKey | int |  | false |  | [DimProduct](DimProduct.md) |  |
| OrderDateKey | int |  | false |  | [DimDate](DimDate.md) |  |
| DueDateKey | int |  | false |  | [DimDate](DimDate.md) |  |
| ShipDateKey | int |  | false |  | [DimDate](DimDate.md) |  |
| CustomerKey | int |  | false |  | [DimCustomer](DimCustomer.md) |  |
| PromotionKey | int |  | false |  | [DimPromotion](DimPromotion.md) |  |
| CurrencyKey | int |  | false |  | [DimCurrency](DimCurrency.md) |  |
| SalesTerritoryKey | int |  | false |  | [DimSalesTerritory](DimSalesTerritory.md) |  |
| SalesOrderNumber | nvarchar(20) |  | false | [FactInternetSalesReason](FactInternetSalesReason.md) |  |  |
| SalesOrderLineNumber | tinyint |  | false | [FactInternetSalesReason](FactInternetSalesReason.md) |  |  |
| RevisionNumber | tinyint |  | false |  |  |  |
| OrderQuantity | smallint |  | false |  |  |  |
| UnitPrice | money |  | false |  |  |  |
| ExtendedAmount | money |  | false |  |  |  |
| UnitPriceDiscountPct | float |  | false |  |  |  |
| DiscountAmount | float |  | false |  |  |  |
| ProductStandardCost | money |  | false |  |  |  |
| TotalProductCost | money |  | false |  |  |  |
| SalesAmount | money |  | false |  |  |  |
| TaxAmt | money |  | false |  |  |  |
| Freight | money |  | false |  |  |  |
| CarrierTrackingNumber | nvarchar(25) |  | true |  |  |  |
| CustomerPONumber | nvarchar(25) |  | true |  |  |  |
| OrderDate | datetime |  | true |  |  |  |
| DueDate | datetime |  | true |  |  |  |
| ShipDate | datetime |  | true |  |  |  |

## Constraints

| Name | Type | Definition |
| ---- | ---- | ---------- |
| PK_FactInternetSales_SalesOrderNumber_SalesOrderLineNumber | PRIMARY KEY | CLUSTERED, unique, part of a PRIMARY KEY constraint, [ SalesOrderNumber, SalesOrderLineNumber ] |
| FK_FactInternetSales_DimCurrency | FOREIGN KEY | FOREIGN KEY(CurrencyKey) REFERENCES DimCurrency(CurrencyKey) ON UPDATE NO_ACTION ON DELETE NO_ACTION |
| FK_FactInternetSales_DimCustomer | FOREIGN KEY | FOREIGN KEY(CustomerKey) REFERENCES DimCustomer(CustomerKey) ON UPDATE NO_ACTION ON DELETE NO_ACTION |
| FK_FactInternetSales_DimDate | FOREIGN KEY | FOREIGN KEY(OrderDateKey) REFERENCES DimDate(DateKey) ON UPDATE NO_ACTION ON DELETE NO_ACTION |
| FK_FactInternetSales_DimDate1 | FOREIGN KEY | FOREIGN KEY(DueDateKey) REFERENCES DimDate(DateKey) ON UPDATE NO_ACTION ON DELETE NO_ACTION |
| FK_FactInternetSales_DimDate2 | FOREIGN KEY | FOREIGN KEY(ShipDateKey) REFERENCES DimDate(DateKey) ON UPDATE NO_ACTION ON DELETE NO_ACTION |
| FK_FactInternetSales_DimProduct | FOREIGN KEY | FOREIGN KEY(ProductKey) REFERENCES DimProduct(ProductKey) ON UPDATE NO_ACTION ON DELETE NO_ACTION |
| FK_FactInternetSales_DimPromotion | FOREIGN KEY | FOREIGN KEY(PromotionKey) REFERENCES DimPromotion(PromotionKey) ON UPDATE NO_ACTION ON DELETE NO_ACTION |
| FK_FactInternetSales_DimSalesTerritory | FOREIGN KEY | FOREIGN KEY(SalesTerritoryKey) REFERENCES DimSalesTerritory(SalesTerritoryKey) ON UPDATE NO_ACTION ON DELETE NO_ACTION |

## Indexes

| Name | Definition |
| ---- | ---------- |
| PK_FactInternetSales_SalesOrderNumber_SalesOrderLineNumber | CLUSTERED, unique, part of a PRIMARY KEY constraint, [ SalesOrderNumber, SalesOrderLineNumber ] |

## Relations

```mermaid
erDiagram

"FactInternetSales" }o--|| "DimProduct" : ""
"FactInternetSales" }o--|| "DimDate" : ""
"FactInternetSales" }o--|| "DimDate" : ""
"FactInternetSales" }o--|| "DimDate" : ""
"FactInternetSales" }o--|| "DimCustomer" : ""
"FactInternetSales" }o--|| "DimPromotion" : ""
"FactInternetSales" }o--|| "DimCurrency" : ""
"FactInternetSales" }o--|| "DimSalesTerritory" : ""
"FactInternetSalesReason" }o--|| "FactInternetSales" : ""

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
"DimCustomer" {
  int CustomerKey PK
  int GeographyKey FK
  nvarchar_15_ CustomerAlternateKey
  nvarchar_8_ Title
  nvarchar_50_ FirstName
  nvarchar_50_ MiddleName
  nvarchar_50_ LastName
  bit NameStyle
  date BirthDate
  nchar MaritalStatus
  nvarchar_10_ Suffix
  nvarchar_1_ Gender
  nvarchar_50_ EmailAddress
  money YearlyIncome
  tinyint TotalChildren
  tinyint NumberChildrenAtHome
  nvarchar_40_ EnglishEducation
  nvarchar_40_ SpanishEducation
  nvarchar_40_ FrenchEducation
  nvarchar_100_ EnglishOccupation
  nvarchar_100_ SpanishOccupation
  nvarchar_100_ FrenchOccupation
  nchar HouseOwnerFlag
  tinyint NumberCarsOwned
  nvarchar_120_ AddressLine1
  nvarchar_120_ AddressLine2
  nvarchar_20_ Phone
  date DateFirstPurchase
  nvarchar_15_ CommuteDistance
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
"FactInternetSalesReason" {
  nvarchar_20_ SalesOrderNumber PK
  tinyint SalesOrderLineNumber PK
  int SalesReasonKey PK
}
```

---

> Generated by [tbls](https://github.com/k1LoW/tbls)

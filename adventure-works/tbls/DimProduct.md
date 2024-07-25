# DimProduct

## Description

## Columns

| Name | Type | Default | Nullable | Children | Parents | Comment |
| ---- | ---- | ------- | -------- | -------- | ------- | ------- |
| ProductKey | int |  | false | [FactInternetSales](FactInternetSales.md) [FactProductInventory](FactProductInventory.md) [FactResellerSales](FactResellerSales.md) |  |  |
| ProductAlternateKey | nvarchar(25) |  | true |  |  |  |
| ProductSubcategoryKey | int |  | true |  | [DimProductSubcategory](DimProductSubcategory.md) |  |
| WeightUnitMeasureCode | nchar |  | true |  |  |  |
| SizeUnitMeasureCode | nchar |  | true |  |  |  |
| EnglishProductName | nvarchar(50) |  | false |  |  |  |
| SpanishProductName | nvarchar(50) |  | false |  |  |  |
| FrenchProductName | nvarchar(50) |  | false |  |  |  |
| StandardCost | money |  | true |  |  |  |
| FinishedGoodsFlag | bit |  | false |  |  |  |
| Color | nvarchar(15) |  | false |  |  |  |
| SafetyStockLevel | smallint |  | true |  |  |  |
| ReorderPoint | smallint |  | true |  |  |  |
| ListPrice | money |  | true |  |  |  |
| Size | nvarchar(50) |  | true |  |  |  |
| SizeRange | nvarchar(50) |  | true |  |  |  |
| Weight | float |  | true |  |  |  |
| DaysToManufacture | int |  | true |  |  |  |
| ProductLine | nchar |  | true |  |  |  |
| DealerPrice | money |  | true |  |  |  |
| Class | nchar |  | true |  |  |  |
| Style | nchar |  | true |  |  |  |
| ModelName | nvarchar(50) |  | true |  |  |  |
| LargePhoto | varbinary(MAX) |  | true |  |  |  |
| EnglishDescription | nvarchar(400) |  | true |  |  |  |
| FrenchDescription | nvarchar(400) |  | true |  |  |  |
| ChineseDescription | nvarchar(400) |  | true |  |  |  |
| ArabicDescription | nvarchar(400) |  | true |  |  |  |
| HebrewDescription | nvarchar(400) |  | true |  |  |  |
| ThaiDescription | nvarchar(400) |  | true |  |  |  |
| GermanDescription | nvarchar(400) |  | true |  |  |  |
| JapaneseDescription | nvarchar(400) |  | true |  |  |  |
| TurkishDescription | nvarchar(400) |  | true |  |  |  |
| StartDate | datetime |  | true |  |  |  |
| EndDate | datetime |  | true |  |  |  |
| Status | nvarchar(7) |  | true |  |  |  |

## Constraints

| Name | Type | Definition |
| ---- | ---- | ---------- |
| PK_DimProduct_ProductKey | PRIMARY KEY | CLUSTERED, unique, part of a PRIMARY KEY constraint, [ ProductKey ] |
| AK_DimProduct_ProductAlternateKey_StartDate | UNIQUE | NONCLUSTERED, unique, part of a UNIQUE constraint, [ ProductAlternateKey, StartDate ] |
| FK_DimProduct_DimProductSubcategory | FOREIGN KEY | FOREIGN KEY(ProductSubcategoryKey) REFERENCES DimProductSubcategory(ProductSubcategoryKey) ON UPDATE NO_ACTION ON DELETE NO_ACTION |

## Indexes

| Name | Definition |
| ---- | ---------- |
| PK_DimProduct_ProductKey | CLUSTERED, unique, part of a PRIMARY KEY constraint, [ ProductKey ] |
| AK_DimProduct_ProductAlternateKey_StartDate | NONCLUSTERED, unique, part of a UNIQUE constraint, [ ProductAlternateKey, StartDate ] |

## Relations

```mermaid
erDiagram

"FactInternetSales" }o--|| "DimProduct" : ""
"FactProductInventory" }o--|| "DimProduct" : ""
"FactResellerSales" }o--|| "DimProduct" : ""
"DimProduct" }o--o| "DimProductSubcategory" : ""

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
"DimProductSubcategory" {
  int ProductSubcategoryKey PK
  int ProductSubcategoryAlternateKey
  nvarchar_50_ EnglishProductSubcategoryName
  nvarchar_50_ SpanishProductSubcategoryName
  nvarchar_50_ FrenchProductSubcategoryName
  int ProductCategoryKey FK
}
```

---

> Generated by [tbls](https://github.com/k1LoW/tbls)

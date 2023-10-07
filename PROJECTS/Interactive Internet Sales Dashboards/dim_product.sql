
SELECT [ProductKey]
      ,[ProductAlternateKey] as ProductItemCode
      --,[ProductSubcategoryKey]
      --,[WeightUnitMeasureCode]
      --,[SizeUnitMeasureCode]
      ,[EnglishProductName] as [Product Name]
	  , ps.EnglishProductSubcategoryName as [Sub Category]
	  , pc.EnglishProductCategoryName as [Product Category]
      --,[SpanishProductName]
      --,[FrenchProductName]
      --,[StandardCost]
      --,[FinishedGoodsFlag]
      ,[Color] as [Product Color]
      --,[SafetyStockLevel]
      --,[ReorderPoint]
      --,[ListPrice]
      ,[Size] as [Product Size]
      --,[SizeRange]
      --,[Weight]
      --,[DaysToManufacture]
      ,[ProductLine] as [Product Model Name]
      --,[DealerPrice]
      --,[Class]
      --,[Style]
      ,[ModelName] as [Product Model Name]
      --,[LargePhoto]
      ,[EnglishDescription] as [Product Description]
     /* ,[FrenchDescription]
      ,[ChineseDescription]
      ,[ArabicDescription]
      ,[HebrewDescription]
      ,[ThaiDescription]
      ,[GermanDescription]
      ,[JapaneseDescription]
      ,[TurkishDescription]
      ,[StartDate]
      ,[EndDate]*/
      , ISNULL([Status] , 'Outdated') as ProductStatus
  FROM [AdventureWorksDW2022].[dbo].[DimProduct] as p
  left join [AdventureWorksDW2022].[dbo].DimProductSubcategory as ps on ps.ProductSubcategoryKey = p.ProductSubcategoryKey
  left join [AdventureWorksDW2022].[dbo].DimProductCategory as pc on ps.ProductCategoryKey = pc.ProductCategoryAlternateKey
  order by
  p.ProductKey
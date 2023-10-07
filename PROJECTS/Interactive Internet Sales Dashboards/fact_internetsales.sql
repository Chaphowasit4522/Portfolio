SELECT [ProductKey]
      ,[OrderDateKey]
      ,[DueDateKey]
      ,[ShipDateKey]

      ,[CustomerKey]
      --,[PromotionKey]
      --,[CurrencyKey]
      --,[SalesTerritoryKey]
      ,[SalesOrderNumber]
      /*,[SalesOrderLineNumber]
      ,[RevisionNumber]
      ,[OrderQuantity]
      ,[UnitPrice]
      ,[ExtendedAmount]
      ,[UnitPriceDiscountPct]
      ,[DiscountAmount]
      ,[ProductStandardCost]
      ,[TotalProductCost]*/
      ,[SalesAmount]
      /*,[TaxAmt]
      ,[Freight]
      ,[CarrierTrackingNumber]
      ,[CustomerPONumber]
      ,[OrderDate]
      ,[DueDate]
      ,[ShipDate]*/
  FROM [AdventureWorksDW2022].[dbo].[FactInternetSales]
  WHERE
	left(OrderDateKey,4) >= Year(GETDATE()) - 4
  ORDER BY 
	OrderDateKey
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
  [CustomerKey] CustomerKey --,[GeographyKey]
  --,[CustomerAlternateKey]
  --,[Title]
  , 
  [FirstName] FirstName --,[MiddleName] 
  , 
  [LastName] LastName, 
  [FirstName] + ' ' + [LastName] FullName --,[NameStyle]
  --,[BirthDate]
  --,[MaritalStatus]
  --,[Suffix]
  , 
  case [Gender] when 'M' THEN 'Male' when 'F' then 'Female' else [Gender] end Gender, 
  [gender] Test --,[EmailAddress]
  --,[YearlyIncome]
  --,[TotalChildren]
  --,[NumberChildrenAtHome]
  --,[EnglishEducation]
  --,[SpanishEducation]
  --,[FrenchEducation]
  --,[EnglishOccupation]
  -- ,[SpanishOccupation]
  --,[FrenchOccupation]
  --,[HouseOwnerFlag]
  --,[NumberCarsOwned]
  --,[AddressLine1]
  --,[AddressLine2]
  --,[Phone]
  , 
  [DateFirstPurchase] --,[CommuteDistance]
  , 
  g.City Customer_City 
FROM 
  [AdventureWorksDW2022].[dbo].[DimCustomer] C 
  Left join [AdventureWorksDW2022].[dbo].DimGeography G on C.GeographyKey = G.GeographyKey 
order by 
  CustomerKey

-- Cleansed DIM_DateTable
SELECT 
  [DateKey], 
  [FullDateAlternateKey] as Date
  --,[DayNumberOfWeek]
  , 
  [EnglishDayNameOfWeek] as  Day
  --,[SpanishDayNameOfWeek]
  --,[FrenchDayNameOfWeek]
  --,[DayNumberOfMonth]
  --,[DayNumberOfYear]
  , 
  [WeekNumberOfYear] as WeekNr, 
  [EnglishMonthName] as Month
  --,[SpanishMonthName]
  --,[FrenchMonthName]
  , Left([EnglishMonthName] , 3) as MonthShort ,
  [MonthNumberOfYear] as MonthNo, 
  [CalendarQuarter] as Quarter, 
  [CalendarYear]  as Year
  --,[CalendarSemester]
  --,[FiscalQuarter]
  --,[FiscalYear]
  --,[FiscalSemester]
FROM 
  [AdventureWorksDW2022].[dbo].[DimDate]
WHERE CalendarYear >= 2019

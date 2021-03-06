USE [C226233_subscribe_ca]
GO
/****** Object:  StoredProcedure [dbo].[sp_NSK_Retrive]    Script Date: 12/17/2013 3:17:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
 
--  	[dbo].[sp_NSK_Retrive] 
 
-- =============================================
 
	SET NOCOUNT ON;

    -- Insert statements for procedure here

SELECT        dbo.NSK_subscription.FirstName, dbo.NSK_subscription.LastName, dbo.NSK_subscription.Title, dbo.NSK_subscription.Company, 
                         dbo.NSK_subscription.Address, dbo.NSK_subscription.City, dbo.NSK_subscription.Province, dbo.NSK_subscription.Country, 
                         dbo.NSK_subscription.Postal AS [Postal/Zip], 
                         CASE dbo.NSK_subscription.Phone_ext WHEN 'N/A' THEN dbo.NSK_subscription.Phone_area + N'-' + dbo.NSK_subscription.phone_no ELSE dbo.NSK_subscription.Phone_area
                          + N'-' + dbo.NSK_subscription.phone_no + N' ext. ' + dbo.NSK_subscription.Phone_ext END AS Phone, dbo.NSK_subscription.Email, 
                         dbo.NSK_Category.Category AS Request_Item, dbo.NSK_subscription.SourceEntry, CONVERT(datetime, dbo.NSK_subscription.stuffRequestDate, 106) 
                         AS Request_date, CASE dbo.NSK_subscription.Subscribe WHEN 1 THEN 'Yes' ELSE 'No' END AS eNewsletter_Subscribed
FROM            dbo.NSK_Category INNER JOIN
                         dbo.NSK_SourceEntry ON dbo.NSK_Category.CategoryID = dbo.NSK_SourceEntry.NSK_CategoryID RIGHT OUTER JOIN
                         dbo.NSK_subscription ON dbo.NSK_SourceEntry.SourceEntry = dbo.NSK_subscription.SourceEntry
WHERE        (dbo.NSK_subscription.stuffRequest = 1) 
AND (dbo.NSK_subscription.FirstName NOT LIKE '%test%' ) 
AND (dbo.NSK_subscription.LastName NOT LIKE '%test%')
AND (dbo.NSK_subscription.stuffRequestDate > '2014-09-01')
ORDER BY Request_date DESC

 


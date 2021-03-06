USE [C226233_subscribe_ca]
GO
/****** Object:  StoredProcedure [dbo].[sp_CNSK_Retrive]    Script Date: 12/17/2013 3:16:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
--  
--  [dbo].[sp_CNSK_Retrive] 
--  review 20150221
-- =============================================
 
	SET NOCOUNT ON;

    -- Insert statements for procedure here

SELECT        dbo.CNSK_ENL_subscribe.FirstName, dbo.CNSK_ENL_subscribe.LastName, dbo.CNSK_ENL_subscribe.Title, dbo.CNSK_ENL_subscribe.Company, 
                         dbo.CNSK_ENL_subscribe.Address, dbo.CNSK_ENL_subscribe.City, dbo.CNSK_ENL_subscribe.Province, dbo.CNSK_ENL_subscribe.Country, 
                         dbo.CNSK_ENL_subscribe.Postal AS [Postal/Zip], 
                         CASE dbo.CNSK_ENL_subscribe.Phone_ext WHEN 'N/A' THEN dbo.CNSK_ENL_subscribe.Phone_area + N'-' + dbo.CNSK_ENL_subscribe.phone_no ELSE dbo.CNSK_ENL_subscribe.Phone_area
                          + N'-' + dbo.CNSK_ENL_subscribe.phone_no + N' Ext.' + dbo.CNSK_ENL_subscribe.Phone_ext END AS PHONE, dbo.CNSK_ENL_subscribe.Email, 
                         dbo.NSK_Category.Category AS Request_Item, dbo.CNSK_ENL_subscribe.SourceEntry,CONVERT(DATETIME, dbo.CNSK_ENL_subscribe.USB_RequestDate, 106) AS Request_date, 
                         CASE dbo.CNSK_ENL_subscribe.Subscribe WHEN 1 THEN 'Yes' ELSE 'No' END AS eNewsletter_Subscribed

FROM 
dbo.NSK_Category  INNER JOIN  dbo.NSK_SourceEntry on dbo.NSK_Category.CategoryID  =  dbo.NSK_SourceEntry.NSK_CategoryID   RIGHT OUTER JOIN
            dbo.CNSK_ENL_subscribe  ON dbo.NSK_SourceEntry.SourceEntry = dbo.CNSK_ENL_subscribe.SourceEntry

WHERE        (dbo.CNSK_ENL_subscribe.USB_Request = 1) 
AND (dbo.CNSK_ENL_subscribe.FirstName NOT LIKE '%test%'  ) 
and (dbo.CNSK_ENL_subscribe.LastName NOT LIKE '%test%'  )
AND (dbo.CNSK_ENL_subscribe.USB_RequestDate > '2014-09-01')
ORDER BY Request_date DESC

 


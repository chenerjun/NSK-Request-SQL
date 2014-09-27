USE  [C226233_enewsletter]
GO
/****** Object:  StoredProcedure [dbo].[sp_NSK_Retrive]    Script Date: 12/17/2013 3:17:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
 
--  	[dbo].[ABU subscribe]
 
-- =============================================
 
	SET NOCOUNT ON;

    -- [dbo].[ABU subscribe] 

SELECT         FirstName, LastName, Company, Title, Phone, email, 
case 
when subscribe =1 then 'Yes'
end  as subscribe
, dateSubscribed
FROM            dbo.subscribe
WHERE       (dateSubscribed > '2014-09-01')  AND (subscribe = 1)
ORDER BY dateSubscribed DESC
go




	-- [dbo].[ABU unsubscribe] 



SELECT        FirstName, LastName, email, CASE WHEN subscribe = 0 THEN 'No' END AS subscribe, dateChanged
FROM            dbo.subscribe
WHERE        (dateChanged > '2014-09-01')  AND (subscribe = 0)
ORDER BY dateChanged DESC

go
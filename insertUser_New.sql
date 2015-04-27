USE [TOPP_Portal]
GO
/****** Object:  StoredProcedure [dbo].[insertUser_New]    Script Date: 04/28/2015 01:13:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







ALTER PROCEDURE [dbo].[insertUser_New] (
		 @users_firstname varchar(100)=null
		, @users_lastname varchar(100)=null
		, @users_address1 varchar(100) = NULL
		, @users_address2 varchar(100) = NULL
		, @users_city varchar(50) = NULL
		, @state_cd_fk char(2) = NULL
		, @users_zipcode varchar(15) = NULL
		, @users_phone1 varchar(20) = NULL
		, @users_phone2 varchar(20) = NULL
		, @users_email_id varchar(100)
		, @users_ext_user_id varchar(20) = NULL
		, @users_ext_user_type varchar(20) = NULL
		, @users_jobtitle varchar(100) = NULL
		, @users_department varchar(50) = NULL
		, @users_company_id varchar(20) = NULL
		, @users_company varchar(50) = NULL
		, @users_password varchar(50)
		, @users_securityquestion_fk int = NULL
		, @users_securityanswer  varchar(100) = NULL
		, @users_isReport_Mstr bit = 0
		, @users_isContent_Mgr bit = 0
		, @users_isadmin bit = 0
		, @users_deleted bit = 0
		, @country_cd_fk char(2) = NULL
		, @users_timezone_fk int = NULL
		, @users_emailsreceive bit =0
--		, @ID int OUTPUT
)
AS
BEGIN
	INSERT INTO [dbo].[users] 
	(
		users_firstname
		, users_lastname
		, users_address1
		, users_address2
		, users_city
		, state_cd_fk
		, users_zipcode
		, users_phone1
		, users_phone2
		, users_email_id
		, users_ext_user_id
		, users_ext_user_type
		, users_jobtitle
		, users_department
		, users_company_id
		, users_company
		, users_password
		, users_securityquestion_fk
		, users_securityanswer
		, users_isReport_Mstr
		, users_isContent_Mgr
		, users_isadmin
		, users_deleted
		, country_cd_fk
		, users_timezone_fk
		,users_emailsreceive
	)
	VALUES 
	(
		 @users_firstname
		, @users_lastname
		, @users_address1
		, @users_address2
		, @users_city
		, @state_cd_fk
		, @users_zipcode
		, @users_phone1
		, @users_phone2
		, @users_email_id
		, @users_ext_user_id
		, @users_ext_user_type
		, @users_jobtitle
		, @users_department
		, @users_company_id
		, @users_company
		, @users_password
		, @users_securityquestion_fk
		, @users_securityanswer
		, @users_isReport_Mstr
		, @users_isContent_Mgr
		, @users_isadmin
		, @users_deleted
		, @country_cd_fk
		, @users_timezone_fk
		,@users_emailsreceive
	)

--	SET @ID = SCOPE_IDENTITY();

END







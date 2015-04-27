USE [TOPP_Portal]
GO
/****** Object:  StoredProcedure [dbo].[updateUserInfo]    Script Date: 04/28/2015 01:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
   
ALTER PROCEDURE [dbo].[updateUserInfo] (  
 @users_email_id varchar(100),  
 @updateUserInfo bit,  
 @users_firstname varchar(100),  
 @users_lastname varchar(100),  
 @users_company varchar(50),  
 @users_jobtitle varchar(100),  
 @users_phone1 varchar(50),  
 @users_phone2 varchar(50),  
 @users_address1 varchar(100),  
 @users_address2 varchar(100),  
 @users_city varchar(50),  
 @users_zipcode varchar(15),  
 @state_cd_fk char(2),  
 @country_cd_fk char(2),  
 @users_timezone_fk int,  
 @users_policyagreed bit,  
 @updateSecurityInfo bit,   
 @users_securityquestion_fk int,  
 @users_securityanswer varchar(100),  
 @updatePassword bit,  
 @users_password varchar(50),
 @user_CompanyID varchar(20),
@user_Function varchar(50)
)  
AS  
BEGIN  
  
 IF @updateUserInfo = '1'  
 BEGIN  
  UPDATE [dbo].[users]  
  SET [users_firstname] = @users_firstname  
   , [users_lastname] = @users_lastname  
   , [users_company] = @users_company  
   , [users_jobtitle] = @users_jobtitle  
   , [users_phone1] = @users_phone1  
   , [users_phone2] = @users_phone2  
   , [users_address1] = @users_address1  
   , [users_address2] = @users_address2  
   , [users_city] = @users_city  
   , [users_zipcode] = @users_zipcode  
   , [state_cd_fk] = @state_cd_fk  
   , [country_cd_fk] = @country_cd_fk  
   , [users_timezone_fk] = @users_timezone_fk  
   , [users_policyagreed] = @users_policyagreed  
	,[users_company_id]  = @user_CompanyID
	,[users_function]=@user_Function
   , [users_datemodified] = getdate()  
   , [users_firstaccess] = getdate()

  WHERE [users_email_id] = @users_email_id  
 END  
  
 IF @updateSecurityInfo = '1'  
 BEGIN  
  UPDATE [dbo].[users]  
  SET [users_securityquestion_fk] = @users_securityquestion_fk  
   , [users_securityanswer] = @users_securityanswer  
   , [users_datemodified] = getdate()  
  WHERE [users_email_id] = @users_email_id  
 END  
  
 IF @updatePassword = '1'  
 BEGIN  
  UPDATE [dbo].[users]  
  SET [users_password] = @users_password   
   , [users_datemodified] = getdate()    
  WHERE [users_email_id] = @users_email_id  
 END  
   
END  
  
  
  
  
  
  
  
  
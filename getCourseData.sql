USE [TOPP_Portal]
GO
/****** Object:  StoredProcedure [dbo].[GetCourseData]    Script Date: 04/28/2015 01:10:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  
  
  
ALTER PROCEDURE [dbo].[GetCourseData]     
 @UID int =null,  
 @CID int =NULL  
AS    
BEGIN    
 SET NOCOUNT ON;    
select u1.users_email_id,c2.courses_pk,coursedata_pk, courses_coursetitle,courses_coursecode,coursedata_score,  
coursedata_datefirstaccessed,coursedata_datelastaccessed,coursedata_datecompleted,coursedata_lessonstatus_fk,ls.lessonstatus_desc,  
coursedata_certificatestatus_fk,crt.certificatestatus_desc,coursedata_attempts,coursedata_totaltime,coursedata_testdate,coursedata_lessonlocation  
from    
  
coursedata c1    
  
join    
  
users u1  
  
on c1.coursedata_users_fk = u1.users_pk  
  
join   
  
courses c2  
  
on c1.coursedata_courses_fk=c2.courses_pk  

join certificatestatus crt

on 
crt.certificatestatus_pk=c1.coursedata_certificatestatus_fk
  
join lessonstatus ls

on 
ls.lessonstatus_pk=c1.coursedata_lessonstatus_fk
where  
   
u1.users_pk=@UID  
AND c2.courses_pk=@CID  
end  
  
  
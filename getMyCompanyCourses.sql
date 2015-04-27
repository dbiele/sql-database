USE [TOPP_Portal]
GO
/****** Object:  StoredProcedure [dbo].[getMyCompanyCourses]    Script Date: 04/28/2015 01:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
		ALTER PROCEDURE [dbo].[getMyCompanyCourses]
		@UserID int=null--,
		
		AS
		BEGIN
			SET NOCOUNT ON;

			SELECT	
				 c.courses_acronym
				--,c.category_smallIcon
				,c.courses_coursetitle
				,c.courses_shortdescription
				,c.courses_acronym
				,c.courses_pk		
				,u.users_firstname 
				,u.users_lastname
				,u.users_company_id
				,utg.groups_fk
				,ctc.CategoryID
				,cat.category_smallIcon
			FROM users u
				JOIN user_to_groups utg
				ON utg.users_fk=u.users_pk 
				JOIN course_to_groups ctg
				ON ctg.groups_fk=utg.groups_fk
				JOIN courses c
				ON c.courses_pk=ctg.courses_fk
				JOIN Courses_to_Category ctc
				ON ctc.CourseID=c.courses_pk
				JOIN category cat
				ON cat.category_pk=ctc.CategoryID 
				AND cat.category_pk!=22
				WHERE u.users_pk=@UserID
		END

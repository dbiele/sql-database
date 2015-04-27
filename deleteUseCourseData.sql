USE [TOPP_Portal]
GO
/****** Object:  StoredProcedure [dbo].[GetMyCourses]    Script Date: 04/28/2015 01:07:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

		ALTER PROCEDURE [dbo].[GetMyCourses] 
			@UID int
			, @GROUPS varchar(1024)=NULL
		AS
		BEGIN
			SET NOCOUNT ON;
			-- /// Create table variable to hold CIDs  ///////
			DECLARE @CID TABLE(CID_key int)
			IF @GROUPS IS NOT NULL
			BEGIN 
				INSERT INTO @CID
					EXEC('Select courses_pk from courses where courses_pk in 
					(select courses_fk from course_to_groups where groups_fk in 
						(select groups_pk from groups where groups_name in ('+ @GROUPS + '))
					)');
			END	
			INSERT INTO @CID
				SELECT DISTINCT(permissions_courses_fk)
				FROM [permissions]
				WHERE permissions_users_fk = @UID

		--/////  CIDs are loaded

			SELECT 
				t1.courses_pk
				, t2.CategoryID
				, t1.courses_coursetitle
				, t1.courses_coursecode
				, t1.courses_shortdescription
				, t1.courses_longdescription
				, t1.courses_prerequisites
				, dbo.GetPreReqTitle(t1.courses_prerequisites) as PreReqTitle
				, t1.courses_points
				, t1.courses_version
				, t1.courses_author
				, t1.courses_masteryscore
				, t1.courses_cpe_credits
				, CASE 
					WHEN t4.coursedata_lessonstatus_fk IS NULL THEN dbo.GetStatusDesc(1)
					ELSE dbo.GetStatusDesc(t4.coursedata_lessonstatus_fk)
				  END AS status_desc
				, CASE 
					WHEN t4.coursedata_lessonstatus_fk IS NULL THEN dbo.GetStatusImg(1)
					ELSE dbo.GetStatusImg(t4.coursedata_lessonstatus_fk)
				  END AS status_img
				, t4.coursedata_score
				, t4.coursedata_courseversion
				, t4.coursedata_datecompleted
				, t1.courses_active
				, t1.courses_ims
				, t1.courses_cert
				, t1.courses_cofl
				, t1.courses_timeexpected
				, t1.courses_urlpath
				, t1.courses_previewurlpath
				, t1.courses_fullscreen
				, t1.courses_scrollbar
				, t1.courses_navbar
				, t1.courses_locationbar
				, t1.courses_statusbar
				, t1.courses_menubar
				, t1.courses_resize
				, t1.courses_width
				, t1.courses_height
				, t2.DisplayOrder
				, t1.courses_acronym
				, t1.courses_course_type_fk
				, t3.course_type_description
				, t1.courses_timecreated
				, t1.courses_timemodified
				, CASE
					WHEN cat.category_pk = 22 then dbo.GetCourseSmallIcon(t2.CourseID)
					ELSE cat.category_smallIcon
				  END AS small_icon
			FROM
				Courses_to_Category t2
			JOIN 
				courses t1
			ON
				t1.courses_pk = t2.CourseID
 			JOIN
				course_type t3
			ON 
				t3.course_type_pk = t1.courses_course_type_fk
			


			AND t2.CourseID=t1.courses_pk
			JOIN category cat
			ON cat.category_pk=t2.CategoryID 



			LEFT OUTER JOIN
				coursedata t4
			ON
				t1.courses_pk = t4.coursedata_courses_fk AND t4.coursedata_users_fk = @UID
			WHERE 
				t1.courses_pk in (SELECT DISTINCT(CID_KEY) from @CID)
			ORDER BY
				t2.CategoryID,t2.DisplayOrder 

		END
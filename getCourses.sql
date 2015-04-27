USE [TOPP_Portal]
GO
/****** Object:  StoredProcedure [dbo].[getCourses]    Script Date: 04/28/2015 01:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
		ALTER PROCEDURE [dbo].[getCourses] 
		(
			@COURSEID int =NULL
			, @TITLE varchar(50) = NULL
			, @ACRONYM varchar(10) = NULL
			, @COURSECODE varchar(10) = NULL
		)
		AS
		BEGIN	
			SET NOCOUNT ON;

			SELECT 
				t1.courses_pk
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
				, t1.courses_active
				, t1.courses_ims
				, t1.courses_cert
				, t1.courses_timeexpected
				, t1.courses_urlpath
				, t1.courses_previewurlpath
				, t1.courses_acronym
				, t1.courses_course_type_fk
				, t2.course_type_description
				, t1.courses_timecreated
				, t1.courses_timemodified
				, t1.courses_fullscreen
				, t1.courses_scrollbar
				, t1.courses_navbar
				, t1.courses_locationbar
				, t1.courses_statusbar
				, t1.courses_menubar
				, t1.courses_resize
				, t1.courses_width
				, t1.courses_height
				, t1.courses_cofl
				, t1.courses_alsolocatedin
				, t1.courses_cpe_credits
				, '$' + Convert(varchar, t1.courses_cost) AS 'courses_cost'
				

			FROM 
				courses t1
			JOIN
				course_type t2
			ON 
				t2.course_type_pk = t1.courses_course_type_fk
			
		 
			WHERE 
			t1.courses_pk = COALESCE(@COURSEID, t1.courses_pk)
			AND t1.courses_coursetitle LIKE COALESCE('%' + @TITLE + '%', t1.courses_coursetitle)
			AND t1.courses_acronym LIKE COALESCE('%' + @ACRONYM + '%', t1.courses_acronym)
			AND	t1.courses_coursecode LIKE COALESCE('%' + @COURSECODE + '%', t1.courses_coursecode)
		END




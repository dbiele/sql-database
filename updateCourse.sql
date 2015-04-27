USE [TOPP_Portal]
GO
/****** Object:  StoredProcedure [dbo].[updateCourse]    Script Date: 04/28/2015 01:14:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

			ALTER PROCEDURE [dbo].[updateCourse] 
			(
				@courses_pk int
				, @courses_coursetitle nvarchar(100)
				, @courses_coursecode varchar(10)
				, @courses_shortdescription nvarchar(4000) = null
				, @courses_longdescription nvarchar(max) = null
				, @courses_prerequisites varchar(100) = null
				, @courses_points varchar(100) = null
				, @courses_version varchar(50) = null
				, @courses_author varchar(50) = null
				, @courses_masteryscore float
				, @courses_active bit = 0
				, @courses_ims bit = 0
				, @courses_cert bit = 0
				, @courses_timeexpected varchar(50)
				, @courses_urlpath varchar(250) = null
				, @courses_previewurlpath varchar(250) = null
				, @courses_acronym varchar(50) = null
				, @courses_course_type_fk int
				, @courses_fullscreen bit = 0
				, @courses_scrollbar bit = 0
				, @courses_navbar bit = 0
				, @courses_locationbar bit = 0
				, @courses_statusbar bit = 0
				, @courses_menubar bit = 0
				, @courses_resize bit = 0
				, @courses_width varchar(6) = null
				, @courses_height varchar(6) = null
				, @courses_cofl bit = 0
				, @courses_alsolocatedin nvarchar(4000)=null
				, @courses_cpe_credits varchar(50)
				, @courses_cost money
			)
		AS
		BEGIN	
			SET NOCOUNT ON;
			
		UPDATE
			t1
		SET 
				courses_coursetitle = @courses_coursetitle
				, courses_coursecode = @courses_coursecode
				, courses_shortdescription = @courses_shortdescription
				, courses_longdescription = @courses_longdescription
				, courses_prerequisites = @courses_prerequisites
				, courses_points = @courses_points
				, courses_version = @courses_version
				, courses_author = @courses_author
				, courses_masteryscore = @courses_masteryscore
				, courses_active = @courses_active
				, courses_ims = @courses_ims
				, courses_cert = @courses_cert
				, courses_timeexpected = @courses_timeexpected
				, courses_urlpath = @courses_urlpath
				, courses_previewurlpath = @courses_previewurlpath
				, courses_acronym = @courses_acronym
				, courses_course_type_fk = t2.course_type_pk
				, courses_fullscreen = @courses_fullscreen
				, courses_scrollbar = @courses_scrollbar
				, courses_navbar = @courses_navbar
				, courses_locationbar = @courses_locationbar
				, courses_statusbar = @courses_statusbar
				, courses_menubar = @courses_menubar
				, courses_resize = @courses_resize
				, courses_width = @courses_width
				, courses_height = @courses_height
				, courses_cofl = @courses_cofl
				, courses_alsolocatedin=@courses_alsolocatedin
				, courses_cpe_credits=@courses_cpe_credits
				, courses_cost=@courses_cost
			FROM 
				courses t1
			JOIN
				course_type t2
			ON 
				t2.course_type_pk = @courses_course_type_fk
		 
			WHERE 
				t1.courses_pk = @courses_pk
		END
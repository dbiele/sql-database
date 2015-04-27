USE [TOPP_Portal]
GO
/****** Object:  StoredProcedure [dbo].[getCourseDetails]    Script Date: 04/28/2015 01:11:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[getCourseDetails]
(
	@users_email_id varchar(100)
	, @courses_coursetitle nvarchar(50)
)
AS
BEGIN  

	SELECT [courses_shortdescription]
		, [courses_longdescription]
		, [courses_timeexpected]
		, [lessonstatus_imagepath]
		, [lessonstatus_desc]
		, [coursedata_datelastaccessed]
		, [coursedata_score]
		, [courses_masteryscore]
		, [courses_prerequisites]
		, [courses_cpe_credits]
		, [coursedata_datefirstaccessed]		
		, MAX([permissions_datestarted]) AS 'permissions_datestarted'
		, [courses_course_type_fk]

	FROM [permissions] t1

	LEFT OUTER JOIN [users] t2
	ON t2.[users_pk] = t1.[permissions_users_fk]

	LEFT OUTER JOIN [courses] t3
	ON t3.[courses_pk] = t1.[permissions_courses_fk]

	LEFT OUTER JOIN [coursedata] t4
	ON t4.[coursedata_courses_fk] = t3.[courses_pk]	
	AND t4.[coursedata_users_fk] = t2.[users_pk]

	LEFT OUTER JOIN [lessonstatus] t5
	ON t5.[lessonstatus_pk] = ISNULL(t4.[coursedata_lessonstatus_fk], 1)

	WHERE t2.[users_email_id] = @users_email_id
	AND t3.[courses_coursetitle] = @courses_coursetitle

	GROUP BY [courses_shortdescription]
		, [courses_longdescription]
		, [courses_timeexpected]
		, [lessonstatus_imagepath]
		, [lessonstatus_desc]
		, [coursedata_datelastaccessed]
		, [coursedata_score]
		, [courses_masteryscore]
		, [courses_prerequisites]
		, [courses_cpe_credits]
		, [coursedata_datefirstaccessed]
		, [courses_course_type_fk]
END

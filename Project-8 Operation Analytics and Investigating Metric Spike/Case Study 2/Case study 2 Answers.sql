
##A.Weekly User Engagement:Measure the activeness of users on a weekly basis.
SELECT YEAR(date_time) AS year,
    WEEK(date_time,1) AS week,user_id,
    COUNT(*) AS activity_count
FROM 
    events ##where user_id=10522
GROUP BY 
    YEAR(date_time),WEEK(date_time,1),user_id
ORDER BY 
    user_id,year,week asc;
#########################################################

##B.User Growth Analysis: Analyze the growth of users over time for a product.

SELECT year(DATE_TIME) YEAR ,monthname(DATE_TIME) MONTH,COUNT(USER_ID) NEW_USERS FROM USERS GROUP BY year(DATE_TIME),month(DATE_TIME) ORDER BY year(DATE_TIME),month(DATE_TIME) ASC ;

################################################################

##C.Weekly Retention Analysis: Analyze the retention of users on a weekly basis after signing up for a product.
SELECT 
    cohort_week,
    week,
    active_users,
    LAG(active_users) OVER (PARTITION BY cohort_week ORDER BY week) AS previous_week_users,
    IFNULL(active_users / LAG(active_users) OVER (PARTITION BY cohort_week ORDER BY week), 0) AS retention_rate
FROM (
 SELECT 
        c.cohort_week,
        YEARWEEK(a.date_time, 1) AS week,
        COUNT(DISTINCT a.user_id) AS active_users
    FROM (SELECT 
        user_id,
        MIN(YEARWEEK(date_time, 1)) AS cohort_week
    FROM 
        events
    GROUP BY 
        user_id ) c
    JOIN 
        events a
    ON 
        c.user_id = a.user_id
    GROUP BY 
        c.cohort_week, YEARWEEK(a.date_time, 1))b ORDER BY 
    cohort_week, week;
###########################################################################

##D.Weekly Engagement Per Device: Measure the activeness of users on a weekly basis per device.

select yearweek(date_time) week,device,count(device) device_engagement from events group by device,yearweek(date_time) order by device,yearweek(date_time) asc;
###############################################################################

##E.Email Engagement Analysis:Analyze how users are engaging with the email service.

select yearweek(date_time),user_id,count(user_id) from email_events group by user_id,yearweek(date_time) order by user_id;

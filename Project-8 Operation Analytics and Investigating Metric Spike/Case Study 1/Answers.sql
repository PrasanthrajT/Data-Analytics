create database project3;

use project3;

create table job_data ( job_id int ,
						actor_id int ,
                        event varchar(50),
                        language varchar(100),
                        time_spent int,
                        org char(1),
                        ds varchar(10)
);

show tables;
#drop table job_data;

select * from job_Data;

show variables like 'sercure_file_prev';

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/job_data.csv' into table job_data fields terminated by ',' 
enclosed by '"' lines terminated by '\n' ignore 1 rows; 

select * from job_data;
select count(*) from job_data;
#######################################################

##A.Jobs Reviewed Over Time: Calculate the number of jobs reviewed per hour for each day in November 2020.

select ds,(sum(time_spent)/3600) reviewed_per_hour from job_data group by ds order by ds asc;

select ds,sum(time_spent) reviewed_per_hour from job_data group by ds order by ds asc;

########################################################

##B.Throughput Analysis: Calculate the 7-day rolling average of throughput (number of events per second).
SELECT
    date,
    throughput_per_second,
    seven_day_rolling_avg
FROM
    (
    SELECT
        date,
        throughput_per_second,
        AVG(throughput_per_second) OVER (
            ORDER BY date
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS seven_day_rolling_avg
    FROM
        (SELECT
        ds AS date,
        COUNT(*) * 1.0 / SUM(time_spent) AS throughput_per_second
    FROM
        job_data
    GROUP BY
        ds )daily_throughput
)rolling_avg
ORDER BY
    date;
########################################################

#C.Language Share Analysis: Language Percentage in last 30 days
#select *,date_format(str_to_date(ds,'%m/%d/%Y'),'%Y-%m-%d %H:%i:%s') as date_time from job_data order by date_time asc;
#alter table job_data add column date_time datetime;
#alter table job_data drop column date_time;
#update  job_data set date_time = date_format(str_to_date(ds,'%m/%d/%Y'),'%Y-%m-%d %H:%i:%s') where 1=1;
select b.language,
(count(b.language)/ (select count(*) from job_data a where a.date_time between DATE_FORMAT(b.date_time, '%Y-%m-01')  and LAST_DAY(b.date_time) ))* 100 as language_perc
#DATE_FORMAT(b.date_time, '%Y-%m-01') AS first_day_of_month,
#LAST_DAY(b.date_time)  Last_day_of_month
from job_data b
 where b.date_time between DATE_FORMAT(b.date_time, '%Y-%m-01')  ##and date_format(b.date_time,'%Y-%m-29')
and LAST_DAY(b.date_time) 
and DATE_FORMAT(b.date_time, '%b')= 'Nov'
group by b.language order by language desc;
#######################################################

##D.Duplicate rows detection
#select * from job_data;
select job_id,actor_id,event,language,time_spent,org,ds,count(*) from job_data
group by job_id,actor_id,event,language,time_spent,org,ds
having count(*) > 1;
############################

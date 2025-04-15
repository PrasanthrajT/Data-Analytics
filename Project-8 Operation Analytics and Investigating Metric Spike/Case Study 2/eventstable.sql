#####user_id	occurred_at	event_type	event_name	location	device	user_type

drop table events;

create table events (user_id int,
					occurred_at varchar(200),
                    event_type varchar(200),
                    event_name varchar(200),
                    location varchar(200),
                    device varchar(200),
                    user_type int
);

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/events.csv' into table events fields terminated by ',' 
enclosed by '"' lines terminated by '\n' ignore 1 rows; 

select count(*) from events;

select count(*) from events where user_id=10522;

#alter table events add column date_time datetime after occurred_at;

/* UPDATE events
SET date_time = CASE
    WHEN occurred_at LIKE '%/%/% %:%' THEN
        STR_TO_DATE(occurred_at, '%m/%d/%Y %H:%i')
WHEN occurred_at LIKE '%-%-% %:%' THEN
        STR_TO_DATE(occurred_at, '%d-%m-%Y %H:%i')

    ELSE
        NULL
END;
*/




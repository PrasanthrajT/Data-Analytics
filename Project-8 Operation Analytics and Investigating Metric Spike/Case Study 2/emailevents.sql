##user_id	occurred_at	action	user_type

create table email_events(user_id int,
						  occurred_at varchar(200),
                          action varchar(200),
                          user_type int
);

#alter table email_events modify column occurred_at varchar(200);

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/email_events.csv' into table email_events fields terminated by ',' 
enclosed by '"' lines terminated by '\n' ignore 1 rows; 

select count(*) from email_events;

select * from email_events where user_id=0;

#alter table email_events add column date_time datetime after occurred_at;

/* UPDATE email_events
SET date_time = CASE
    WHEN occurred_at LIKE '%/%/% %:%' THEN
        STR_TO_DATE(occurred_at, '%m/%d/%Y %H:%i')
WHEN occurred_at LIKE '%-%-% %:%' THEN
        STR_TO_DATE(occurred_at, '%d-%m-%Y %H:%i')

    ELSE
        NULL
END;
*/




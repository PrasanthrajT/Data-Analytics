use  ig_clone;
#A) Marketing Analysis:
#1.Loyal User Reward:  Identify the five oldest users on Instagram from the provided database.
select id,username,created_at from users order by created_at asc limit 5 ;

#2.Inactive User Engagement:Identify users who have never posted a single photo on Instagram.

select b.id,b.username from users b where b.id not in (select distinct user_id from photos);

#3.Determine the winner of the contest and provide their details to the team

select b.username,a.photo_id,count(a.photo_id) likes from likes a,users b
 where a.user_id=b.id  group by a.photo_id order by count(a.photo_id) desc limit 1;
 
 #4.Hashtag Research:  Identify and suggest the top five most commonly used hashtags on the platform.
 
 select b.tag_name,count(a.tag_id) from photo_tags a, tags b
 where a.tag_id=b.id group by a.tag_id,b.tag_name order by count(a.tag_id) desc limit 5;
 
 #5.Ad Campaign Launch: Determine the day of the week when most users register on Instagram. Provide insights on when to schedule an ad campaign.
 
 select * from (select dayname(created_at) Day_Name,count(dayname(created_at)) Registration_count,
 dense_rank() over (order by count(dayname(created_at)) desc) ranking
 from users 
 group by dayname(created_at)
 order by count(dayname(created_at)) desc) a where a.ranking=1;
 
 #B) Investor Metrics:
 #1.User Engagement:  Calculate the average number of posts per user on Instagram. 
 #Also, provide the total number of photos on Instagram divided by the total number of users.
 select  count(id) posts,count(distinct user_id) posted_users,count(id)/count(distinct user_id) average_posts from photos;
 
select (select count(image_url) from photos a) total_posts,
(select count(id) from users) total_users,
 (select count(image_url) from photos a)/(select count(id) from users) Average_of_posts_based_on_total_users from dual;
 
 #2.Bots & Fake Accounts: Identify users (potential bots) who have liked every single photo on the site, as this is not typically possible for a normal user.
 
 select count(*) from likes;
 
 select count(id) from photos;
 
select b.username,a.user_id,count(a.user_id) total_likes from likes a,users b 
where a.user_id=b.id
group by a.user_id having count(a.user_id) = (select count(id) from photos);
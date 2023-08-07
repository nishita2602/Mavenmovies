use ig_clone;

#1.Create an ER diagram or draw a schema for the given database.



#2.We want to reward the user who has been around the longest, Find the 5 oldest users.

use ig_clone;
Select * from users order by created_at asc limit 5;

#3.To target inactive users in an email ad campaign, find the users who have never posted a photo.
Select * from photos;
use ig_clone;
select user_id from photos;
Select id,username from users where id not in (select user_id from photos);

#4.Suppose you are running a contest to find out who got the most likes on a photo. Find out who won?
Select * from likes;

create temporary table most_likeed as(Select photo_id,count(l.photo_id) as max_likes from likes l group by photo_id order by max_likes desc limit 1);

select p.id,user_id,username from photos p join most_likeed ml on p.id=ml.photo_id join users u on u.id=p.user_id;

#5.The investors want to know how many times does the average user post.

SELECT (COUNT(DISTINCT user_id)) AS average_posts
FROM photos;
select count(*) from photos;
SELECT COUNT(*) / COUNT(DISTINCT user_id) AS average_posts
FROM photos;

#6.A brand wants to know which hashtag to use on a post, and find the top 5 most used hashtags.

Select * from tags;
select tag_id,tag_name,count(tag_name) as max_tag from tags t join photo_tags pt on
t.id=pt.tag_id group by tag_id,tag_name order by max_tag desc,tag_id -- Added tag_id as a secondary sorting criteria
limit 5;


#7.To find out if there are bots, find users who have liked every single photo on the site.
select * from likes;
select username from users u where u.id in (select l.user_id from likes l group by l.user_id 
having count(distinct l.photo_id)= (select count(*) from photos));

#8.Find the users who have created instagramid in may and select top 5 newest joinees from it?
Select * from users;
select username,created_at from users where month(created_at)=5 order by created_at desc limit 5;

#9.Can you help me find the users whose name starts with c and ends with any number and have posted the photos as well as liked the photos?
select * from users where username regexp '^c.*[0-9]$' and id in
(select user_id from photos p where user_id in (select user_id from likes l));

#10.Demonstrate the top 30 usernames to the company who have posted photos in the range of 3 to 5.

select * from users u where id in (Select user_id from photos p group by user_id having count(*) between 3 and 5) order by username asc limit 30 ;


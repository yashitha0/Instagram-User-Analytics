
 select * from users;
 select * from photos;
 select * from likes;
 
 # 1) Identify the five oldest users on Instagram from the provided database.
 select * from users
 order by created_at asc
 limit 5;
 
# 2) Identify users who have never posted a single photo on Instagram
select id, username from users
where id not in (select user_id from photos);

# 3) Determine the winner of the contest and provide their details to the team.
-- The user with the most likes on a single photo wins.

select username, photos.id as photo_id , photos.image_url, count(likes.user_id) as total_likes
from photos
inner join likes
on likes.photo_id = photos.id
inner join users
on photos.user_id = users.id
group by photos.id
order by total_likes desc 
limit 1;

# 4) Identify and suggest the top five most commonly used hashtags on the platform.

 select 
	count(photo_id) as no_of_tags,
    tag_id,
    tag_name
 from 
	photo_tags p join tags t
	on p.tag_id = t.id
 group by tag_id
 order by no_of_tags desc
 limit 5;

# 5) Determine the day of the week when most users register on Instagram. Provide insights on when to schedule an ad campaign.
 
 select dayname(created_at) as Day, count(*) as total
 from users
 group by Day
 order by total desc
 limit 2;
 
# 6) Calculate the average number of posts per user on Instagram. Also, provide the total number of photos on Instagram divided by the total number of users.

select 
    avg(num_of_post) as avg_post_per_user
from
    (select
        user_id, COUNT(*) as num_of_post
    from
        photos
    group by user_id) as average_post_count;
    
select
	(select count(*) from photos) /(select count(*) from users) 
as Total_photos_by_total_users;

# 7)Identify users (potential bots) who have liked every single photo on the site, as this is not typically possible for a normal user.

select user_id, username
from likes join users
on likes.user_id = users.id
group by user_id
having count(photo_id) = (select count(*) from photos);


 
 
 
 
 
 



 
























































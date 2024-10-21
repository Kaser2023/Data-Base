Create DATABASE ig_clone;
use ig_clone;

-- 1. Users Table
CREATE Table users(
    id INT AUTO_INCREMENT PRIMARY Key,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TimeStamp Default NOW()
    );
    
    
insert INTO users (username) Values
('Alqurahi'),
('Abdullah'),
('Kaser');

select u.id,username, img_url from users u JOIN photos p ON u.id = p.user_id;

-- 2. Photos Table
Create Table photos (
	id INT AUTO_INCREMENT PRIMARY KEY,
	img_url VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    Created_at Timestamp Default NOW(),
    foreign key (user_id) References users(id)
);


INSERT INTO photos (user_id, img_url) Values
(1, '/Kasera'),
(2, '/TheTufan'),
(3, '/kaserQurashi');


-- 3. Comments Table
Create Table comments (
	id INT AUTO_INCREMENT PRIMARy KEY,
    content_text VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at Timestamp Default NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY (photo_id) references photos(id)
);


INSERT INTO comments (content_text, user_id, photo_id) values
('Nice!', 1, 3),
('cool', 2, 1),
('WoW', 3, 2);


SELECT 
    u.id,
    u.username,
    p.img_url,
    c.content_text,
    c.photo_id AS commentedToUser
FROM
    users u
        JOIN
    photos p ON u.id = p.user_id
        JOIN
    comments c ON c.user_id = u.id;




-- 4. Likes Table
CREATE TABLE likes (
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id, photo_id)
);


insert INto likes (user_id, photo_id) values
(1,2),
(1,3),
(2,1),
(3,1);


--  5. Followers Table
CREATE TABLE follows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);

insert into follows (follower_id, followee_id) values
(1, 2),
(2, 3),
(3, 1),
(1, 1),
(1, 3);



-- 6. HashTags and Tags 
CREATE TABLE tags (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  tag_name VARCHAR(255) UNIQUE,
  created_at TIMESTAMP DEFAULT NOW()
);
CREATE TABLE photo_tags (
    photo_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);


insert into tags (tag_name) values
('kaser'),
('7.OCT'),
('Tufan');

Insert into photo_tags (photo_id, tag_id) values
(1, 1),
(2, 1),
(3, 1),
(2,3);




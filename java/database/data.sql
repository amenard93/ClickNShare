BEGIN TRANSACTION;


INSERT INTO users (username,password_hash,role, email, first_name, last_name) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER', 'fake@test.com', 'John', 'Smith');
INSERT INTO users (username,password_hash,role, email, first_name, last_name) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN', 'red@test.com', 'John', 'John');
INSERT INTO users (username,password_hash,role, email, first_name, last_name) VALUES ('user2','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER', 'blue@test.com', 'Smith', 'Smith');
INSERT INTO users (username,password_hash,role, email, first_name, last_name) VALUES ('user3','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER', 'green@test.com', 'Smith', 'John');

INSERT INTO posts (user_id, s3_link, description, time)  VALUES (1, 'https://funnypicture.com', 'this is a funny pic', NOW());
INSERT INTO posts (user_id, s3_link, description, time)  VALUES (2, 'hahahahahaha', 'WOW', NOW());
INSERT INTO posts (user_id, s3_link, description, time)  VALUES (3, 'BOOMER FOOD PICTURE', 'yum xD', NOW());
INSERT INTO posts (user_id, s3_link, description, time)  VALUES (1, 'blurry pic', 'i am artsy :p', NOW());

INSERT INTO comments (comment, user_id, post_id) VALUES ('wow this is cool' , 3, 1);
INSERT INTO comments (comment, user_id, post_id) VALUES ('nice hahahahahah wowowowow' , 3, 3);
INSERT INTO comments (comment, user_id, post_id) VALUES ('wow that looks good gerry !!!!! -love mom', 1, 4);
INSERT INTO comments (comment, user_id, post_id) VALUES ('art school is rlly paying off huh ????' , 2, 2);

INSERT INTO liked_by_user VALUES (1, 2, TRUE);
INSERT INTO liked_by_user VALUES (2, 2, TRUE);
INSERT INTO liked_by_user VALUES (3, 2, TRUE);
INSERT INTO liked_by_user VALUES (4, 2, TRUE);


COMMIT TRANSACTION;

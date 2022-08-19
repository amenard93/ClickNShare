BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role, email, first_name, last_name) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER', 'fake@test.com', 'John', 'Smith');
INSERT INTO users (username,password_hash,role, email, first_name, last_name) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN', 'red@test.com', 'Admin', 'Admin');
INSERT INTO users (username,password_hash,role, email, first_name, last_name) VALUES ('I_Am_A_Cat','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER', 'catsrule@gmail.com', 'Fizz', 'Gig');
INSERT INTO users (username,password_hash,role, email, first_name, last_name) VALUES ('Good_Dog_7','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER', 'urbestfriend@netscape.net', 'Sam', 'Doggo');
INSERT INTO users (username,password_hash,role, email, first_name, last_name) VALUES ('TechHead','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER', 'hacked@gmail.com', 'Xavier', 'Jackson');
INSERT INTO users (username,password_hash,role, email, first_name, last_name) VALUES ('WanderingNomad','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER', 'NikkiB@gmail.com', 'Nicole', 'Bernier');


INSERT INTO posts (user_id, s3_link, description, time)  VALUES (6, 'https://finalprojectco.s3.us-east-2.amazonaws.com/projectimages/6_littlewaterfalls.JPG', 'The irony of Iceland and its lush green landscape and waterfalls at the end of a glacier', NOW());
INSERT INTO posts (user_id, s3_link, description, time)  VALUES (4, 'https://finalprojectco.s3.us-east-2.amazonaws.com/projectimages/6_FirstDay.jpg', 'First day at the new job!', NOW());
INSERT INTO posts (user_id, s3_link, description, time)  VALUES (5, 'https://finalprojectco.s3.us-east-2.amazonaws.com/projectimages/6_VR.jpg', 'Finally got my new VR setup!', NOW());
INSERT INTO posts (user_id, s3_link, description, time)  VALUES (6, 'https://finalprojectco.s3.us-east-2.amazonaws.com/projectimages/6_volcanodustglacier.JPG', 'Volcanic ash on a glacier', NOW());
INSERT INTO posts (user_id, s3_link, description, time)  VALUES (3, 'https://finalprojectco.s3.us-east-2.amazonaws.com/projectimages/6_Revenge.jpg', 'Plotting my revenge on the hoomans...', NOW());
INSERT INTO posts (user_id, s3_link, description, time)  VALUES (6, 'https://finalprojectco.s3.us-east-2.amazonaws.com/projectimages/6_Beach.JPG', 'Black sand beach!', NOW());
INSERT INTO posts (user_id, s3_link, description, time)  VALUES (4, 'https://finalprojectco.s3.us-east-2.amazonaws.com/projectimages/6_CatDog.jpg', 'We get along sometimes', NOW());
INSERT INTO posts (user_id, s3_link, description, time)  VALUES (6, 'https://finalprojectco.s3.us-east-2.amazonaws.com/projectimages/6_stream.JPG', 'A peaceful stream', NOW());
INSERT INTO posts (user_id, s3_link, description, time)  VALUES (5, 'https://finalprojectco.s3.us-east-2.amazonaws.com/projectimages/6_desk.jpg', 'Got my new WFH office setup!', NOW());
INSERT INTO posts (user_id, s3_link, description, time)  VALUES (3, 'https://finalprojectco.s3.us-east-2.amazonaws.com/projectimages/6_WokeUpLikeThis.jpg', 'I woke  up like this', NOW());
INSERT INTO posts (user_id, s3_link, description, time)  VALUES (6, 'https://finalprojectco.s3.us-east-2.amazonaws.com/projectimages/6_Orchid.jpg', 'My Orchids are so beautiful!', NOW());
INSERT INTO posts (user_id, s3_link, description, time)  VALUES (4, 'https://finalprojectco.s3.us-east-2.amazonaws.com/projectimages/6_Sleepy_Pup.jpg', 'Hoomans bought a new chair just for me!', NOW());
INSERT INTO posts (user_id, s3_link, description, time)  VALUES (6, 'https://finalprojectco.s3.us-east-2.amazonaws.com/projectimages/6_Lava.JPG', 'A huge valley  filled with lava rock!', NOW());
INSERT INTO posts (user_id, s3_link, description, time)  VALUES (3, 'https://finalprojectco.s3.us-east-2.amazonaws.com/projectimages/6_OhStawp.jpg', 'Oh Stawp it *Blushes*', NOW());
INSERT INTO posts (user_id, s3_link, description, time)  VALUES (6, 'https://finalprojectco.s3.us-east-2.amazonaws.com/projectimages/6_Audobon.jpg', 'Hiked to the peak of Mt Audubon in Colorado. Almost 14,000 ft elevation!', NOW());
INSERT INTO posts (user_id, s3_link, description, time)  VALUES (6, 'https://finalprojectco.s3.us-east-2.amazonaws.com/projectimages/6_Volcano.JPG', 'Got to see an active Volcano!', NOW());
INSERT INTO posts (user_id, s3_link, description, time)  VALUES (5, 'https://finalprojectco.s3.us-east-2.amazonaws.com/projectimages/6_CrazySky.jpg', 'The sky was crazy tonight!', NOW());


INSERT INTO comments (comment, author_id, post_id) VALUES ('wow this is cool' , 6, 1);
INSERT INTO comments (comment, author_id, post_id) VALUES ('Love this pic. Would make a great background!' , 6, 4);
INSERT INTO comments (comment, author_id, post_id) VALUES ('So proud of you! My pups all grown up ', 4, 2);
INSERT INTO comments (comment, author_id, post_id) VALUES ('Sweeet  let me know how it is, been thinking about getting one', 5, 3);
INSERT INTO comments (comment, author_id, post_id) VALUES ('I know its tempting, but remember.. If you take out the hoomans, then you have to feed yourself...' , 3, 5);
INSERT INTO comments (comment, author_id, post_id) VALUES ('So pretty!' , 6, 6);
--2 follows 1
INSERT INTO following VALUES (2,1);
INSERT INTO following VALUES (3,1);
INSERT INTO following VALUES (4,1);

--INSERT INTO liked_by_user VALUES (1, 2, TRUE);
--INSERT INTO liked_by_user VALUES (2, 2, TRUE);
--INSERT INTO liked_by_user VALUES (3, 2, TRUE);
--INSERT INTO liked_by_user VALUES (4, 2, TRUE);

COMMIT TRANSACTION;

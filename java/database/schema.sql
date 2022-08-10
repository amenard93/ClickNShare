-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;
DROP TABLE IF EXISTS likes, comments, posts,following, users;

CREATE TABLE IF NOT EXISTS public.comments
(
    comment_id serial NOT NULL,
    comment character varying(200),
    post_id integer NOT NULL,
    author_id integer,
    PRIMARY KEY (comment_id)
);

CREATE TABLE IF NOT EXISTS public.following
(
    follower_id integer,
    followee_id integer
);

CREATE TABLE IF NOT EXISTS public.posts
(
    post_id serial,
    user_id integer,
    s3_link character varying NOT NULL,
    description character varying(200),
    "time" timestamp with time zone NOT NULL,
    PRIMARY KEY (post_id)
);

CREATE TABLE IF NOT EXISTS public.users
(
    user_id serial NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(150) NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(60) NOT NULL,
    profile_picture_link character varying(200),
    password_hash character varying(200) NOT NULL,
    role character varying(50) NOT NULL,
    PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS public.likes
(
    post_id integer NOT NULL,
    user_id integer
);

ALTER TABLE public.comments
    ADD FOREIGN KEY (post_id)
    REFERENCES public.posts (post_id)
    NOT VALID;


ALTER TABLE public.following
    ADD FOREIGN KEY (followee_id)
    REFERENCES public.users (user_id)
    NOT VALID;


ALTER TABLE public.following
    ADD FOREIGN KEY (follower_id)
    REFERENCES public.users (user_id)
    NOT VALID;


ALTER TABLE public.posts
    ADD FOREIGN KEY (user_id)
    REFERENCES public.users (user_id)
    NOT VALID;


ALTER TABLE public.likes
    ADD FOREIGN KEY (post_id)
    REFERENCES public.posts (post_id)
    NOT VALID;


ALTER TABLE public.likes
    ADD FOREIGN KEY (user_id)
    REFERENCES public.users (user_id)
    NOT VALID;

ALTER TABLE ONLY public.users
	ALTER COLUMN profile_picture_link
	SET DEFAULT 'https://stock.adobe.com/hu/search/images?k=default+profile+picture';


END;
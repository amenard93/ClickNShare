package com.techelevator.controller;

import com.techelevator.dao.CommentDao;
import com.techelevator.dao.PostDao;
import com.techelevator.dao.UserDao;
import com.techelevator.model.Comment;
import com.techelevator.model.Feed;
import com.techelevator.model.Post;
import com.techelevator.model.User;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@RestController
@CrossOrigin
//@PreAuthorize("isAuthenticated()")
public class FeedController {

    private PostDao postDao;
    private UserDao userDao;
    private CommentDao commentDao;

    public FeedController(PostDao postDao, UserDao userDao, CommentDao commentDao) {
        this.postDao = postDao;
        this.userDao = userDao;
        this.commentDao = commentDao;
    }

/*    @GetMapping(value = "/feed")
    public List<Post> getAllFolloweePostsByFollowerId(Principal principal) {

        int userId = userDao.findIdByUsername(principal.getName());

        return postDao.getAllFolloweePostsByFollowerId(userId);
    }*/

    @GetMapping(value = "/feed")
    public List<Feed> getAllFeeds(Principal principal) {
        List<Post> posts = postDao.findAllPosts();
        List<Feed> feeds = new ArrayList<>();
        for(Post post:posts){
            int postId = post.getPost_id();
            List<String> comments = commentDao.getStringCommentsByPostId(postId);
            User user = userDao.getUserById(post.getUser_id());
            Feed feed = new Feed();
            feed.setUserId(post.getUser_id());
            feed.setId(post.getPost_id());
            feed.setDescription(post.getDescription());
            feed.setLikes(new ArrayList<>());
            feed.setComments(comments);
            feed.setPicture(post.getPictureLink());
            feed.setTimeStamp(post.getTimestamp());
            feed.setFirstName(user.getFirstName());
            feed.setLastName(user.getLastName());
            feeds.add(feed);
        }
        return feeds;
    }

    @PreAuthorize("permitAll()")
    @GetMapping(value = "/landing-page")
    public List<Post> findAllPosts() {
        return postDao.findAllPosts();
    }

}






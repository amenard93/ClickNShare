package com.techelevator.dao;
import com.techelevator.model.Post;

import java.util.List;

public interface PostDao {
    Post getPostById(int postId);

    Post createPost(int user_id, String s3_link, String description);

    boolean likePost(int userId, int postId);

    List<Post> getAllPostsByUserId(int userId);

    public boolean userLikedPost(int userId, int postId);

    public int likesCount(int postId);

}

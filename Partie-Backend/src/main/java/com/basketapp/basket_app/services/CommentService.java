package com.basketapp.basket_app.services;

import java.util.List;

import com.basketapp.basket_app.models.Comment;

public interface CommentService {
    Comment createComment (Comment c);
    void deleteComment (Long id); 
    Comment updateComment (Comment c); 
    Comment getComment(Long id);
    List <Comment> getAllComments();
}
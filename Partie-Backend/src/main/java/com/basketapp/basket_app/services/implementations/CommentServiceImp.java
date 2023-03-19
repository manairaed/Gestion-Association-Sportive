package com.basketapp.basket_app.services.implementations;

import java.util.List;

import com.basketapp.basket_app.dao.CommentRepos;
import com.basketapp.basket_app.models.Comment;
import com.basketapp.basket_app.services.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImp implements CommentService{ 

    @Autowired
    CommentRepos commentRepos;

    @Override
    public Comment createComment(Comment c) {
        return commentRepos.save(c);
    }

    @Override
    public void deleteComment(Long id) {
        commentRepos.deleteById(id);
    }

    @Override
    public Comment updateComment(Comment c) {
        return commentRepos.save(c);
    }

    @Override
    public Comment getComment(Long id) {
        return commentRepos.findById(id).get();
    }

    @Override
    public List<Comment> getAllComments() {
        return commentRepos.findAll();
    }
}
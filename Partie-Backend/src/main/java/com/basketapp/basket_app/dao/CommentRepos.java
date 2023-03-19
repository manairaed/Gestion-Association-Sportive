package com.basketapp.basket_app.dao;
import com.basketapp.basket_app.models.Comment;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentRepos extends JpaRepository<Comment,Long>{



    List<Comment> findByActualite_IdActualite(long actualite);
}



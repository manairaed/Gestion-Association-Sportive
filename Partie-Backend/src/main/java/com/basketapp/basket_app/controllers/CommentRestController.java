package com.basketapp.basket_app.controllers;

import java.util.List;

import com.basketapp.basket_app.dao.CommentRepos;
import com.basketapp.basket_app.models.Comment;
import com.basketapp.basket_app.services.CommentService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/comment")
@CrossOrigin
public class CommentRestController {
	@Autowired
	CommentRepos commentRepos;
	@Autowired
	CommentService commentService;

	// Get all Comment
	@RequestMapping(method = RequestMethod.GET)
	public List<Comment> getAllComments() {
		return commentService.getAllComments();
	}

	// Get Comment by Id
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public Comment getCommentById(@PathVariable("id") Long id) {
		return commentService.getComment(id);
	}

	@RequestMapping(path = "/getcomment/{id}", method = RequestMethod.GET)
	public List<Comment> getCommentByIdActumlite(@PathVariable("id") Long id) {
		return commentRepos.findByActualite_IdActualite(id);
	}

	// Create comment
	@RequestMapping(method = RequestMethod.POST)
	public Comment createComment(@RequestBody Comment comment) {
		return commentService.createComment(comment);
	}

	// Update comment
	@RequestMapping(method = RequestMethod.PUT)
	public Comment modifierComment(@RequestBody Comment comment) {
		return commentService.updateComment(comment);
	}

	// Delete comment by id
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public void deleteComment(@PathVariable("id") Long id) {
		commentService.deleteComment(id);
	}

}
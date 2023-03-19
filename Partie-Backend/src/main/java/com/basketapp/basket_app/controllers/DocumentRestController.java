package com.basketapp.basket_app.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.basketapp.basket_app.dao.DocumentRepos;
import com.basketapp.basket_app.models.Document;
import com.basketapp.basket_app.services.DocumentService;

@RestController
@RequestMapping("/document")
@CrossOrigin
public class DocumentRestController {

	@Autowired
	DocumentService documentService;

	@Autowired
	DocumentRepos documentRepos;

	// Get all
	@RequestMapping(method = RequestMethod.GET)
	public List<Document> getAllDocuments() {
		return documentService.getAllDocuments();
	}

	// Get by Id
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public Document getDocumentById(@PathVariable("id") Long id) {
		return documentService.getDocument(id);
	}

	// Create
	@RequestMapping(method = RequestMethod.POST)
	public Document createActualite(@RequestBody Document d) {
		return documentService.createDocument(d);
	}

	// Update
	@RequestMapping(method = RequestMethod.PUT)
	public Document modifierActualite(@RequestBody Document d) {
		return documentService.modifierDocument(d);
	}

	// Delete
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public void deleteDocument(@PathVariable("id") Long id) {
		documentService.deleteDocument(id);
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.PUT)
	public Document modifierImage(@PathVariable("id") Long id, @RequestParam("contenu") MultipartFile file)
			throws Exception {
		Document d = documentRepos.findById(id).get();
		d.setContenu(file.getBytes());
		return documentRepos.save(d);
	}

}

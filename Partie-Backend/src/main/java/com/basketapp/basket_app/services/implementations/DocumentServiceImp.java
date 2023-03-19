package com.basketapp.basket_app.services.implementations;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.basketapp.basket_app.dao.DocumentRepos;

import com.basketapp.basket_app.models.Document;
import com.basketapp.basket_app.services.DocumentService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class DocumentServiceImp implements DocumentService {

	
    @Autowired
    DocumentRepos documentRepos;
	@Override
	public Document createDocument(Document d) {
        return documentRepos.save(d);
	}

	@Override
	public void deleteDocument(Long id) {
		documentRepos.deleteById(id);		
	}

	@Override
	public Document modifierDocument(Document d) {
        return documentRepos.save(d);
	}

	@Override
	public Document getDocument(Long id) {
		return documentRepos.findById(id).get();

	}

	@Override
	public List<Document> getAllDocuments() {
        return documentRepos.findAll();
	}

	@Override
	public Document getJson(String Document, MultipartFile file) {
		Document documentJson = new Document();
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			documentJson =objectMapper.readValue(Document, Document.class);		
		}catch(IOException err) {
			System.out.printf("Error",err.toString());
		}	
		
		return documentJson;	}

}

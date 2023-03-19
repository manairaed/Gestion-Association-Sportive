package com.basketapp.basket_app.services;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.basketapp.basket_app.models.Document;


public interface DocumentService {
	Document createDocument (Document d);
    void deleteDocument (Long id); 
    Document modifierDocument (Document d); 
    Document getDocument(Long id);
    List <Document> getAllDocuments(); 
    Document getJson (String Document,MultipartFile file);
}

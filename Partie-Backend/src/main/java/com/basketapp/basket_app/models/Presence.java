package com.basketapp.basket_app.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Presence {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private  Long idPresnce;
    private Boolean absent;
    private Integer nombreAbsence;
    private String username;
    @Temporal(TemporalType.TIMESTAMP)
     @Column(nullable = false)
     @JsonFormat(pattern="yyyy-MM-dd")
     private Date date;

     @PrePersist
     private void onCreate() {
        date = new Date();
    }

    
    
}

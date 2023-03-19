package com.basketapp.basket_app.models;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Actualite {

    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
     private  Long idActualite;

     private String titre;
     @Lob
     private String contenu;
     @Lob
     String image;
     @Temporal(TemporalType.TIMESTAMP)
     @Column(nullable = false)
     @JsonFormat(pattern="yyyy-MM-dd")
     private Date actualitedate;

     @PrePersist
     private void onCreate() {
     actualitedate = new Date();
    }
    @OneToMany (cascade = CascadeType.PERSIST,mappedBy = "actualite")
     private List<Comment> comments ;
}

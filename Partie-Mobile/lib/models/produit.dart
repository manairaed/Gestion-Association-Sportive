class Produit {
  int? idProduit;
  String? nomProduit;
  double? prix;
  String? description;
  String? couleur;
  String? taille;
  String? genre;
  bool? favoris;
  String? image;
  Categorie? categorie;
  Marque? marque;
  double? moy;

  Produit(
      {this.idProduit,
      this.nomProduit,
      this.prix,
      this.description,
      this.couleur,
      this.taille,
      this.genre,
      this.favoris,
      this.image,
      this.categorie,
      this.marque,
      this.moy});

  Produit.fromJson(Map<String, dynamic> json) {
    idProduit = json['idProduit'];
    nomProduit = json['nomProduit'];
    prix = json['prix'];
    description = json['description'];
    couleur = json['couleur'];
    taille = json['taille'];
    genre = json['genre'];
    favoris = json['favoris'];
    image = json['image'];
    categorie = json['categorie'] != null
        ? new Categorie.fromJson(json['categorie'])
        : null;
    marque =
        json['marque'] != null ? new Marque.fromJson(json['marque']) : null;
    moy = json['moy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idProduit'] = this.idProduit;
    data['nomProduit'] = this.nomProduit;
    data['prix'] = this.prix;
    data['description'] = this.description;
    data['couleur'] = this.couleur;
    data['taille'] = this.taille;
    data['genre'] = this.genre;
    data['favoris'] = this.favoris;
    data['image'] = this.image;
    if (this.categorie != null) {
      data['categorie'] = this.categorie!.toJson();
    }
    if (this.marque != null) {
      data['marque'] = this.marque!.toJson();
    }
    data['moy'] = this.moy;
    return data;
  }
}

class Categorie {
  int? idCategorie;
  String? label;

  Categorie({this.idCategorie, this.label});

  Categorie.fromJson(Map<String, dynamic> json) {
    idCategorie = json['idCategorie'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idCategorie'] = this.idCategorie;
    data['label'] = this.label;
    return data;
  }
}

class Marque {
  int? idMarque;
  String? nom;

  Marque({this.idMarque, this.nom});

  Marque.fromJson(Map<String, dynamic> json) {
    idMarque = json['idMarque'];
    nom = json['nom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idMarque'] = this.idMarque;
    data['nom'] = this.nom;
    return data;
  }
}
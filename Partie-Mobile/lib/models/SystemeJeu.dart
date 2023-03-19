class SystemeJeu {
  int? idSystemeJeux;
  String? nom;
  String? description;
  String? dateCreation;
  bool? favoris;
  bool? attaquePlace;
  String? image;
  String? auteur;

  SystemeJeu(
      {this.idSystemeJeux,
      this.nom,
      this.description,
      this.dateCreation,
      this.favoris,
      this.attaquePlace,
      this.image,
      this.auteur});

  SystemeJeu.fromJson(Map<String, dynamic> json) {
    idSystemeJeux = json['idSystemeJeux'];
    nom = json['nom'];
    description = json['description'];
    dateCreation = json['dateCreation'];
    favoris = json['favoris'];
    attaquePlace = json['attaquePlace'];
    image = json['image'];
    auteur = json['auteur'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idSystemeJeux'] = this.idSystemeJeux;
    data['nom'] = this.nom;
    data['description'] = this.description;
    data['dateCreation'] = this.dateCreation;
    data['favoris'] = this.favoris;
    data['attaquePlace'] = this.attaquePlace;
    data['image'] = this.image;
    data['auteur'] = this.auteur;
    return data;
  }
}
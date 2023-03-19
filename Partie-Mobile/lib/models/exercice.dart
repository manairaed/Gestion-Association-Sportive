class Exercice {
  int? idExercice;
  String? nom;
  String? image;
  String? type;
  String? description;

  Exercice(
      {this.idExercice, this.nom, this.image, this.type, this.description});

  Exercice.fromJson(Map<String, dynamic> json) {
    idExercice = json['idExercice'];
    nom = json['nom'];
    image = json['image'];
    type = json['type'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idExercice'] = this.idExercice;
    data['nom'] = this.nom;
    data['image'] = this.image;
    data['type'] = this.type;
    data['description'] = this.description;
    return data;
  }
}
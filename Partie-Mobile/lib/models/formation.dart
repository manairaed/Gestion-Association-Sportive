class Formation {
  int? idFormation;
  String? nom;
  String? description;
  String? type;
  String? image;

  Formation(
      {this.idFormation, this.nom, this.description, this.type, this.image});

  Formation.fromJson(Map<String, dynamic> json) {
    idFormation = json['idFormation'];
    nom = json['nom'];
    description = json['description'];
    type = json['type'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idFormation'] = this.idFormation;
    data['nom'] = this.nom;
    data['description'] = this.description;
    data['type'] = this.type;
    data['image'] = this.image;
    return data;
  }
}
class GalerieModel {
  int? idGalerie;
  String? titre;
  String? image1;
  String? image2;
  String? image3;
  String? image4;
  String? image5;

  GalerieModel(
      {this.idGalerie,
      this.titre,
      this.image1,
      this.image2,
      this.image3,
      this.image4,
      this.image5});

  GalerieModel.fromJson(Map<String, dynamic> json) {
    idGalerie = json['idGalerie'];
    titre = json['titre'];
    image1 = json['image1'];
    image2 = json['image2'];
    image3 = json['image3'];
    image4 = json['image4'];
    image5 = json['image5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idGalerie'] = this.idGalerie;
    data['titre'] = this.titre;
    data['image1'] = this.image1;
    data['image2'] = this.image2;
    data['image3'] = this.image3;
    data['image4'] = this.image4;
    data['image5'] = this.image5;
    return data;
  }
}
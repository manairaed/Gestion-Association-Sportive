class Document {
  int? idDocument;
  String? titre;
  String? contenu;

  Document({this.idDocument, this.titre, this.contenu});

  Document.fromJson(Map<String, dynamic> json) {
    idDocument = json['idDocument'];
    titre = json['titre'];
    contenu = json['contenu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idDocument'] = this.idDocument;
    data['titre'] = this.titre;
    data['contenu'] = this.contenu;
    return data;
  }
}
import 'dart:convert';

Evenement evenementFormJson(String str) => Evenement.fromJson(jsonDecode(str));

String evenementToJson(Evenement evenement) => json.encode(evenement.toJson());

class Evenement {
  int? idEvenement;
  String? titre;
  String? description;
  String? date;
  String? debut;
  String? fin;
  String? equipe;
  String? equipeadvers;
  String? entainement;
  String? debutEntainement;
  String? finEntainement;

  Evenement(
      {this.idEvenement,
      this.titre,
      this.description,
      this.date,
      this.debut,
      this.fin,
      this.equipe,
      this.equipeadvers,
      this.entainement,
      this.debutEntainement,
      this.finEntainement});

  Evenement.fromJson(Map<String, dynamic> json) {
    idEvenement = json['idEvenement'];
    titre = json['titre'];
    description = json['description'];
    date = json['date'];
    debut = json['debut'];
    fin = json['fin'];
    equipe = json['equipe'];
    equipeadvers = json['equipeadvers'];
    entainement = json['entainement'];
    debutEntainement = json['debutEntainement'];
    finEntainement = json['finEntainement'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idEvenement'] = this.idEvenement;
    data['titre'] = this.titre;
    data['description'] = this.description;
    data['date'] = this.date;
    data['debut'] = this.debut;
    data['fin'] = this.fin;
    data['equipe'] = this.equipe;
    data['equipeadvers'] = this.equipeadvers;
    data['entainement'] = this.entainement;
    data['debutEntainement'] = this.debutEntainement;
    data['finEntainement'] = this.finEntainement;
    return data;
  }
}

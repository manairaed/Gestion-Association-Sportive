import 'package:app_parent/models/Utilisateur.dart';

class Match {
  int? idMatch;
  String? type;
  String? date;
  Ligue? ligue;
  EquipeAdversaire? equipeAdversaire;
  List<Utilisateur>? joueurs;
  Coach? coach;
  Stade? stade;

  Match(
      {this.idMatch,
      this.type,
      this.date,
      this.ligue,
      this.equipeAdversaire,
      this.joueurs,
      this.coach,
      this.stade});

  Match.fromJson(Map<String, dynamic> json) {
    idMatch = json['idMatch'];
    type = json['type'];
    date = json['date'];
    ligue = json['ligue'] != null ? new Ligue.fromJson(json['ligue']) : null;
    equipeAdversaire = json['equipeAdversaire'] != null
        ? new EquipeAdversaire.fromJson(json['equipeAdversaire'])
        : null;
    if (json['joueurs'] != null) {
      joueurs = <Utilisateur>[];
      json['joueurs'].forEach((v) {
        joueurs!.add(new Utilisateur.fromJson(v));
      });
    }
    coach = json['coach'] != null ? new Coach.fromJson(json['coach']) : null;
    stade = json['stade'] != null ? new Stade.fromJson(json['stade']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idMatch'] = this.idMatch;
    data['type'] = this.type;
    data['date'] = this.date;
    if (this.ligue != null) {
      data['ligue'] = this.ligue!.toJson();
    }
    if (this.equipeAdversaire != null) {
      data['equipeAdversaire'] = this.equipeAdversaire!.toJson();
    }
    if (this.joueurs != null) {
      data['joueurs'] = this.joueurs!.map((v) => v.toJson()).toList();
    }
    if (this.coach != null) {
      data['coach'] = this.coach!.toJson();
    }
    if (this.stade != null) {
      data['stade'] = this.stade!.toJson();
    }
    return data;
  }
}

class Ligue {
  int? idLigue;
  String? nomLigue;
  String? saison;
  List<Null>? equipes;

  Ligue({this.idLigue, this.nomLigue, this.saison, this.equipes});

  Ligue.fromJson(Map<String, dynamic> json) {
    idLigue = json['idLigue'];
    nomLigue = json['nomLigue'];
    saison = json['saison'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idLigue'] = this.idLigue;
    data['nomLigue'] = this.nomLigue;
    data['saison'] = this.saison;
    return data;
  }
}

class EquipeAdversaire {
  int? idEquipe;
  String? nom;
  String? logo;

  EquipeAdversaire({this.idEquipe, this.nom, this.logo});

  EquipeAdversaire.fromJson(Map<String, dynamic> json) {
    idEquipe = json['idEquipe'];
    nom = json['nom'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idEquipe'] = this.idEquipe;
    data['nom'] = this.nom;
    data['logo'] = this.logo;
    return data;
  }
}

class Coach {
  int? idUtil;
  String? nomUtil;
  String? prenomUtil;

  Coach({this.idUtil, this.nomUtil, this.prenomUtil});

  Coach.fromJson(Map<String, dynamic> json) {
    idUtil = json['idUtil'];
    nomUtil = json['nomUtil'];
    prenomUtil = json['prenomUtil'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idUtil'] = this.idUtil;
    data['nomUtil'] = this.nomUtil;
    data['prenomUtil'] = this.prenomUtil;
    return data;
  }
}

class Stade {
  int? idStade;
  String? nom;
  String? adresse;
  String? numeroTel;
  String? email;

  Stade({this.idStade, this.nom, this.adresse, this.numeroTel, this.email});

  Stade.fromJson(Map<String, dynamic> json) {
    idStade = json['idStade'];
    nom = json['nom'];
    adresse = json['adresse'];
    numeroTel = json['numeroTel'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idStade'] = this.idStade;
    data['nom'] = this.nom;
    data['adresse'] = this.adresse;
    data['numeroTel'] = this.numeroTel;
    data['email'] = this.email;
    return data;
  }
}

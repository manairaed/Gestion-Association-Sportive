class Utilisateur {
  int? idUtil;
  String? image;
  String? username;
  String? password;

  String? nomUtil;
  String? prenomUtil;
  String? numTelUtil;
  String? emailUtil;
  List<Roles>? roles;

  Utilisateur(
      {this.idUtil,
       this.image,
      this.username,
      this.password,
     
      this.nomUtil,
      this.prenomUtil,
      this.numTelUtil,
      this.emailUtil,
      this.roles});

  Utilisateur.fromJson(Map<String, dynamic> json) {
    idUtil = json['idUtil'];
    image = json['image'];
    username = json['username'];
    password = json['password'];
    
    nomUtil = json['nomUtil'];
    prenomUtil = json['prenomUtil'];
    numTelUtil = json['numTelUtil'];
    emailUtil = json['emailUtil'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idUtil'] = this.idUtil;
    data['image'] = this.image;
    data['username'] = this.username;
    data['password'] = this.password;
 
    data['nomUtil'] = this.nomUtil;
    data['prenomUtil'] = this.prenomUtil;
    data['numTelUtil'] = this.numTelUtil;
    data['emailUtil'] = this.emailUtil;
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Roles {
  int? idRole;
  String? role;

  Roles({this.idRole, this.role});

  Roles.fromJson(Map<String, dynamic> json) {
    idRole = json['idRole'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idRole'] = this.idRole;
    data['role'] = this.role;
    return data;
  }
}
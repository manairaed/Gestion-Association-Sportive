class presence {
  int? idPresnce;
  bool? absent;
  int? nombreAbsence;
  String? username;
  String? date;

  presence(
      {this.idPresnce,
      this.absent,
      this.nombreAbsence,
      this.username,
      this.date,});

  presence.fromJson(Map<String, dynamic> json) {
    idPresnce = json['idPresnce'];
    absent = json['absent'];
    nombreAbsence = json['nombreAbsence'];
    username = json['username'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idPresnce'] = this.idPresnce;
    data['absent'] = this.absent;
    data['nombreAbsence'] = this.nombreAbsence;
    data['username'] = this.username;
    data['date'] = this.date;
    return data;
  }
}
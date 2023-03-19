class comment {
  int? idComment;
  String? label;
  int? likes;
  int? dislikes;
  String? commentdate;
  Userdto? userdto;

  comment(
      {this.idComment,
      this.label,
      this.likes,
      this.dislikes,
      this.commentdate,
      this.userdto,
      });

  comment.fromJson(Map<String, dynamic> json) {
    idComment = json['idComment'];
    label = json['label'];
    likes = json['likes'];
    dislikes = json['dislikes'];
    commentdate = json['commentdate'];
    userdto =
        json['userdto'] != null ? new Userdto.fromJson(json['userdto']) : null;
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idComment'] = this.idComment;
    data['label'] = this.label;
    data['likes'] = this.likes;
    data['dislikes'] = this.dislikes;
    data['commentdate'] = this.commentdate;
    if (this.userdto != null) {
      data['userdto'] = this.userdto!.toJson();
    }
    return data;
  }
}

class Userdto {
  int? idUtil;
  String? nomUtil;
  String? prenomUtil;

  Userdto({this.idUtil, this.nomUtil, this.prenomUtil});

  Userdto.fromJson(Map<String, dynamic> json) {
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

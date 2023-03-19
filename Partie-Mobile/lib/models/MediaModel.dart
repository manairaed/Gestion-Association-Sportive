class MediaModel {
  int? idActualite;
  String? titre;
  String? contenu;
  String? image;
  String? actualitedate;
  List<Comments>? comments;

  MediaModel(
      {this.idActualite,
      this.titre,
      this.contenu,
      this.image,
      this.actualitedate,
      this.comments});

  MediaModel.fromJson(Map<String, dynamic> json) {
    idActualite = json['idActualite'];
    titre = json['titre'];
    contenu = json['contenu'];
    image = json['image'];
    actualitedate = json['actualitedate'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idActualite'] = this.idActualite;
    data['titre'] = this.titre;
    data['contenu'] = this.contenu;
    data['image'] = this.image;
    data['actualitedate'] = this.actualitedate;
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Comments {
  int? idComment;
  String? label;
  int? likes;
  int? dislikes;
  String? commentdate;
  Null? userdto;

  Comments(
      {this.idComment,
      this.label,
      this.likes,
      this.dislikes,
      this.commentdate,
      this.userdto});

  Comments.fromJson(Map<String, dynamic> json) {
    idComment = json['idComment'];
    label = json['label'];
    likes = json['likes'];
    dislikes = json['dislikes'];
    commentdate = json['commentdate'];
    userdto = json['userdto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idComment'] = this.idComment;
    data['label'] = this.label;
    data['likes'] = this.likes;
    data['dislikes'] = this.dislikes;
    data['commentdate'] = this.commentdate;
    data['userdto'] = this.userdto;
    return data;
  }
}

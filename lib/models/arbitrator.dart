class Arbitrator {
  int? id;
  String? created;
  String? identityPhoto;
  String? photo;
  dynamic profile;
  dynamic grade;
  dynamic club;

  Arbitrator(
      {this.id,
      this.created,
      this.identityPhoto,
      this.photo,
      this.profile,
      this.grade,
      this.club});

  Arbitrator.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    created = json['created'];
    identityPhoto = json['identity_photo'];
    photo = json['photo'];
    profile = json['profile'];
    grade = json['grade'];
    club = json['club'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created'] = created;
    data['identity_photo'] = identityPhoto;
    data['photo'] = photo;
    data['profile'] = profile;
    data['grade'] = grade;
    data['club'] = club;
    return data;
  }
}

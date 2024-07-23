class Mosayer {
  int? id;
  String? created;
  // String? identityPhoto;
  String? photo;
  dynamic profile;
  dynamic discipline;
  dynamic club;

  Mosayer(
      {this.id,
      this.created,
      // this.identityPhoto,
      this.photo,
      this.profile,
      this.discipline,
      this.club});

  Mosayer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    created = json['created'];
    // identityPhoto = json['identity_photo'];
    photo = json['photo'];
    profile = json['profile'];
    discipline = json['discipline'];
    club = json['club'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created'] = created;
    // data['identity_photo'] = identityPhoto;
    data['photo'] = photo;
    data['profile'] = profile;
    data['discipline'] = discipline;
    data['club'] = club;
    return data;
  }
}

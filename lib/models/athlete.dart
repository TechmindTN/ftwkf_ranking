class Athlete {
  int? id;
  String? created;
  dynamic categoryId;
  dynamic gradeId;
  dynamic idDegree;
  String? photo;
  String? identityPhoto;
  String? medicalPhoto;
  dynamic discipline;
  dynamic profile;
  dynamic weights;
  dynamic club;

  Athlete(
      {this.id,
      this.created,
      this.categoryId,
      this.gradeId,
      this.idDegree,
      this.photo,
      this.identityPhoto,
      this.medicalPhoto,
      this.discipline,
      this.profile,
      this.weights,
      this.club});

  Athlete.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    created = json['created'];
    categoryId = json['category_id'];
    gradeId = json['grade_id'];
    idDegree = json['id_degree'];
    photo = json['photo'];
    identityPhoto = json['identity_photo'];
    medicalPhoto = json['medical_photo'];
    discipline = json['discipline'];
    profile = json['profile'];
    weights = json['weights'];
    club = json['club'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created'] = created;
    data['category_id'] = categoryId;
    data['grade_id'] = gradeId;
    data['id_degree'] = idDegree;
    data['photo'] = photo;
    data['identity_photo'] = identityPhoto;
    data['medical_photo'] = medicalPhoto;
    data['discipline'] = discipline;
    data['profile'] = profile;
    data['weights'] = weights;
    data['club'] = club;
    return data;
  }
}

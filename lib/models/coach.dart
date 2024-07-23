class Coach {
  int? id;
  String? created;
  String? identityPhoto;
  String? degreePhoto;
  String? gradePhoto;
  String? photo;
  dynamic profile;
  dynamic grade;
  dynamic degree;
  dynamic club;
  dynamic categoryId;
  dynamic weights;
  dynamic category;
  dynamic discipline;
  dynamic clubs;

  Coach(
      {this.id,
      this.created,
      this.identityPhoto,
      this.degreePhoto,
      this.gradePhoto,
      this.photo,
      this.profile,
      this.grade,
      this.degree,
      this.club,
      this.categoryId,
      this.weights,
      this.category,
      this.discipline,
      this.clubs
      }
      );

  Coach.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    created = json['created'];
    identityPhoto = json['identity_photo'];
    degreePhoto = json['degree_photo'];
    gradePhoto = json['grade_photo'];
    photo = json['photo'];
    profile = json['profile'];
    grade = json['grade'];
    degree = json['degree'];
    club = json['club'];
    categoryId = json['category_id'];
    weights = json['weights'];
    category = json['category'];
    discipline = json['discipline'];
    clubs = json['all_clubs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created'] = created;
    data['identity_photo'] = identityPhoto;
    data['degree_photo'] = degreePhoto;
    data['grade_photo'] = gradePhoto;
    data['photo'] = photo;
    data['profile'] = profile;
    data['grade'] = grade;
    data['degree'] = degree;
    data['club'] = club;
    data['category_id'] = categoryId;
    data['weights'] = weights;
    data['category'] = category;
    data['discipline'] = discipline;
    return data;
  }
}

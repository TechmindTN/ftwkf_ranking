class Licence {
  String? numLicences;
  String? created;
  bool? activated;
  String? state;
  bool? verified;
  int? user;
  dynamic role;
  dynamic seasons;
  dynamic degree;
  dynamic grade;
  dynamic weight;
  dynamic categorie;
  dynamic club;
  dynamic discipline;
  dynamic ligue;
  int? points;
  int? rank;

  Licence(
      {this.numLicences,
      this.created,
      this.ligue,
      this.activated,
      this.state,
      this.verified,
      this.user,
      this.role,
      this.seasons,
      this.degree,
      this.grade,
      this.weight,
      this.categorie,
      this.club,
      this.points,
      this.rank,
      this.discipline});

  Licence.fromJson(Map<String, dynamic> json) {
    numLicences = json['num_licences'];
    created = json['created'];
    activated = json['activated'];
    state = json['state'];
    verified = json['verified'];
    user = json['user'];
    role = json['role'];
    seasons = json['seasons'];
    degree = json['degree'];
    grade = json['grade'];
    weight = json['weight'];
    categorie = json['categorie'];
    club = json['club'];
    ligue = json['ligue'];
    discipline = json['discipline'];
    points = json['points'];
    rank = json['rank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['num_licences'] = numLicences;
    data['created'] = created;
    data['activated'] = activated;
    // data['state'] = this.state;
    data['verified'] = verified;
    data['user'] = user;
    data['role'] = role;
    data['seasons'] = seasons;
    data['degree'] = degree;
    data['grade'] = grade;
    data['weight'] = weight;
    data['categorie'] = categorie;
    data['club'] = club;
    data['ligue'] = ligue;
    data['discipline'] = discipline;
    data['points'] = points;
    data['rank'] = rank;
    return data;
  }
}

class Season {
  int? id;
  String? created;
  String? seasons;
  bool? activated;

  Season({this.id, this.created, this.seasons, this.activated});

  Season.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    created = json['created'];
    seasons = json['Seasons'];
    activated = json['activated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created'] = created;
    data['Seasons'] = seasons;
    data['activated'] = activated;
    return data;
  }
}

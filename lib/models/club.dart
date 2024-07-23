class Club {
  int? id;
  String? created;
  String? name;
  String? logo;
  int? profile;
  int? ligue;
  bool? hasCoach;

  Club({this.id, this.created, this.name, this.logo, this.profile, this.ligue, this.hasCoach});

  Club.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    created = json['created'];
    name = json['name'];
    logo = json['logo'];
    profile = json['profile'];
    ligue = json['ligue'];
    hasCoach = json['default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created'] = created;
    data['name'] = name;
    data['logo'] = logo;
    data['profile'] = profile;
    data['ligue'] = ligue;
    data['default'] = hasCoach;
    return data;
  }
}

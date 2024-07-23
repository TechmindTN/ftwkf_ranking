class Role {
  int? id;
  String? created;
  String? roles;

  Role({this.id, this.created, this.roles});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    created = json['created'];
    roles = json['roles'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created'] = created;
    data['roles'] = roles;
    return data;
  }
}

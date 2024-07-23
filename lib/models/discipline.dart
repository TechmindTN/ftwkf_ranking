class Discipline {
  int? id;
  String? created;
  String? name;
  String? image;
  String? description;

  Discipline({this.id, this.created, this.name, this.image, this.description});

  Discipline.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    created = json['created'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created'] = created;
    data['name'] = name;
    data['image'] = image;
    data['description'] = description;
    return data;
  }
}

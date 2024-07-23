class Grade {
  int? id;
  String? created;
  String? grade;

  Grade({this.id, this.created, this.grade});

  Grade.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    created = json['created'];
    grade = json['Grade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created'] = created;
    data['Grade'] = grade;
    return data;
  }
}

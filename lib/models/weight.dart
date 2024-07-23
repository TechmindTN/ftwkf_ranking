class Weight {
  int? id;
  String? created;
  int? masseEnKillograme;
  int? min;
  int? max;

  Weight({this.id, this.created, this.masseEnKillograme, this.min, this.max});

  Weight.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    created = json['created'];
    masseEnKillograme = json['masse_en_killograme'];
    min = json['min'];
    max = json['max'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created'] = created;
    data['masse_en_killograme'] = masseEnKillograme;
    data['min'] = min;
    data['max'] = max;
    return data;
  }
}

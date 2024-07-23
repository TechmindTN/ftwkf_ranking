class Certificate {
  int? id;
  String? created;
  String? name;
  String? date;
  String? image;
  String? description;
  int? user;
  int? points;
  bool? accepted;

  Certificate(
      {this.id,
      this.accepted,
      this.points,
      this.created,
      this.name,
      this.date,
      this.image,
      this.description,
      this.user});

  Certificate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    points=json['points'];
    created = json['created'];
    name = json['name'];
    date = json['date'].toString();
    image = json['image'];
    description = json['description'];
    user = json['user'];
    accepted = json['accepted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['id'] = this.id;
    data['created'] = DateTime.now().year.toString()+'-'+DateTime.now().month.toString()+'-'+DateTime.now().day.toString();
    data['name'] = this.name;
    data['date'] = this.date;
    data['points']=this.points;
    // this.date;
    data['image'] =this.image;
    //  this.image;
    data['description'] = this.description;
    data['user'] = this.user;
    data['accepted'] = this.accepted;
    return data;
  }
}

class Photo {
  int? id;
  String? url;
  String? path;
  int? size;
  String? name;
  String? extension;
  // ignore: prefer_void_to_null
  Null type;
  String? uploaded;
  int? season;
  int? user;

  Photo(
      {this.id,
      this.url,
      this.path,
      this.size,
      this.name,
      this.extension,
      this.type,
      this.uploaded,
      this.season,
      this.user});

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    path = json['path'];
    size = json['size'];
    name = json['name'];
    extension = json['extension'];
    type = json['type'];
    uploaded = json['uploaded'];
    season = json['season'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    data['path'] = path;
    data['size'] = size;
    data['name'] = name;
    data['extension'] = extension;
    data['type'] = type;
    data['uploaded'] = uploaded;
    data['season'] = season;
    data['user'] = user;
    return data;
  }
}

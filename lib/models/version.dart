class Version {
  int? id;
  String? created;
  String? version;
  bool? latest;
  String? url;
  bool? valid;

  Version(
      {this.id, this.created, this.version, this.latest, this.url, this.valid});

  Version.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    created = json['created'];
    version = json['version'];
    latest = json['latest'];
    url = json['url'];
    valid = json['valid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created'] = created;
    data['version'] = version;
    data['latest'] = latest;
    data['url'] = url;
    data['valid'] = valid;
    return data;
  }
}

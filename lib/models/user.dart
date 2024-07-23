import 'club.dart';

class User {
  int? id;
  bool? isSuperuser;
  String? username;
  bool? isStaff;
  bool? isActive;
  DateTime? dateJoined;
  String? password;
  Club? club;
  List<Club>? clubs;

  User(
      {this.id,
      this.isSuperuser,
      this.username,
      this.isStaff,
      this.isActive,
      this.dateJoined,
      this.password,
      this.club
      });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isSuperuser = json['is_superuser'];
    username = json['username'];
    isStaff = json['is_staff'];
    isActive = json['is_active'];
    dateJoined = json['date_joined'];
    // club = (json['club'].length<0)?Club.fromJson(json['club'][0]):Club();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['is_superuser'] = isSuperuser;
    data['username'] = username;
    data['is_staff'] = isStaff;
    data['is_active'] = isActive;
    data['date_joined'] = dateJoined;
    data['password'] = password;
    // data['club'] = this.club!.id;

    return data;
  }
}

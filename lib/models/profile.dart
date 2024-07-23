class Profile {
  int? id;
  String? created;
  String? sexe;
  String? firstName;
  String? lastName;
  String? country;
  String? state;
  String? city;
  String? address;
  int? zipCode;
  String? profilePhoto;
  int? phone;
  String? location;
  String? birthday;
  String? cin;
  int? role;
  int? user;
  String? video;
  // Null? licences;

  Profile(
      {this.id,
      this.video,
      this.created,
      this.sexe,
      this.firstName,
      this.lastName,
      this.country,
      this.state,
      this.city,
      this.address,
      this.zipCode,
      this.profilePhoto,
      this.phone,
      this.location,
      this.birthday,
      this.cin,
      this.role,
      this.user
      // this.licences
      });

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    created = json['created'];
    sexe = json['sexe'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    address = json['address'];
    zipCode = json['zip_code'];
    profilePhoto = json['profile_photo'];
    phone = json['phone'];
    location = json['location'];
    birthday = json['birthday'];
    cin = json['cin'];
    role = json['role'];
    user = json['user'];
    video = json['video'];
    // licences = json['licences'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created'] = created;
    data['sexe'] = sexe;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['country'] = country;
    data['state'] = state;
    data['city'] = city;
    data['address'] = address;
    data['zip_code'] = zipCode;
    data['profile_photo'] = profilePhoto;
    data['phone'] = phone;
    data['location'] = location;
    data['birthday'] = birthday;
    data['cin'] = cin;
    data['role'] = role;
    data['user_id'] = user;
    data['video'] = video;
    // data['licences'] = this.licences;
    return data;
  }
}

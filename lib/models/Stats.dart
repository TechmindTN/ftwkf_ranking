// ignore_for_file: file_names

class Stats {
  int? athletes;
  int? coaches;
  int? arbitrators;
  int? supporters;
  int? clubs;
  int? activeLicences;
  int? pendingLicences;
  int? expiredLicences;
  int? totalLicences;
  AthletesLicences? athletesLicences;
  AthletesLicences? coachesLicences;
  AthletesLicences? arbitratorsLicences;
  AthletesLicences? supportersLicences;
  Users? users;

  Stats(
      {this.athletes,
      this.coaches,
      this.arbitrators,
      this.supporters,
      this.clubs,
      this.activeLicences,
      this.pendingLicences,
      this.expiredLicences,
      this.athletesLicences,
      this.coachesLicences,
      this.arbitratorsLicences,
      this.supportersLicences,
      this.totalLicences,
      this.users});

  Stats.fromJson(Map<String, dynamic> json) {
    athletes = json['athletes'];
    coaches = json['coaches'];
    arbitrators = json['arbitrators'];
    totalLicences = json['total_licences'];
    supporters = json['supporters'];
    clubs = json['clubs'];
    activeLicences = json['active_licences'];
    pendingLicences = json['pending_licences'];
    expiredLicences = json['expired_licences'];
    athletesLicences = json['athletes_licences'] != null
        ? AthletesLicences.fromJson(json['athletes_licences'])
        : null;
    coachesLicences = json['coaches licences'] != null
        ? AthletesLicences.fromJson(json['coaches licences'])
        : null;
    arbitratorsLicences = json['arbitrators licences'] != null
        ? AthletesLicences.fromJson(json['arbitrators licences'])
        : null;
    supportersLicences = json['supporters licences'] != null
        ? AthletesLicences.fromJson(json['supporters licences'])
        : null;
    users = json['users'] != null ? Users.fromJson(json['users']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['athletes'] = athletes;
    data['coaches'] = coaches;
    data['arbitrators'] = arbitrators;
    data['supporters'] = supporters;
    data['clubs'] = clubs;
    data['active_licences'] = activeLicences;
    data['pending_licences'] = pendingLicences;
    data['expired_licences'] = expiredLicences;
    if (athletesLicences != null) {
      data['athletes_licences'] = athletesLicences!.toJson();
    }
    if (coachesLicences != null) {
      data['coaches licences'] = coachesLicences!.toJson();
    }
    if (arbitratorsLicences != null) {
      data['arbitrators licences'] = arbitratorsLicences!.toJson();
    }
    if (supportersLicences != null) {
      data['supporters licences'] = supportersLicences!.toJson();
    }
    if (users != null) {
      data['users'] = users!.toJson();
    }
    return data;
  }
}

class AthletesLicences {
  int? total;
  int? active;
  int? pending;
  int? expired;

  AthletesLicences({this.total, this.active, this.pending, this.expired});

  AthletesLicences.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    active = json['active'];
    pending = json['pending'];
    expired = json['expired'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['active'] = active;
    data['pending'] = pending;
    data['expired'] = expired;
    return data;
  }
}

class Users {
  int? total;
  int? active;
  int? inactive;
  int? staff;
  int? admins;

  Users({this.total, this.active, this.inactive, this.staff, this.admins});

  Users.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    active = json['active'];
    inactive = json['inactive'];
    staff = json['staff'];
    admins = json['admins'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['active'] = active;
    data['inactive'] = inactive;
    data['staff'] = staff;
    data['admins'] = admins;
    return data;
  }
}

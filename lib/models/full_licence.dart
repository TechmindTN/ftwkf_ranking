import 'package:mobile_ftwkf_ranking/models/arbitrator.dart';
import 'package:mobile_ftwkf_ranking/models/coach.dart';
import 'package:mobile_ftwkf_ranking/models/moheb.dart';
import 'package:mobile_ftwkf_ranking/models/morafek.dart';
import 'package:mobile_ftwkf_ranking/models/mosayer.dart';
import 'package:mobile_ftwkf_ranking/models/profile.dart';
import 'package:mobile_ftwkf_ranking/models/user.dart';
import 'athlete.dart';
import 'licence.dart';

class FullLicence{
  User? user;
  Profile? profile;
  Licence? licence;
  Athlete? athlete;
  Arbitrator? arbitrator;
  Coach? coach;
  Moheb? moheb;
  Morafek? morafek;
  Mosayer? mosayer;

  FullLicence({
    this.profile,
    this.arbitrator,
    this.athlete,
    this.coach,
    this.licence,
    this.user,
    this.moheb,
    this.morafek,
    this.mosayer
  });


}
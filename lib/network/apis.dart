import 'package:dio/dio.dart';

class Apis {
  final Dio dio=Dio();
  final String baseUrl="http://197.14.10.36:20001/api/";
  static late String tempToken;
  //  String tempToken="TOKEN 306bf71e724147547708bd7c7c2b0b22c68c94e1e9dc35b14890279113762c4a";
  final String login="login/";
  final String simpleLogin="simpleLogin/";
  final String createUser="register/";
  final String getLatestVersion="latest_version/";
  final String activateSeason="activate_season/";
  final String validateLicence="validateLicence/";
  final String licenceListInfo="licencelist_info/";
  final String searchLicences="search_licences/";
  final String createDefaultCoach="add_default_coach/";
  final String assignClubToCoach="assign_club_to_coach/";
  final String dateiledStats="detailed_stats/";
  final String paginatedLicenceListInfo="paginated_licence/";
  final String compareLicence="compare_licences/";

  final String getParameters="parameters/";
  final String uploadImage="upload_photo/";
  final String addFullLicence="add_full_licence/";
  final String addSimpleFullLicence="add_simple_full_licence/";
  final String editProfile="profile/";
  final String editAthlete="athlete/";
  final String editLicence="licences/";
  final String editAthleteLicence="edit_athlete_licence/";
  final String editAthleteProfile="edit_athlete_profile/";
  final String editArbitratorProfile="edit_arbitrator_profile/";
  final String editArbitratorLicence="edit_arbitrator_licence/";
  final String editCoachLicence="edit_coach_licence/";
  final String editCoachProfile="edit_coach_profile/";
  final String editClub="club/";
  final String deleteLicence="licences/";
  final String licenceById="licence_info/";
  final String renewArbitratorLicence="renew_arbitrator_licence/";
  final String renewCoachLicence="renew_coach_licence/";
  final String renewLicence="renew_licence/";
  final String addClub="add_club/";
  final String ligue="ligue/";
final String category="categorie/";
final String degree="degree/";
final String grade="grade/";
final String weight="weights/";
final String discipline="discipline/";
final String season="seasons/";
final String generalStats="stats/";
final String clubStats="club_stats/";
final String changeClubPassword="change_club_password/";
final String changePassword="change_password/";
final String searchProfiles="search_profiles/";
final String getStats="stats/";
final String getClubStats="club_stats/";
final String getCertificateByUser="certificates/user_certificates/";
final String addCertificate="certificates/list/";
}










import 'package:flutter/material.dart';
import 'package:mobile_ftwkf_ranking/router/routes.dart';
import 'package:mobile_ftwkf_ranking/screens/athlete/add_athlete/add_athlete_screen.dart';
import 'package:mobile_ftwkf_ranking/screens/auth/login_Screen.dart';
import 'package:mobile_ftwkf_ranking/screens/auth/register_screen.dart';
import 'package:mobile_ftwkf_ranking/screens/certificate/add_certificate_screen.dart';
import 'package:mobile_ftwkf_ranking/screens/certificate/certificate_screen.dart';
import 'package:mobile_ftwkf_ranking/screens/certificate/certificates_list_screen.dart';
import 'package:mobile_ftwkf_ranking/screens/certificate/upload_certificate_image.dart';
import 'package:mobile_ftwkf_ranking/screens/club/choose_club_screen.dart';
import 'package:mobile_ftwkf_ranking/screens/home/home_screen.dart';
import 'package:mobile_ftwkf_ranking/screens/licence/addlicence/select_role_screen.dart';
import 'package:mobile_ftwkf_ranking/screens/licence/addlicence/upload_athlete_images_screen.dart';
import 'package:mobile_ftwkf_ranking/screens/licence/compare/compare_licence_screen.dart';
import 'package:mobile_ftwkf_ranking/screens/licence/edit%20licence/arbitre/edit_arbitrator_licence_screen.dart';
import 'package:mobile_ftwkf_ranking/screens/licence/edit%20licence/arbitre/edit_arbitre_images_screen.dart';
import 'package:mobile_ftwkf_ranking/screens/licence/edit%20licence/athlete/edit_athlete_images_screen.dart';
import 'package:mobile_ftwkf_ranking/screens/licence/edit%20licence/athlete/edit_licence_screen.dart';
import 'package:mobile_ftwkf_ranking/screens/licence/edit%20licence/coach/edit_coach_images_screen.dart';
import 'package:mobile_ftwkf_ranking/screens/licence/edit%20licence/coach/edit_coach_licence_screen.dart';
import 'package:mobile_ftwkf_ranking/screens/licence/filtered_licences_list.dart';
import 'package:mobile_ftwkf_ranking/screens/licence/licence_list_screen.dart';
import 'package:mobile_ftwkf_ranking/screens/licence/renew%20licence/arbitre/renew_arbitrator_licence_screen.dart';
import 'package:mobile_ftwkf_ranking/screens/licence/renew%20licence/athlete/renew_images_screen.dart';
import 'package:mobile_ftwkf_ranking/screens/licence/renew%20licence/athlete/renew_licence_screen.dart';
import 'package:mobile_ftwkf_ranking/screens/parameters/parameters_screen.dart';
import 'package:mobile_ftwkf_ranking/screens/profile/add_profile/add_profile_screen.dart';
import 'package:mobile_ftwkf_ranking/screens/profile/profile_screen.dart';
import 'package:mobile_ftwkf_ranking/screens/root/root_screen.dart';
import 'package:mobile_ftwkf_ranking/screens/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';
import '../screens/arbitre/add_arbitre_screen.dart';
import '../screens/coach/add_coach/add_coach_screen.dart';
import '../screens/licence/addlicence/upload_arbitre_images_screen.dart';
import '../screens/licence/addlicence/upload_coach_images_screen.dart';
import '../screens/licence/licence_screen.dart';
import '../screens/licence/renew licence/arbitre/renew_arbitrator_images_screen.dart';
import '../screens/licence/renew licence/coach/renew_coach_images_screen.dart';
import '../screens/licence/renew licence/coach/renew_coach_licence_screen.dart';


class Pages{
  static late String root;
  final Routes routes=Routes();
  RouterConfig<Object> router=GoRouter(
    // initialLocation: Routes.Splash,
    initialLocation: Routes.Login,
    routes: [
      GoRoute(path: Routes.Home,
      builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(path: Routes.Splash,
      builder: (context, state) => const MySplashScreen(),
      ),
      GoRoute(path: Routes.Register,
      builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(path: Routes.ProfileScreen,
      builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(path: Routes.CertificateListScreen,
      builder: (context, state) => const CertificateListScreen(),
      ),
      GoRoute(path: Routes.CertificateScreen,
      builder: (context, state) => const CertificateScreen(),
      ),
      GoRoute(path: Routes.AddCertificateScreen,
      builder: (context, state) => const AddCertificateScreen(),
      ),
      GoRoute(path: Routes.UploadCertificateImageScreen,
      builder: (context, state) => const UploadCertificateImages(),
      ),
      // GoRoute(path: Routes.AddClubScreen,
      // builder: (context, state) => AddClubScreen(),
      // ),
      // GoRoute(path: Routes.ClubListScreen,
      // builder: (context, state) => ClubListScreen(),
      // ),
      //       GoRoute(path: Routes.EditClubScreen,
      // builder: (context, state) => EditClubScreen(),
      // ),
      GoRoute(path: Routes.CompareLicence,
      builder: (context, state) => CompareLicenceScreen(),
      ),
      GoRoute(path: Routes.LicenceListScreen,
      builder: (context, state) => LicenceListScreen(),
      ),
      GoRoute(path: Routes.AddAthleteLicenceScreen,
      builder: (context, state) => const AddAthleteScreen(),
      ),
      GoRoute(path: Routes.SelectClubScreen,
      builder: (context, state) => const SelectClubScreen(),
      ),
      GoRoute(path: Routes.Root,
      builder: (context, state) =>  const RootScreen(),
      ),
      GoRoute(path: Routes.AddProfileScreen,
      builder: (context, state) => const AddProfileScreen(),
      ),
      GoRoute(path: Routes.EditAthleteImagesScreen,
      builder: (context, state) => const EditAthleteLicenceImages(),
      ),
      GoRoute(path: Routes.EditAthleteLicenceScreen,
      builder: (context, state) => const EditAthleteLicenceScreen(),
      ),
       GoRoute(path: Routes.EditArbitratorImagesScreen,
      builder: (context, state) => const EditArbitratorLicenceImages(),
      ),
      GoRoute(path: Routes.EditArbitratorLicenceScreen,
      builder: (context, state) => const EditArbitratorLicenceScreen(),
      ),
      GoRoute(path: Routes.EditCoachImagesScreen,
      builder: (context, state) => const EditCoachLicenceImages(),
      ),
      GoRoute(path: Routes.EditCoachLicenceScreen,
      builder: (context, state) => const EditCoachLicenceScreen(),
      ),
      GoRoute(path: Routes.RenewAthleteImages,
      builder: (context, state) => const RenewLicenceImages(),
      ),
      GoRoute(path: Routes.RenewAthleteLicenceScreen,
      builder: (context, state) => const RenewLicenceScreen(),
      ),
      GoRoute(path: Routes.SelectRoleScreen,
      builder: (context, state) => const SelectRoleScreen(),
      ),
      GoRoute(path: Routes.UploadAthleteImagesScreen,
      builder: (context, state) => const UploadAthleteLicenceImages(),
      ),
      GoRoute(path: Routes.UploadCoachImagesScreen,
      builder: (context, state) => const UploadCoachLicenceImages(),
      ),
      GoRoute(path: Routes.UploadArbitreImagesScreen,
      builder: (context, state) => const UploadArbitreLicenceImages(),
      ),
      GoRoute(path: Routes.LicenceScreen,
      builder: (context, state) => const LicenceScreen(),
      ),
      GoRoute(path: Routes.FilteredLicencesScreen,
      builder: (context, state) => const FilteredLicencesScreen(),
      ),
      GoRoute(path: Routes.AddCoachLicenceScreen,
      builder: (context, state) => const AddCoachScreen(),
      ),
      GoRoute(path: Routes.AddArbitreLicenceScreen,
      builder: (context, state) => const AddArbitreScreen(),
      ),
      GoRoute(path: Routes.Login,
      builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(path: Routes.SelectParameterScreen,
      builder: (context, state) => const ParametersScreen(),
      ),
      // GoRoute(path: Routes.LigueListScreen,
      // builder: (context, state) =>LigueListScreen(),
      // ),
      // GoRoute(path: Routes.CategoryListScreen,
      // builder: (context, state) =>CategoryListScreen(),
      // ),
      // GoRoute(path: Routes.GradeListScreen,
      // builder: (context, state) =>GradeListScreen(),
      // ),
      // GoRoute(path: Routes.DegreeListScreen,
      // builder: (context, state) =>DegreeListScreen(),
      // ),
      // GoRoute(path: Routes.DisciplineListScreen,
      // builder: (context, state) =>DisciplineListScreen(),
      // ),
      // GoRoute(path: Routes.WeightListScreen,
      // builder: (context, state) =>WeightListScreen(),
      // ),
      // GoRoute(path: Routes.SeasonListScreen,
      // builder: (context, state) =>SeasonListScreen(),
      // ),
      GoRoute(path: Routes.RenewArbitratorLicenceScreen,
      builder: (context, state) =>const RenewArbitratorLicenceScreen(),
      ),
      GoRoute(path: Routes.RenewArbitratorImagesScreen,
      builder: (context, state) =>const RenewArbitratorLicenceImages(),
      ),
      GoRoute(path: Routes.RenewCoachImagesScreen,
      builder: (context, state) =>const RenewCoachLicenceImages(),
      ),
      GoRoute(path: Routes.RenewCoachLicenceScreen,
      builder: (context, state) =>const RenewCoachLicenceScreen(),
      ),
      // GoRoute(path: Routes.AddLigueScreen,
      // builder: (context, state) =>AddLigueScreen(),
      // ),
      // GoRoute(path: Routes.AddDegreeScreen,
      // builder: (context, state) =>AddDegreeScreen(),
      // ),
      // GoRoute(path: Routes.AddSeasonScreen,
      // builder: (context, state) =>AddSeasonScreen(),
      // ),
      // GoRoute(path: Routes.AddGradeScreen,
      // builder: (context, state) =>AddGradeScreen(),
      // ),
      // GoRoute(path: Routes.AddCategoryScreen,
      // builder: (context, state) =>AddCategoryScreen(),
      // ),
      // GoRoute(path: Routes.AddDisciplineScreen,
      // builder: (context, state) =>AddDisciplineScreen(),
      // ),
      // GoRoute(path: Routes.AddWeightScreen,
      // builder: (context, state) =>AddWeightScreen(),
      // ),
      // GoRoute(path: Routes.ClubScreen,
      // builder: (context, state) =>ClubScreen(),
      // ),
  ]);
}
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile_ftwkf_ranking/models/coach.dart';
import 'package:mobile_ftwkf_ranking/models/full_licence.dart';
import 'package:mobile_ftwkf_ranking/models/licence.dart';
import 'package:mobile_ftwkf_ranking/models/parameters.dart';
import 'package:mobile_ftwkf_ranking/models/stats.dart';
import 'package:mobile_ftwkf_ranking/models/user.dart';
import 'package:mobile_ftwkf_ranking/network/apis.dart';
import 'package:mobile_ftwkf_ranking/network/licence_network.dart';
import 'package:mobile_ftwkf_ranking/screens/auth/login_Screen.dart';
import 'package:mobile_ftwkf_ranking/screens/root/root_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/arbitrator.dart';
import '../models/athlete.dart';
import '../models/category.dart';
import '../models/club.dart';
import '../models/degree.dart';
import '../models/discipline.dart';
import '../models/grade.dart';
import '../models/ligue.dart';
import '../models/profile.dart';
import '../models/role.dart';
import '../models/season.dart';
import '../models/weight.dart';
import 'package:image_picker/image_picker.dart';
import '../router/routes.dart';
import '../widgets/global/snackbars.dart';
import '../widgets/licence/licence_widget.dart';

class LicenceProvider extends ChangeNotifier {
  FullLicence currentFullLicence=FullLicence(
    licence: Licence(),
    profile: Profile(),
    user: User(),
    athlete: Athlete(),
    coach: Coach(),
    arbitrator: Arbitrator()
  );
  final ImagePicker _picker = ImagePicker();
  Stats stats = Stats();
  int currentPage = 0;
  User createdUser=User();
  late Category autoCategory;
  late Season activeSeason;
  List<Role> roles=[Role(roles: 'رياضي',id: 2),Role(roles: 'حكم',id: 1),Role(roles: 'مدرب',id: 4)];
  bool lockScroll = false;
  bool isAscending = true;
  int currentSortColumn = 0;
  List<bool> licenceChecks = [];
  List<bool> clubChecks = [];
  int rowsPerPages = 10;
  bool isShadow = false;
  List<bool> isHovered = [false, false, false, false, false];
  List<Widget> myItems = [];
  Widget next = Container();
  bool isLoading = true;
  late User currentUser;
  late Role selectedRole;
  bool added = false;
  Season? selectedSeason = Season(seasons: "الموسم", id: -1);
  Category? selectedCategory = Category(categorieAge: "العمر", id: -1);
  Grade? selectedGrade = Grade(grade: "Grade", id: -1);
  Ligue? selectedLigue = Ligue(name: "الولاية", id: -1);
  Degree? selectedDegree = Degree(degree: "Degree", id: -1);
  Weight? selectedWeight = Weight(masseEnKillograme: 0, id: -1);
  Discipline? selectedDiscipline = Discipline(name: "الرياضة", id: -1);
  Club? selectedClub = Club(name: "نادي", id: -1);
  Category? filteredCategory = Category(categorieAge: "العمر", id: -1);
  Role? filteredRole = Role(roles: "نوع الاجازة", id: -1);
  Season filteredSeason = Season(seasons: "الموسم", id: -1);
  Grade? filteredGrade = Grade(grade: "Grade", id: -1);
  Degree? filteredDegree = Degree(degree: "Degree", id: -1);
  Weight? filteredWeight = Weight(masseEnKillograme: 0, id: -1);
  Discipline? filteredDiscipline = Discipline(name: "الرياضة", id: -1);
  Club? filteredClub = Club(name: "نادي", id: -1);
  String filteredSex = "الجنس";
  String filteredStatus = "الحالة";
  String selectedStatus = "الحالة";
  DateTime? selectedBirth;
  String selectedSex = "الجنس";
  String selectedState = "الولاية";
  Apis apis = Apis();
  late SharedPreferences prefs;
  FullLicence? createdFullLicence = FullLicence(
      profile: Profile(),
      licence: Licence(),
      user: User(),
      arbitrator: Arbitrator(),
      athlete: Athlete(),
      coach: Coach());
  final picker = ImagePicker();
  Parameters? parameters;
  List<FullLicence> fullLicences = [];
  List<FullLicence> filteredFullLicences = [];

  LicenceNetwork licenceNetwork = LicenceNetwork();
  FullLicence? selectedFullLicence;

  changeRowPerPage() {
    rowsPerPages = 20;
    notify();
  }

  // login(context,login,password) async {

  //   // //print('ddd');
  //   try{
  //     Map<String,dynamic> data={
  //     "username":login,
  //     "password":password
  //   };
  //   print(data);
  //     Response res=await licenceNetwork.login(data);
  //   if(res.statusCode==200){
  //     if(res.data!=null){
  //       print(res.data);
  //       // ignore: prefer_interpolation_to_compose_strings
  //       Apis.tempToken='TOKEN '+res.data['token'];
  //       currentUser=User.fromJson(res.data);
  //        prefs= await SharedPreferences.getInstance();
  //        prefs.setString('user', login);
  //        prefs.setString('psd', password);
  //       GoRouter.of(context).go(Routes.Root);
  //     }
  //   }
  //   else{
  //     final snackBar = MySnackBar(
  //         title: 'فشلت العملية',
  //         msg: 'اسم المستخدم او كلمة المرور خاطئة',
  //         state: ContentType.failure,
  //       );
  //       ScaffoldMessenger.of(context)
  //         ..hideCurrentSnackBar()
  //         ..showSnackBar(snackBar);
  //   }
  //   }
  //   catch(e){
  //     final snackBar = MySnackBar(
  //         title: 'فشلت العملية',
  //         msg: 'اسم المستخدم او كلمة المرور خاطئة',
  //         state: ContentType.failure,
  //       );
  //       ScaffoldMessenger.of(context)
  //         ..hideCurrentSnackBar()
  //         ..showSnackBar(snackBar);
  //   }

  // }


  createUser(context,{required String username,required String psd}) async {
    Map<String, dynamic> data = {"username": username.toString(), "password": psd.toString()};
    print(data);
    Response res = await licenceNetwork.createUser(data);
    print(res.statusMessage);
    if(res.statusCode==200){
      currentUser=User();
      currentUser.id=res.data['user_info']['id'];
      createdUser.id=res.data['user_info']['id'];
      createdUser.username=username;
      createdUser.password=psd;
      createdFullLicence!.user=createdUser;
      createdUser.isSuperuser=false;
      currentUser=createdUser;
      print(currentUser.id);
      GoRouter.of(context).go(Routes.SelectRoleScreen);
    }
  }
   Future<bool> simpleLogin(context, login, password) async {
    // ////print('ddd');
    // try {
      Map<String, dynamic> data = {"username": login, "password": password};
      Response res = await licenceNetwork.simpleLogin(data);
      print(res.data);
      print(res.statusCode);
      if (res.statusCode == 200) {
        if (res.data != null) {
          Apis.tempToken = 'TOKEN ' + res.data['token'];

          currentUser = User.fromJson(res.data['user_data']);
          currentUser.clubs = [];

          currentUser.id = res.data['user_data']['id'];
          currentUser.isSuperuser = res.data['user_data']['is_superuser'];
          currentFullLicence.user=currentUser;
          currentFullLicence.licence=Licence.fromJson(res.data['licence']);
          currentFullLicence.profile=Profile.fromJson(res.data['profile']);
          // prefs = await SharedPreferences.getInstance();
          // prefs.setString('user', login);
          // prefs.setString('psd', password);
          // if (res.data['club'].length > 0) {
          //   for (int i = 0; i < res.data['club'].length; i++) {
          //     Club club = Club.fromJson(res.data['club'][i]);
          //     currentUser.clubs!.add(club);
          //   }
          //   GoRouter.of(context).go(Routes.SelectClubScreen);
          // } else {
            
            // GoRouter.of(context).go(Routes.Home);
            GoRouter.of(context).go(Routes.Root);
          // }
        }
        return true;
      } else {
        final snackBar = MySnackBar(
          title: 'فشل تسجيل الدخول',
          msg: 'رقم الهاتف او كلمة المرور خاطئين',
          state: ContentType.failure,
        );
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
        return false;
      }
    // } catch (e) {
    //   final snackBar = MySnackBar(
    //     title: 'فشل تسجيل الدخول',
    //     msg: 'رقم الهاتف او كلمة المرور خاطئين',
    //     state: ContentType.failure,
    //   );
    //   ScaffoldMessenger.of(context)
    //     ..hideCurrentSnackBar()
    //     ..showSnackBar(snackBar);
    //   return false;
    // }
  }
  Future<bool> login(context, login, password) async {
    // ////print('ddd');
    try {
      Map<String, dynamic> data = {"username": login, "password": password};
      Response res = await licenceNetwork.login(data);
      //print(res.data);
     
      if (res.statusCode == 200) {
        if (res.data != null) {
          Apis.tempToken = 'TOKEN ' + res.data['token'];

          currentUser = User.fromJson(res.data);
          currentUser.clubs = [];

          currentUser.id = res.data['user_data']['id'];
          currentUser.isSuperuser = res.data['user_data']['is_superuser'];
          prefs = await SharedPreferences.getInstance();
          prefs.setString('user', login);
          prefs.setString('psd', password);
          if (res.data['club'].length > 0) {
            for (int i = 0; i < res.data['club'].length; i++) {
              Club club = Club.fromJson(res.data['club'][i]);
              currentUser.clubs!.add(club);
            }
            GoRouter.of(context).go(Routes.SelectClubScreen);
          } else {
            GoRouter.of(context).go(Routes.Home);
          }
        }
        return true;
      } else {
        final snackBar = MySnackBar(
          title: 'فشل تسجيل الدخول',
          msg: 'رقم الهاتف او كلمة المرور خاطئين',
          state: ContentType.failure,
        );
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
        return false;
      }
    } catch (e) {
      final snackBar = MySnackBar(
        title: 'فشل تسجيل الدخول',
        msg: 'رقم الهاتف او كلمة المرور خاطئين',
        state: ContentType.failure,
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
      return false;
    }
  }

  clearPrefs() async {
    prefs = await SharedPreferences.getInstance();
    // prefs.clear();
  }

  checkLogin(context) async {
    prefs = await SharedPreferences.getInstance();
    // prefs.clear();
    if (prefs.containsKey('user') &&
        prefs.getString('user') != null &&
        prefs.getString('user') != "") {
      next = const RootScreen();
      simpleLogin(context, prefs.getString('user'), prefs.getString('psd'));
    } else {
      next = const LoginScreen();
      GoRouter.of(context).go(Routes.Login);
      return true;
    }
  }

  logout(context) async {
    prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
    prefs.remove('psd');
    GoRouter.of(context).go(Routes.Login);
  }

  deleteLicence(id, context) async {
    try {
      Response res = await licenceNetwork.deleteLicence(id);
      if (res.statusCode == 204) {
        final snackBar = MySnackBar(
          title: 'تمت العملية بنجاح',
          msg: 'تم حذف اجازة الرياضي بنجاح',
          state: ContentType.success,
        );
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
        notify();
      } else {
        final snackBar = MySnackBar(
          title: 'فشلت العملية',
          msg: 'لا يمكن حذف هذه الاجازة',
          state: ContentType.failure,
        );
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      }
    } catch (e) {
      final snackBar = MySnackBar(
        title: 'توجد مشكلة',
        msg: 'توجد مشكلة في الوقت الحالي الرجاء اعادة المحاولة لاحقا',
        state: ContentType.failure,
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  showImage(context, img) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Image.network(img),
          );
        });
  }

  // sortColumn(index){

  //   currentSortColumn = index;
  //   if (isAscending == true) {
  //     isAscending = false;
  //     // sort the product list in Ascending, order by Price
  //     fullLicences.sort((licenceA, licenceB) =>
  //         licenceB.licence!.numLicences!.compareTo(licenceA.licence!.numLicences!));
  //         notify();
  //   } else {
  //     isAscending = true;
  //     // sort the product list in Descending, order by Price
  //     fullLicences.sort((licenceA, licenceB) =>
  //         licenceA.licence!.numLicences!.compareTo(licenceB.licence!.numLicences!));
  //         notify();
  //   }
  //   // notify();

  // }

  validateLicence(context) async {
    Response res = await licenceNetwork
        .validateLicence(selectedFullLicence!.licence!.numLicences);
    if (res.statusCode == 200) {
      if (res.data != null) {
        selectedFullLicence!.licence!.activated = true;
        selectedFullLicence!.licence!.state = "نشطة";
        notify();
        final snackBar = MySnackBar(
          title: 'تمت العملية بنجاح',
          msg: 'تمت اضافة اجازة الرياضي بنجاح',
          state: ContentType.success,
        );
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      } else {
        final snackBar = MySnackBar(
          title: 'فشلت العملية',
          msg: 'لقد فشلت اضافة اجازة الرياضي',
          state: ContentType.failure,
        );
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      }
    }
  }

  getLicences() async {
    if (fullLicences.isNotEmpty) {
      fullLicences.clear();
    }
    Response res = await licenceNetwork.getLicenceListInfo(
        // currentUser.club!.id ?? 
        "", currentPage);
    if (res.statusCode == 200) {
      if (res.data != null) {
        for (var r in res.data) {
          if (r['profile'] != null) {
            FullLicence fullLicence = FullLicence();

            Profile profile = Profile.fromJson(r['profile']);
            fullLicence.profile = profile;
            Licence licence = Licence.fromJson(r['licence']);
            fullLicence.licence = licence;
            if (licence.role == "رياضي") {
              Athlete athlete = Athlete.fromJson(r['data']);
              fullLicence.athlete = athlete;
            } else if (licence.role == "حكم") {
              Arbitrator arbitrator = Arbitrator.fromJson(r['data']);
              fullLicence.arbitrator = arbitrator;
            } else if (licence.role == "مدرب") {
              Coach coach = Coach.fromJson(r['data']);
              fullLicence.coach = coach;
            }
            fullLicences.add(fullLicence);
            notify();
          }
        }
        notify();
      }
    }
    isLoading = false;
    notify();
  }

  getNextLicences() async {
    currentPage++;
    // if (fullLicences.isNotEmpty) {
    //   fullLicences.clear();
    // }
    Response res = await licenceNetwork.getLicenceListInfo(
        currentUser.club!.id ?? "", currentPage);
    if (res.statusCode == 200) {
      if (res.data != null) {
        for (var r in res.data) {
          if (r['profile'] != null) {
            FullLicence fullLicence = FullLicence();

            Profile profile = Profile.fromJson(r['profile']);
            fullLicence.profile = profile;
            Licence licence = Licence.fromJson(r['licence']);
            fullLicence.licence = licence;
            if (licence.role == "رياضي") {
              Athlete athlete = Athlete.fromJson(r['data']);
              fullLicence.athlete = athlete;
            } else if (licence.role == "حكم") {
              Arbitrator arbitrator = Arbitrator.fromJson(r['data']);
              fullLicence.arbitrator = arbitrator;
            } else if (licence.role == "مدرب") {
              Coach coach = Coach.fromJson(r['data']);
              fullLicence.coach = coach;
            }
            fullLicences.add(fullLicence);
            notify();
          }
        }
        notify();
      }
    }
    isLoading = false;
    lockScroll = false;
    notify();
  }

  initCreate() {
    initSelected();
    createdFullLicence = FullLicence(
        profile: Profile(),
        licence: Licence(),
        user: User(),
        arbitrator: Arbitrator(),
        athlete: Athlete(),
        coach: Coach());
    selectedFullLicence = FullLicence(
        profile: Profile(),
        licence: Licence(),
        user: User(),
        arbitrator: Arbitrator(),
        athlete: Athlete(),
        coach: Coach());
  }

  initSelected() {
    selectedFullLicence = FullLicence();
    selectedSeason = Season(seasons: "الموسم", id: -1);
    selectedCategory = Category(categorieAge: "العمر", id: -1);
    selectedGrade = Grade(grade: "Grade", id: -1);
    selectedDegree = Degree(degree: "Degree", id: -1);
    selectedWeight = Weight(masseEnKillograme: 0, id: -1);
    selectedDiscipline = Discipline(name: "الرياضة", id: -1);
    selectedClub = Club(name: "نادي", id: -1);
    selectedState = 'الولاية';
    selectedSex = 'الجنس';
  }

  getParameters() async {
    Response res = await licenceNetwork.getParameters();
    if (res.statusCode == 200) {
      if (res.data != null) {
        parameters = Parameters();
        List<Club> clubs = [];
        for (var l in res.data['Clubs']) {
          Club club = Club.fromJson(l);
          clubs.add(club);
          notify();
        }
        parameters!.clubs = clubs;
        notify();
        List<Ligue> ligues = [];
        for (var l in res.data['Ligues']) {
          Ligue ligue = Ligue.fromJson(l);
          ligues.add(ligue);
        }
        parameters!.ligues = ligues;
        List<Grade> grades = [];
        for (var l in res.data['Grades']) {
          Grade grade = Grade.fromJson(l);
          grades.add(grade);
        }
        parameters!.grades = grades;

        List<Degree> degrees = [];
        for (var l in res.data['Degrees']) {
          Degree degree = Degree.fromJson(l);
          degrees.add(degree);
        }
        parameters!.degrees = degrees;

        List<Role> roles = [];
        for (var l in res.data['Roles']) {
          Role role = Role.fromJson(l);
          roles.add(role);
        }
        parameters!.roles = roles;
        List<Weight> weights = [];
        for (var l in res.data['Weights']) {
          Weight weight = Weight.fromJson(l);
          weights.add(weight);
        }
        parameters!.weights = weights;
        List<Category> categories = [];
        for (var l in res.data['Categories']) {
          Category category = Category.fromJson(l);
          categories.add(category);
        }
        parameters!.categories = categories;
        List<Discipline> disciplines = [];
        for (var l in res.data['Disciplines']) {
          Discipline discipline = Discipline.fromJson(l);
          disciplines.add(discipline);
        }
        parameters!.disciplines = disciplines;
        List<Season> seasons = [];
        for (var l in res.data['Seasons']) {
          Season season = Season.fromJson(l);
          seasons.add(season);
        }
        parameters!.seasons = seasons;
        notify();
      }
    }
  }

  notify() {
    notifyListeners();
  }

  getCoachImagePath(String? toFillImage) {
    if (toFillImage == 'profilePhoto') {
      return "image/profile/";
    } else if (toFillImage == 'idphoto') {
      return "image/coach/identity";
    } else if (toFillImage == "photo") {
      return "image/coach/photo";
    } else if (toFillImage == "degreephoto") {
      return "image/coach/degree";
    } else if (toFillImage == "gradephoto") {
      return "image/coach/grade";
    }
  }

  setCoachImagePath(String? toFillImage, String url) {
    if (toFillImage == "profilePhoto") {
      createdFullLicence!.profile!.profilePhoto =
          apis.baseUrl.substring(0, apis.baseUrl.length - 5) + url;
    } else if (toFillImage == 'idphoto') {
      createdFullLicence!.coach!.identityPhoto =
          apis.baseUrl.substring(0, apis.baseUrl.length - 5) + url;
    } else if (toFillImage == "photo") {
      createdFullLicence!.coach!.photo =
          apis.baseUrl.substring(0, apis.baseUrl.length - 5) + url;
    } else if (toFillImage == "gradephoto") {
      createdFullLicence!.coach!.gradePhoto =
          apis.baseUrl.substring(0, apis.baseUrl.length - 5) + url;
    } else if (toFillImage == "degreephoto") {
      createdFullLicence!.coach!.degreePhoto =
          apis.baseUrl.substring(0, apis.baseUrl.length - 5) + url;
    }
  }

  setArbitreImagePath(String? toFillImage, String url) {
    if (toFillImage == "profilePhoto") {
      createdFullLicence!.profile!.profilePhoto =
          apis.baseUrl.substring(0, apis.baseUrl.length - 5) + url;
    } else if (toFillImage == 'idphoto') {
      createdFullLicence!.arbitrator!.identityPhoto =
          apis.baseUrl.substring(0, apis.baseUrl.length - 5) + url;
    } else if (toFillImage == "photo") {
      createdFullLicence!.arbitrator!.photo =
          apis.baseUrl.substring(0, apis.baseUrl.length - 5) + url;
    }
  }

  getArbitreImagePath(String? toFillImage) {
    if (toFillImage == 'profilePhoto') {
      return "image/profile/";
    } else if (toFillImage == 'idphoto') {
      return "image/arbitrator/identity";
    } else if (toFillImage == "photo") {
      return "image/arbitrator/photo";
    }
  }

  getAthleteImagePath(String? toFillImage) {
    if (toFillImage == 'profilePhoto') {
      return "image/profile/";
    } else if (toFillImage == 'idphoto') {
      return "image/athlete/identity";
    } else if (toFillImage == "photo") {
      return "image/athlete/photo";
    } else if (toFillImage == "medphoto") {
      return "image/athlete/medical";
    }
  }

  setAthleteImagePath(String? toFillImage, String url) {
    if (toFillImage == "profilePhoto") {
      createdFullLicence!.profile!.profilePhoto =
          apis.baseUrl.substring(0, apis.baseUrl.length - 5) + url;
    } else if (toFillImage == 'idphoto') {
      createdFullLicence!.athlete!.identityPhoto =
          apis.baseUrl.substring(0, apis.baseUrl.length - 5) + url;
    } else if (toFillImage == "photo") {
      createdFullLicence!.athlete!.photo =
          apis.baseUrl.substring(0, apis.baseUrl.length - 5) + url;
    } else if (toFillImage == "medphoto") {
      createdFullLicence!.athlete!.medicalPhoto =
          apis.baseUrl.substring(0, apis.baseUrl.length - 5) + url;
    }
  }

  pickEditImage(bool fromGallery, context, String? toFillImage) async {
    final XFile? image;
    if (fromGallery) {
      image = await _picker.pickImage(source: ImageSource.gallery);
    } else {
      image = await _picker.pickImage(source: ImageSource.camera);
    }
    String path = getAthleteImagePath(toFillImage);

    uploadEditImage(image!, path, 6, toFillImage);
    Navigator.pop(context);
    // Response res=await licenceNetwork.uploadImage();
  }

  pickAthleteImage(bool fromGallery, context, String? toFillImage) async {
    final XFile? image;
    if (fromGallery) {
      image = await _picker.pickImage(source: ImageSource.gallery);
    } else {
      image = await _picker.pickImage(source: ImageSource.camera);
    }
    String path = getAthleteImagePath(toFillImage);

    uploadAthleteImage(image!, path, 6, toFillImage);
    Navigator.pop(context);
    // Response res=await licenceNetwork.uploadImage();
  }

  pickArbitreImage(bool fromGallery, context, String? toFillImage) async {
    final XFile? image;
    if (fromGallery) {
      image = await _picker.pickImage(source: ImageSource.gallery);
    } else {
      image = await _picker.pickImage(source: ImageSource.camera);
    }
    String path = getArbitreImagePath(toFillImage);

    uploadArbitreImage(image!, path, 6, toFillImage, context);
    Navigator.pop(context);
    // Response res=await licenceNetwork.uploadImage();
  }

  pickCoachImage(bool fromGallery, context, String? toFillImage) async {
    final XFile? image;
    if (fromGallery) {
      image = await _picker.pickImage(source: ImageSource.gallery);
    } else {
      image = await _picker.pickImage(source: ImageSource.camera);
    }

    String path = getCoachImagePath(toFillImage);
    await uploadCoachImage(image!, path, 6, toFillImage);
    Navigator.pop(context);
    // Response res=await licenceNetwork.uploadImage();
  }

  uploadAthleteImage(XFile image, path, season, String? toFillImage) async {
    String fileName = image.path.split('/').last;
    // Map<String, dynamic> tempData = {
    //   "url": image.path,
    //   "path": path,
    //   "season": season,
    //   "user": 274
    // };

    FormData formData = FormData.fromMap({
      "url": await MultipartFile.fromFile(
        image.path,
        filename: fileName,
        // contentType:  MediaType("image", "jpeg"), //important
      ),
      "path": path,
      "season": season,
      "user": 274
    });
    Response res = await licenceNetwork.uploadImage(formData);
    if (res.statusCode == 200) {
      if (res.data != null) {
        setAthleteImagePath(toFillImage, res.data['url']);
        //toFillImage=res.data['url'];

        notify();
      }
    }
  }

  uploadArbitreImage(
      XFile image, path, season, String? toFillImage, context) async {
    String fileName = image.path.split('/').last;
    // Map<String, dynamic> tempData = {
    //   "url": image.path,
    //   "path": path,
    //   "season": season,
    //   "user": 274
    // };

    FormData formData = FormData.fromMap({
      "url": await MultipartFile.fromFile(
        image.path,
        filename: fileName,
        // contentType:  MediaType("image", "jpeg"), //important
      ),
      "path": path,
      "season": season,
      "user": 274
    });
    Response res = await licenceNetwork.uploadImage(formData);
    if (res.statusCode == 200) {
      if (res.data != null) {
        setArbitreImagePath(toFillImage, res.data['url']);
        myItems.clear();
        myItems = [
          ArbitreImageUploadWidget('صورة الحساب', this, context, 'profilePhoto',
              createdFullLicence!.profile!.profilePhoto, 0),
          ArbitreImageUploadWidget('صورة الهوية', this, context, 'idphoto',
              createdFullLicence!.arbitrator!.identityPhoto, 1),
          ArbitreImageUploadWidget('صورة التامين', this, context, 'photo',
              createdFullLicence!.arbitrator!.photo, 2),
          // AthleteImageUploadWidget(
          //     'photo medical',
          //     this,
          //     context,
          //     'medphoto',
          //     this.createdFullLicence!
          //         .arbitrator!.ph,3),
        ];
        //toFillImage=res.data['url'];

        notify();
      }
    }
  }

  uploadCoachImage(XFile image, path, season, String? toFillImage) async {
    String fileName = image.path.split('/').last;
    // Map<String, dynamic> tempData = {
    //   "url": image.path,
    //   "path": path,
    //   "season": season,
    //   "user": 274
    // };
    // FormData formData = FormData.fromMap({
    //   "url": await MultipartFile.fromFile(
    //     image.path,
    //     filename: fileName,
    //     // contentType:  MediaType("image", "jpeg"), //important
    //   ),
    //   "path": path,
    //   "season": season,
    //   "user": 274
    // });
    FormData formData = FormData.fromMap({
      "url": await MultipartFile.fromFile(image.path, filename: fileName),
      "path": path,
      "season": season,
      "user": 274
    });
    Response res = await licenceNetwork.uploadImage(formData);
    if (res.statusCode == 200) {
      if (res.data != null) {
        setCoachImagePath(toFillImage, res.data['url']);
        //toFillImage=res.data['url'];

        notify();
      }
    } else {}
  }

  uploadEditImage(XFile image, path, season, String? toFillImage) async {
    String fileName = image.path.split('/').last;
    // Map<String, dynamic> tempData = {
    //   "url": image.path,
    //   "path": path,
    //   "season": season,
    //   "user": 274
    // };
    FormData formData = FormData.fromMap({
      "url": await MultipartFile.fromFile(
        image.path,
        filename: fileName,
        // contentType:  MediaType("image", "jpeg"), //important
      ),
      "path": path,
      "season": season,
      "user": 274
    });
    Response res = await licenceNetwork.uploadImage(formData);
    if (res.statusCode == 200) {
      if (res.data != null) {
        setAthleteImagePath(toFillImage, res.data['url']);
        //toFillImage=res.data['url'];

        notify();
      }
    }
  }

  createAthleteProfile(
      {String? address,
      String? cin,
      String? firstName,
      String? lastName,
      String? phone,
      String? state}) {
        
    createdFullLicence!.profile!.address = address;
    createdFullLicence!.profile!.birthday = selectedBirth!.year.toString() +
        "-" +
        selectedBirth!.month.toString() +
        "-" +
        selectedBirth!.day.toString();
    // selectedBirth.toString();
    createdFullLicence!.profile!.cin = cin;
    // createdFullLicence.profile.profilePhoto=sele
    createdFullLicence!.profile!.country = 'تونس';
    createdFullLicence!.profile!.firstName = firstName;
    createdFullLicence!.profile!.lastName = lastName;
    createdFullLicence!.profile!.phone = int.parse(phone!);
    createdFullLicence!.profile!.role = 2;
    createdFullLicence!.profile!.sexe = selectedSex;
    DateTime today = DateTime.now();

    // DateTime birthday=DateTime();

    Duration age = today.difference(selectedBirth!);
    // print(age.inDays/365);
    double years = age.inDays / 365;
    if (7 >= years && years >= 6) {
      autoCategory =
          parameters!.categories!.firstWhere((element) => element.id == 11);
    } else if (9 >= years && years >= 8) {
      autoCategory =
          parameters!.categories!.firstWhere((element) => element.id == 10);
    } else if (11 >= years && years >= 10) {
      autoCategory =
          parameters!.categories!.firstWhere((element) => element.id == 6);
    } else if (13 >= years && years >= 12) {
      autoCategory =
          parameters!.categories!.firstWhere((element) => element.id == 5);
    } else if (15 >= years && years >= 14) {
      autoCategory =
          parameters!.categories!.firstWhere((element) => element.id == 4);
    } else if (17 >= years && years >= 16) {
      autoCategory =
          parameters!.categories!.firstWhere((element) => element.id == 3);
    } else if (40 >= years && years >= 18) {
      autoCategory =
          parameters!.categories!.firstWhere((element) => element.id == 2);
    } else {
      autoCategory =
          parameters!.categories!.firstWhere((element) => element.id == 1);
    }
    // createdFullLicence!.profile!.state = selectedState;
    // User user = User(
    //     isSuperuser: false,
    //     username: createdFullLicence!.profile!.phone.toString(),
    //     password: "12345");
    // createdFullLicence!.user = user;
  }

  createCoachProfile(
      {String? address,
      String? cin,
      String? firstName,
      String? lastName,
      String? phone,
      String? state}) {
    createdFullLicence!.profile!.address = address;
    createdFullLicence!.profile!.birthday = selectedBirth!.year.toString() +
        "-" +
        selectedBirth!.month.toString() +
        "-" +
        selectedBirth!.day.toString();
    createdFullLicence!.profile!.cin = cin;
    createdFullLicence!.profile!.firstName = firstName;
    createdFullLicence!.profile!.lastName = lastName;
    createdFullLicence!.profile!.phone = int.parse(phone!);
    createdFullLicence!.profile!.role = 4;
    createdFullLicence!.profile!.sexe = selectedSex;
    createdFullLicence!.profile!.state = selectedState;
    // User user = User(
    //     isSuperuser: false,
    //     username: createdFullLicence!.profile!.phone.toString(),
    //     password: "12345");
    // print(createdFullLicence!.profile!.sexe);

    // createdFullLicence!.user = user;
  }

  createArbitreProfile(
      {String? address,
      String? cin,
      String? firstName,
      String? lastName,
      String? phone,
      String? state}) {
    createdFullLicence!.profile!.address = address;
    createdFullLicence!.profile!.birthday = selectedBirth.toString();
    createdFullLicence!.profile!.cin = cin;
    createdFullLicence!.profile!.firstName = firstName;
    createdFullLicence!.profile!.lastName = lastName;
    createdFullLicence!.profile!.phone = int.parse(phone!);
    createdFullLicence!.profile!.role = 1;
    createdFullLicence!.profile!.sexe = selectedSex;
    createdFullLicence!.profile!.state = selectedState;
    // User user = User(
    //     isSuperuser: false,
    //     username: createdFullLicence!.profile!.phone.toString(),
    //     password: "12345");
    // createdFullLicence!.user = user;
  }

  createArbitre(context) {
    createdFullLicence!.arbitrator!.grade = selectedGrade!.id;
    // if (currentUser.club!.id == null) {
      createdFullLicence!.arbitrator!.club = selectedClub!.id;
    // } else {
    //   createdFullLicence!.arbitrator!.club = currentUser.club!.id;
    // }
    createArbitreLicence(context);
  }

  createArbitreLicence(context) async {
    added = true;
    createdFullLicence!.licence!.grade = selectedGrade!.id;
    // if (currentUser.club!.id == null) {
      createdFullLicence!.arbitrator!.club = selectedClub!.id;
    // } else {
    //   createdFullLicence!.arbitrator!.club = currentUser.club!.id;
    // }
    createdFullLicence!.licence!.activated = false;
    createdFullLicence!.licence!.state = selectedState;
    createdFullLicence!.licence!.verified = false;
    createdFullLicence!.licence!.role = 1;
    Map<String, dynamic> mapdata = {};
    mapdata['licence'] = createdFullLicence!.licence!.toJson();
    mapdata['user'] = currentUser.toJson();
    mapdata['arbitre'] = createdFullLicence!.arbitrator!.toJson();
    mapdata['profile'] = createdFullLicence!.profile!.toJson();
    try {
      Response res = await licenceNetwork.addFullLicence(mapdata);
      if (res.statusCode == 200) {
        //print('ok');
        // Navigator.pop(context);
        // Navigator.pop(context);
        // Navigator.pop(context);
        // final snackBar = MySnackBar(
        //   title: 'تمت العملية بنجاح',
        //   msg: 'تمت اضافة اجازة الرياضي بنجاح',

        //   /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        //   state: ContentType.success,
        // );
        // ScaffoldMessenger.of(context)
        //   ..hideCurrentSnackBar()
        //   ..showSnackBar(snackBar);
      } else {
        //print('not ok');
        //print(res.statusMessage);
        final snackBar = MySnackBar(
          title: 'فشلت العملية',
          msg: 'توجد مشكلة مع هذه الاجازة الرجاء التحقق من المعلومات المعطاة',
          state: ContentType.warning,
        );
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      }
    } catch (e) {
      final snackBar = MySnackBar(
        title: 'يوجد مشكلة',
        msg: 'يوجد مشكلة في هذه اللحظة الرجاء اعادة المحاولة بعد قليل',
        state: ContentType.failure,
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  createAthlete(context) {
    createdFullLicence!.athlete!.categoryId = autoCategory.id;
    // if(createdFullLicence.profile.birthday)
    // createdFullLicence!.athlete!.gradeId = selectedGrade!.id;
    // if (currentUser.club!.id == null) {
      createdFullLicence!.athlete!.club = selectedClub!.id;
    // } else {
    //   createdFullLicence!.athlete!.club = currentUser.club!.id;
    // }
    createdFullLicence!.athlete!.discipline = selectedDiscipline!.id;
    createdFullLicence!.athlete!.weights = selectedWeight!.id;
    // createdFullLicence!.athlete!.idDegree = selectedDegree!.id;

    // print('aaaaaaaaaa');
    createAthleteLicence(context);
  }

  createCoach(context) {
    // createdFullLicence!.coach!.categoryId = selectedCategory!.id;
    // createdFullLicence!.coach!.grade = selectedGrade!.id;
    // if (currentUser.club!.id == null) {
      createdFullLicence!.coach!.club = selectedClub!.id;
    // } else {
    //   createdFullLicence!.coach!.club = currentUser.club!.id;
    // }
    createdFullLicence!.coach!.discipline = selectedDiscipline!.id;
    // createdFullLicence!.coach!.weights = selectedWeight!.id;
    // createdFullLicence!.coach!.degree = selectedDegree!.id;
    createCoachLicence(context);
  }

  createCoachLicence(context) async {
    added = true;
    // createdFullLicence!.licence!.categorie = selectedCategory!.id;
    createdFullLicence!.licence!.grade = selectedGrade!.id;
    // if (currentUser.club!.id == null) {
      createdFullLicence!.licence!.club = selectedClub!.id;
    // } else {
    //   createdFullLicence!.licence!.club = currentUser.club!.id;
    // }
    createdFullLicence!.licence!.discipline = selectedDiscipline!.id;
    // createdFullLicence!.licence!.weight = selectedWeight!.id;
    createdFullLicence!.licence!.degree = selectedDegree!.id;
    createdFullLicence!.licence!.activated = false;
    createdFullLicence!.licence!.state = selectedState;
    createdFullLicence!.licence!.verified = false;
    createdFullLicence!.licence!.role = 4;
    createdFullLicence!.licence!.ligue = selectedLigue!.id;
    createdFullLicence!.licence!.user=currentUser.id;
    createdFullLicence!.licence!.numLicences=currentUser.username;
    Map<String, dynamic> mapdata = {};
    mapdata['licence'] = createdFullLicence!.licence!.toJson();
    mapdata['user'] = currentUser.toJson();
    mapdata['coach'] = createdFullLicence!.coach!.toJson();
    mapdata['profile'] = createdFullLicence!.profile!.toJson();
    print(mapdata);
    // log(
    //   mapdata.toString(),
    //   name: mapdata.toString(),
    //   error: mapdata,
    // );
    try {
      Response res = await licenceNetwork.addSimpleFullLicence(mapdata);
      if (res.statusCode == 200) {
        createdFullLicence!.licence!.role = "مدرب";
        // createdFullLicence!.licence!.categorie = selectedCategory!.categorieAge;
        createdFullLicence!.licence!.grade = selectedGrade!.grade;
        // if (currentUser.club!.id == null) {
          createdFullLicence!.licence!.club = selectedClub!.name;
        // } else {
        //   createdFullLicence!.licence!.club = currentUser.club!.name;
        // }
        createdFullLicence!.licence!.state = res.data['licence']['state'];
        createdFullLicence!.licence!.discipline = selectedDiscipline!.name;
        createdFullLicence!.licence!.ligue = selectedLigue!.name;
        // createdFullLicence!.licence!.weight = selectedWeight!.masseEnKillograme;
        createdFullLicence!.licence!.degree = selectedDegree!.degree;
        // createdFullLicence!.athlete!.categoryId = selectedCategory!.categorieAge;
        // createdFullLicence!.athlete!.gradeId = selectedGrade!.grade;
        // if (currentUser.club!.id == null) {
          createdFullLicence!.coach!.club = selectedClub!.name;
        // } else {
        //   createdFullLicence!.coach!.club = currentUser.club!.name;
        // }
        createdFullLicence!.coach!.discipline = selectedDiscipline!.name;
        // createdFullLicence!.athlete!.weights = selectedWeight!.masseEnKillograme;
        // createdFullLicence!.coach!.idDegree = selectedDegree!.degree;
        createdFullLicence!.licence!.seasons = activeSeason.seasons;
        createdFullLicence!.licence!.numLicences =
            res.data['licence']['num_licences'];
        createdFullLicence!.profile!.id = res.data['profile']['id'];
        createdFullLicence!.coach!.id = res.data['coach']['id'];
        fullLicences.insert(0, createdFullLicence!);
        // fullCoachLicences.insert(0, createdFullLicence!);
        notify();
        ////print('ok');
        // Navigator.pop(context);
        // Navigator.pop(context);
        // Navigator.pop(context);
        // final snackBar = MySnackBar(
        //   title: 'Succees',
        //   msg: 'La licence de ce athlete a ete ajoute avec succees',

        //   /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        //   state: ContentType.success,
        // );
        // ScaffoldMessenger.of(context)
        //   ..hideCurrentSnackBar()
        //   ..showSnackBar(snackBar);
      } else {
        final snackBar = MySnackBar(
          title: 'فشل الاضافة',
          msg: 'تم فشل اضافة اجازة المدرب',
          state: ContentType.warning,
        );
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      }
    } catch (e) {
      final snackBar = MySnackBar(
        title: 'Probleme',
        msg:
            'Il y a une probleme dans cet instant merci d\'essayer ulterieurement',
        state: ContentType.failure,
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  createAthleteLicence(context) async {
    if (selectedWeight!.id == -1) {
      // selectedWeight=null;
      createdFullLicence!.licence!.weight = null;
      createdFullLicence!.athlete!.weights = null;
    }
    added = true;
    createdFullLicence!.licence!.categorie = autoCategory.id;
    // createdFullLicence!.licence!.grade = selectedGrade!.id;
    // if (currentUser.club!.id == null) {
      createdFullLicence!.licence!.club = selectedClub!.id;
    // } else {
    //   createdFullLicence!.licence!.club = currentUser.club!.id;
    // }
    createdFullLicence!.licence!.discipline = selectedDiscipline!.id;
    createdFullLicence!.licence!.ligue = selectedLigue!.id;
    // createdFullLicence!.licence!.weight = selectedWeight!.id;
    // createdFullLicence!.licence!.degree = selectedDegree!.id;
    createdFullLicence!.licence!.activated = false;
    createdFullLicence!.licence!.state = selectedState;
    createdFullLicence!.licence!.verified = false;
    createdFullLicence!.licence!.role = 2;
    Map<String, dynamic> mapdata = {};
    createdFullLicence!.licence!.user=currentUser.id;
    createdFullLicence!.licence!.numLicences=currentUser.username;
    mapdata['licence'] = createdFullLicence!.licence!.toJson();
    mapdata['user'] = currentUser.toJson();
    mapdata['athlete'] = createdFullLicence!.athlete!.toJson();
    mapdata['profile'] = createdFullLicence!.profile!.toJson();
    // mapdata['profile']['licences']=[];
    try {
      print(mapdata);
      Response res = await licenceNetwork.addSimpleFullLicence(mapdata);
      if (res.statusCode == 200) {
        createdFullLicence!.licence!.role = "رياضي";
        createdFullLicence!.licence!.categorie = autoCategory.categorieAge;
        createdFullLicence!.licence!.grade = selectedGrade!.grade;
        // if (currentUser.club!.id == null) {
          createdFullLicence!.licence!.club = selectedClub!.name;
        // } else {
        //   createdFullLicence!.licence!.club = currentUser.club!.name;
        // }
        createdFullLicence!.licence!.state = res.data['licence']['state'];
        createdFullLicence!.licence!.discipline = selectedDiscipline!.name;
        createdFullLicence!.licence!.weight = selectedWeight!.masseEnKillograme;
        createdFullLicence!.licence!.degree = selectedDegree!.degree;
        createdFullLicence!.licence!.ligue = selectedLigue!.name;
        createdFullLicence!.athlete!.categoryId =
            selectedCategory!.categorieAge;
        createdFullLicence!.athlete!.gradeId = selectedGrade!.grade;
        // if (currentUser.club!.id == null) {
          createdFullLicence!.athlete!.club = selectedClub!.name;
        // } else {
        //   createdFullLicence!.athlete!.club = currentUser.club!.name;
        // }
        createdFullLicence!.athlete!.discipline = selectedDiscipline!.name;
        createdFullLicence!.athlete!.weights =
            selectedWeight!.masseEnKillograme;
        createdFullLicence!.athlete!.idDegree = selectedDegree!.degree;
        createdFullLicence!.licence!.numLicences =
            res.data['licence']['num_licences'];
        createdFullLicence!.licence!.seasons = activeSeason.seasons;
        createdFullLicence!.profile!.id = res.data['profile']['id'];
        createdFullLicence!.athlete!.id = res.data['athlete']['id'];
        createdFullLicence!.user=User.fromJson(res.data['user']);
        currentUser=createdFullLicence!.user!;
        
        fullLicences.insert(0, createdFullLicence!);
        notify();
      } else {
        final snackBar = MySnackBar(
          title: 'فشل اضافة',
          msg: 'تم فشل اضافة اجازة الرياضي',
          state: ContentType.warning,
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      }
      notify();
    } catch (e) {
      final snackBar = MySnackBar(
        title: 'Probleme',
        msg:
            'Il y a une probleme dans cet instant merci d\'essayer ulterieurement',
        state: ContentType.failure,
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  showSearchDialog(context, numControl) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SearchDialog(this, numControl, context);
        });
  }

  showFilterDialog(context) {
    selectedSeason = Season(seasons: "الموسم", id: -1);
    selectedCategory = Category(categorieAge: "الوزن", id: -1);
    (currentUser.club!.id != null)
        ? selectedClub = currentUser.club
        : selectedClub = Club(name: "نادي", id: -1);
    selectedDegree = Degree(degree: "Degree", id: -1);
    selectedDiscipline = Discipline(name: "الرياضة", id: -1);
    selectedGrade = Grade(grade: "Grade", id: -1);
    selectedWeight = Weight(masseEnKillograme: 0, id: -1);
    selectedSex = "الجنس";
    selectedStatus = "الحالة";
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return FilterDialog(this, context);
        });
  }

  findLicence(String numLicence, context) {
    bool ok = false;
    for (FullLicence licence in fullLicences) {
      if (licence.licence!.numLicences == numLicence) {
        selectedFullLicence = licence;
        ok = true;
        GoRouter.of(context).push(Routes.LicenceScreen);
        break;
      }
    }
    if (!ok) {
      final snackBar = MySnackBar(
          title: 'رقم الاجازة غير موجود',
          msg: 'رقم الاجازة المطلوب غير موجود الرجاء التحقق منه',
          state: ContentType.failure);
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
    numLicence = '';
  }

  initArbitreFields() {
    for (Grade grade in parameters!.grades!) {
      if (selectedFullLicence!.licence!.grade == grade.grade) {
        selectedGrade = grade;
        break;
      }
    }
    for (Club club in parameters!.clubs!) {
      if (selectedFullLicence!.licence!.club == club.name) {
        selectedClub = club;
        break;
      }
    }
    selectedState = selectedFullLicence!.profile!.state.toString();
    List<String> date = selectedFullLicence!.profile!.birthday!.split('-');
    selectedBirth = DateTime(
      int.parse(date[0]),
      int.parse(date[1]),
      int.parse(date[2]),
    );
    selectedSex = selectedFullLicence!.profile!.sexe!;
  }

  initFields() {
    for (Category cat in parameters!.categories!) {
      if (currentFullLicence!.licence!.categorie == cat.categorieAge) {
        selectedCategory = cat;
        break;
      }
    }
    for (Ligue l in parameters!.ligues!) {
      if (currentFullLicence!.licence!.ligue == l.name) {
        selectedLigue = l;
        break;
      }
    }
    for (Grade grade in parameters!.grades!) {
      if (currentFullLicence!.licence!.grade == grade.grade) {
        selectedGrade = grade;
        break;
      }
    }
    for (Weight weight in parameters!.weights!) {
      if (currentFullLicence!.licence!.weight == weight.masseEnKillograme) {
        selectedWeight = weight;
        break;
      }
    }
    for (Degree deg in parameters!.degrees!) {
      if (currentFullLicence!.licence!.degree == deg.degree) {
        selectedDegree = deg;
        break;
      }
    }
    for (Club club in parameters!.clubs!) {
      if (currentFullLicence!.licence!.club == club.name) {
        selectedClub = club;
        break;
      }
    }
    for (Discipline disc in parameters!.disciplines!) {
      if (currentFullLicence!.licence!.discipline == disc.name) {
        selectedDiscipline = disc;
        break;
      }
    }
    print(currentFullLicence!.profile!.sexe!);
    selectedSex = currentFullLicence!.profile!.sexe!;
    selectedState = currentFullLicence!.profile!.state.toString();
    List<String> date = currentFullLicence!.profile!.birthday!.split('-');
    selectedBirth = DateTime(
      int.parse(date[0]),
      int.parse(date[1]),
      int.parse(date[2]),
    );
    selectedSex = currentFullLicence!.profile!.sexe!;
  }

  editProfile(context, {address, firstName, lastName, cin, phone}) async {
    currentFullLicence!.profile!.address = address;
    currentFullLicence!.profile!.sexe = selectedSex;
    currentFullLicence!.profile!.state = selectedState;
    currentFullLicence!.profile!.firstName = firstName;
    currentFullLicence!.profile!.lastName = lastName;
    currentFullLicence!.profile!.cin = cin;
    currentFullLicence!.profile!.phone = int.parse(phone);
    Map<String, dynamic> mapData = currentFullLicence!.profile!.toJson();
    Response res = await licenceNetwork.editProfile(
        mapData, currentFullLicence!.profile!.id);
    if (res.statusCode == 200) {
      final snackBar = MySnackBar(
          title: 'نجاح التعديل',
          msg: "تم تعديل الاجازة بنجاح",
          state: ContentType.success);
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
      notifyListeners();
    } else {
      final snackBar = MySnackBar(
          title: 'فشل التعديل',
          msg: 'لقد فشل تعديل الاجازة',
          state: ContentType.success);
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  editLicenceAthlete(
    context,
  ) async {
    late Season s;
    for (Season season in parameters!.seasons!) {
      if (season.seasons == currentFullLicence!.licence!.seasons) {
        s = season;
        currentFullLicence!.licence!.seasons = season.id;
      }
    }
    currentFullLicence!.licence!.categorie = selectedCategory!.id;
    currentFullLicence!.licence!.role = 2;
    currentFullLicence!.licence!.ligue = selectedLigue!.id;
    currentFullLicence!.licence!.grade = null;
    currentFullLicence!.licence!.weight = null;
    currentFullLicence!.licence!.degree = null;
    currentFullLicence!.licence!.discipline = selectedDiscipline!.id;
    // if (currentUser.club!.id == null) {
      currentFullLicence!.licence!.club = selectedClub!.id;
      currentFullLicence!.athlete!.club = selectedClub!.id;
    // } else {
    //   currentFullLicence!.licence!.club = currentUser.club!.id;
    //   currentFullLicence!.athlete!.club = currentUser.club!.id;
    // }
    currentFullLicence!.athlete!.categoryId = selectedCategory!.id;
    // currentFullLicence!.athlete!.gradeId = selectedGrade!.id;

    // currentFullLicence!.athlete!.weights = selectedWeight!.id;
    currentFullLicence!.athlete!.idDegree = null;
    currentFullLicence!.athlete!.weights = null;
    currentFullLicence!.athlete!.gradeId = null;
    // currentFullLicence!.athlete!.idDegree = selectedDegree!.id;
    currentFullLicence!.athlete!.discipline = selectedDiscipline!.id;
    Map<String, dynamic> licenceData = currentFullLicence!.licence!.toJson();
    // currentFullLicence!.licence!.categorie = selectedCategory!.categorieAge;
    // currentFullLicence!.licence!.grade = selectedGrade!.grade;
    // currentFullLicence!.licence!.weight = selectedWeight!.masseEnKillograme;
    currentFullLicence!.licence!.grade = null;
    currentFullLicence!.licence!.degree = null;
    currentFullLicence!.licence!.weight = null;
    currentFullLicence!.licence!.degree = selectedDegree!.degree;
    currentFullLicence!.licence!.discipline = selectedDiscipline!.name;
    currentFullLicence!.licence!.club = selectedClub!.name;
    currentFullLicence!.licence!.role = "رياضي";
    currentFullLicence!.licence!.seasons = s.seasons;
    Map<String, dynamic> athleteData = currentFullLicence!.athlete!.toJson();
    Map<String, dynamic> mapData = {
      'licence': licenceData,
      'athlete': athleteData
    };
    print(mapData);
    Response res = await licenceNetwork.editAthleteLicence(mapData);
    if (res.statusCode == 200) {
      final snackBar = MySnackBar(
          title: 'نجاح التعديل',
          msg: 'تم تعديل الاجازة بنجاح',
          state: ContentType.success);
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
      notifyListeners();
    } else {
      final snackBar = MySnackBar(
          title: 'فشل التعديل',
          msg: 'تم فشل تعديل الاجازة',
          state: ContentType.failure);
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  editAthleteProfile(context) async {
    Map<String, dynamic> mapData = {
      'profile': {"profile_photo": createdFullLicence!.profile!.profilePhoto},
      'athlete': {
        "photo": createdFullLicence!.athlete!.photo,
        "identity_photo": createdFullLicence!.athlete!.identityPhoto,
        "medical_photo": createdFullLicence!.athlete!.medicalPhoto,
      }
    };
    Response res = await licenceNetwork.editAthleteProfile(
        mapData, currentFullLicence!.athlete!.id);
    if (res.statusCode == 200) {
      final snackBar = MySnackBar(
          title: 'نجاح التعديل',
          msg: 'تم تعديل الاجازة بنجاح',
          state: ContentType.success);
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
      notifyListeners();
    } else {
      final snackBar = MySnackBar(
          title: 'فشل التعديل',
          msg: 'تم فشل تعديل الاجازة',
          state: ContentType.failure);
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  editArbitratorProfile(context) async {
    Map<String, dynamic> mapData = {
      'profile': {"profile_photo": createdFullLicence!.profile!.profilePhoto},
      'arbitrator': {
        "photo": createdFullLicence!.arbitrator!.photo,
        "identity_photo": createdFullLicence!.arbitrator!.identityPhoto,
      }
    };
    Response res = await licenceNetwork.editArbitratorProfile(
        mapData, currentFullLicence!.arbitrator!.id);
    if (res.statusCode == 200) {
      final snackBar = MySnackBar(
          title: 'نجاح التعديل',
          msg: 'تم تعديل اجازة الحكم بنجاح',
          state: ContentType.success);
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
      notifyListeners();
    } else {
      final snackBar = MySnackBar(
          title: 'فشل التعديل',
          msg: 'تم فشل تعديل اجازة الحكم',
          state: ContentType.failure);
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  editCoachProfile(context) async {
    Map<String, dynamic> mapData = {
      'profile': {"profile_photo": createdFullLicence!.profile!.profilePhoto},
      'coach': {
        "photo": createdFullLicence!.coach!.photo,
        "identity_photo": createdFullLicence!.coach!.identityPhoto,
      }
    };
    Response res = await licenceNetwork.editCoachProfile(
        mapData, currentFullLicence!.coach!.id);
    if (res.statusCode == 200) {
      final snackBar = MySnackBar(
          title: 'نجاح التعديل',
          msg: 'تم تعديل اجازة المدرب بنجاح',
          state: ContentType.success);
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
      notifyListeners();
    } else {
      final snackBar = MySnackBar(
          title: 'فشل التعديل',
          msg: 'تم فشل تعديل اجازة المدرب',
          state: ContentType.failure);
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  editLicenceArbitrator(
    context,
  ) async {
    late Season s;
    for (Season season in parameters!.seasons!) {
      if (season.seasons == currentFullLicence!.licence!.seasons) {
        s = season;
        currentFullLicence!.licence!.seasons = season.id;
      }
    }
    currentFullLicence!.licence!.role = 1;
    currentFullLicence!.licence!.grade = selectedGrade!.id;
    if (currentUser.club!.id == null) {
      if (selectedClub!.id != -1) {
        currentFullLicence!.licence!.club = selectedClub!.id;
        currentFullLicence!.arbitrator!.club = selectedClub!.id;
      } else {
        currentFullLicence!.licence!.club = null;
        currentFullLicence!.arbitrator!.club = null;
      }
    } else {
      currentFullLicence!.licence!.club = currentUser.club!.id;
      currentFullLicence!.arbitrator!.club = currentUser.club!.id;
    }
    currentFullLicence!.arbitrator!.grade = selectedGrade!.id;
    Map<String, dynamic> licenceData = currentFullLicence!.licence!.toJson();
    currentFullLicence!.licence!.grade = selectedGrade!.grade;
    currentFullLicence!.licence!.club = selectedClub!.name;
    currentFullLicence!.licence!.role = "حكم";
    currentFullLicence!.licence!.seasons = s.seasons;
    Map<String, dynamic> arbitratorData =
        currentFullLicence!.arbitrator!.toJson();
    Map<String, dynamic> mapData = {
      'licence': licenceData,
      'arbitrator': arbitratorData
    };
    Response res = await licenceNetwork.editArbitratorLicence(mapData);
    if (res.statusCode == 200) {
      final snackBar = MySnackBar(
          title: 'نجاح التعديل',
          msg: 'تم تعديل اجازة الحكم بنجاح',
          state: ContentType.success);
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
      notifyListeners();
    } else {
      final snackBar = MySnackBar(
          title: 'فشل التعديل',
          msg: 'تم فشل تعديل الاجازة',
          state: ContentType.failure);
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  editLicenceCoach(
    context,
  ) async {
      late Season s;
   for (Season season in parameters!.seasons!) {
      if (season.seasons == currentFullLicence!.licence!.seasons) {
        print('aaaa');
        s = season;
        currentFullLicence!.licence!.seasons = season.id;
      }
    }
    currentFullLicence!.licence!.categorie = null;
    // selectedCategory!.id;
    currentFullLicence!.licence!.role = 4;
    currentFullLicence!.licence!.grade = selectedGrade!.id;
    currentFullLicence!.licence!.weight = null;
    // selectedWeight!.id;
    currentFullLicence!.licence!.degree = selectedDegree!.id;
    currentFullLicence!.licence!.discipline = selectedDiscipline!.id;
    // if (currentUser.club!.id == null) {
      if (selectedClub!.id != -1) {
        currentFullLicence!.licence!.club = selectedClub!.id;
        currentFullLicence!.coach!.club = selectedClub!.id;
      } else {
        currentFullLicence!.licence!.club = null;
        currentFullLicence!.coach!.club = null;
      }
    // } else {
    //   currentFullLicence!.licence!.club = currentUser.club!.id;
    //   currentFullLicence!.coach!.club = currentUser.club!.id;
    // }

    currentFullLicence!.coach!.categoryId = null;
    // selectedCategory!.id;
    currentFullLicence!.coach!.grade = selectedGrade!.id;
    currentFullLicence!.coach!.weights = null;
    //  selectedWeight!.id;
    currentFullLicence!.licence!.ligue = selectedLigue!.id;
    currentFullLicence!.coach!.degree = selectedDegree!.id;
    currentFullLicence!.coach!.discipline = selectedDiscipline!.id;
    Map<String, dynamic> licenceData = currentFullLicence!.licence!.toJson();
    currentFullLicence!.licence!.categorie = null;
    // selectedCategory!.categorieAge;
    currentFullLicence!.licence!.grade = selectedGrade!.grade;
    currentFullLicence!.licence!.weight = null;
    currentFullLicence!.licence!.ligue = selectedLigue!.name;
    currentFullLicence!.licence!.degree = selectedDegree!.degree;
    currentFullLicence!.licence!.discipline = selectedDiscipline!.name;
    currentFullLicence!.licence!.club = selectedClub!.name;
    currentFullLicence!.licence!.role = "مدرب";
    currentFullLicence!.licence!.seasons = s.seasons;
    Map<String, dynamic> coachData = currentFullLicence!.coach!.toJson();
    Map<String, dynamic> mapData = {'licence': licenceData, 'coach': coachData};
    Response res = await licenceNetwork.editCoachLicence(mapData);
    if (res.statusCode == 200) {
      final snackBar = MySnackBar(
          title: 'نجاح التعديل',
          msg: 'تم تعديل اجازة المدرب بنجاح',
          state: ContentType.success);
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
      notifyListeners();
    } else {
      final snackBar = MySnackBar(
          title: 'فشل التعديل',
          msg: 'تم فشل تعديل الاجازة',
          state: ContentType.failure);
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  editArbitratorImages(context) async {
    Map<String, dynamic> mapData = {
      'profile': {"profile_photo": createdFullLicence!.profile!.profilePhoto},
      'arbitrator': {
        "photo": createdFullLicence!.arbitrator!.photo,
        "identity_photo": createdFullLicence!.arbitrator!.identityPhoto,
      }
    };
    Response res = await licenceNetwork.editArbitratorProfile(
        mapData, selectedFullLicence!.arbitrator!.id);
    if (res.statusCode == 200) {
      final snackBar = MySnackBar(
          title: 'نجاح التعديل',
          msg: 'تم تعديل اجازة الحكم بنجاح',
          state: ContentType.success);
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
      notifyListeners();
    } else {
      final snackBar = MySnackBar(
          title: 'فشل التعديل',
          msg: 'تم فشل تعديل الاجازة',
          state: ContentType.failure);
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  editCoachImages(context) async {
    Map<String, dynamic> mapData = {
      'profile': {"profile_photo": createdFullLicence!.profile!.profilePhoto},
      'coach': {
        "photo": createdFullLicence!.coach!.photo,
        "identity_photo": createdFullLicence!.coach!.identityPhoto,
        "degree_photo": createdFullLicence!.coach!.degreePhoto,
        "grade_photo": createdFullLicence!.coach!.gradePhoto,
      }
    };
    Response res = await licenceNetwork.editCoachProfile(
        mapData, selectedFullLicence!.coach!.id);
    if (res.statusCode == 200) {
      final snackBar = MySnackBar(
          title: 'نجاح التعديل',
          msg: 'تم تعديل اجازة المدرب بنجاح',
          state: ContentType.success);
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
      notifyListeners();
    } else {
      final snackBar = MySnackBar(
          title: 'فشل التعديل',
          msg: 'تم فشل تعديل الاجازة',
          state: ContentType.failure);
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  editAthleteImages(context) async {
    Map<String, dynamic> mapData = {
      "photo": createdFullLicence!.athlete!.photo,
      "identity_photo": createdFullLicence!.athlete!.identityPhoto,
      "medical_photo": createdFullLicence!.athlete!.medicalPhoto,
    };
    Response res = await licenceNetwork.editAthleteProfile(
        mapData, selectedFullLicence!.athlete!.id);
    if (res.statusCode == 200) {
      final snackBar = MySnackBar(
          title: 'نجاح التعديل',
          msg: 'تم تعديل الاجازة بنجاح',
          state: ContentType.success);
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
      notifyListeners();
    } else {
      final snackBar = MySnackBar(
          title: 'فشل التعديل',
          msg: 'تم فشل تعديل الاجازة',
          state: ContentType.failure);
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  // editArbitreImages(context) async {
  //   Map<String, dynamic> mapData = {
  //     "photo": createdFullLicence!.arbitrator!.photo,
  //     "identity_photo": createdFullLicence!.arbitrator!.identityPhoto,
  //     // "medical_photo": createdFullLicence!.arbitrator!.medicalPhoto,
  //   };
  //   Response res = await licenceNetwork.editArbitreProfile(
  //       mapData, selectedFullLicence!.arbitrator!.id);
  //   if (res.statusCode == 200) {
  //     //print('ok');
  //     final snackBar = MySnackBar(
  //         title: 'نجاح التعديل',
  //         msg: 'تم تعديل اجازة الحكم بنجاح',
  //         state: ContentType.success);
  //     ScaffoldMessenger.of(context)
  //       ..hideCurrentSnackBar()
  //       ..showSnackBar(snackBar);
  //     notifyListeners();
  //   } else {
  //     final snackBar = MySnackBar(
  //         title: 'فشل التعديل',
  //         msg: 'تم فشل تعديل الاجازة',
  //         state: ContentType.failure);
  //     ScaffoldMessenger.of(context)
  //       ..hideCurrentSnackBar()
  //       ..showSnackBar(snackBar);
  //   }
  // }

  renewLicecne(context) async {
    Map<String, dynamic> mapData = {
      'degree': selectedDegree!.id,
      'grade': selectedGrade!.id,
      'discipline': selectedDiscipline!.id,
      'weight': selectedWeight!.id,
      'club': selectedClub!.id,
      'categorie': selectedCategory!.id,
      'state': "في الانتظار",
      'activated': false
    };
    try {
      Response res = await licenceNetwork.renewLicence(
          mapData, selectedFullLicence!.licence!.numLicences);
      if (res.statusCode == 200) {
        final snackBar = MySnackBar(
            title: "Renouvellement Succees",
            msg: "La licence de ce athlete a ete renouvelee avec succees",
            state: ContentType.success);
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);

        notifyListeners();
      } else {
        final snackBar = MySnackBar(
            title: "Renouvellement Echec",
            msg: "Echec de renouvelee de licence merci de verifier vos donnee",
            state: ContentType.failure);
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      }
    } catch (e) {
      final snackBar = MySnackBar(
          title: "Probleme",
          msg: "Il ya une probleme merci de ressayer ulterieurment",
          state: ContentType.failure);
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  renewArbitratorLicecne(context) async {
    Map<String, dynamic> mapData = {
      'grade': selectedGrade!.id,
      'club': selectedClub!.id,
    };
    try {
      Response res = await licenceNetwork.renewArbitratorLicence(
          mapData, selectedFullLicence!.licence!.numLicences);
      if (res.statusCode == 200) {
        final snackBar = MySnackBar(
            title: 'نجاح التجديد',
            msg: 'تم تجديد اجازة الحكم بنجاح',
            state: ContentType.success);
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
        notifyListeners();
      } else {
        final snackBar = MySnackBar(
            title: 'فشل التجديد',
            msg: 'لقد فشل تجديد الاجازة الرجاء التحقق من المعلومات المعطاة',
            state: ContentType.failure);
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      }
    } catch (e) {
      final snackBar = MySnackBar(
          title: 'توجد مشكلة',
          msg: 'توجد مشكلة في الوقت الحالي الرجاء اعادة المحاولة لاحقا',
          state: ContentType.failure);
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  renewCoachLicecne(context) async {
    Map<String, dynamic> mapData = {
      'degree': selectedDegree!.id,
      'grade': selectedGrade!.id,
      'discipline': selectedDiscipline!.id,
      'weight': selectedWeight!.id,
      'club': selectedClub!.id,
      'categorie': selectedCategory!.id,
    };
    try {
      Response res = await licenceNetwork.renewCoachLicence(
          mapData, selectedFullLicence!.licence!.numLicences);
      if (res.statusCode == 200) {
        final snackBar = MySnackBar(
            title: 'نجاح التجديد',
            msg: 'تم تجديد اجازة المدرب بنجاح',
            state: ContentType.success);
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);

        notifyListeners();
      } else {
        final snackBar = MySnackBar(
            title: 'فشل التجديد',
            msg: 'لقد فشل تجديد الاجازة الرجاء التحقق من المعلومات المعطاة',
            state: ContentType.failure);
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      }
    } catch (e) {
      final snackBar = MySnackBar(
          title: 'توجد مشكلة',
          msg: 'توجد مشكلة في الوقت الحالي الرجاء اعادة المحاولة لاحقا',
          state: ContentType.failure);
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  // filterLicences(context) {
  //   if ((selectedCategory!.id != -1) ||
  //       (selectedClub!.id != -1) ||
  //       (selectedDegree!.id != -1) ||
  //       (selectedDiscipline!.id != -1) ||
  //       (selectedGrade!.id != -1) ||
  //       (selectedWeight!.id != -1) ||
  //       (selectedSeason!.id != -1) ||
  //       (selectedSex != "الجنس") ||
  //       (filteredRole!.id != -1) ||
  //       (selectedStatus != "الحالة")) {
  //     Navigator.pop(context);
  //     GoRouter.of(context).push(Routes.FilteredLicencesScreen);
  //     filteredFullLicences.clear();
  //     for (var element in fullLicences) {
  //       filteredFullLicences.add(element);
  //     }
  //     if (selectedCategory!.id != -1) {
  //       int i = 0;
  //       while (i < filteredFullLicences.length) {
  //         if (filteredFullLicences[i].licence!.categorie !=
  //             selectedCategory!.categorieAge) {
  //           filteredFullLicences.remove(filteredFullLicences[i]);
  //         } else {
  //           i++;
  //         }
  //         notifyListeners();
  //       }
  //     }
  //     if (filteredRole!.id != -1) {
  //       int i = 0;
  //       while (i < filteredFullLicences.length) {
  //         if (filteredFullLicences[i].licence!.role !=
  //             filteredRole!.roles) {
  //           filteredFullLicences.remove(filteredFullLicences[i]);
  //         } else {
  //           i++;
  //         }
  //         notifyListeners();
  //       }
  //     }
  //     if (selectedClub!.id != -1) {
  //       int i = 0;
  //       while (i < filteredFullLicences.length) {
  //         if (filteredFullLicences[i].licence!.club != selectedClub!.name) {
  //           filteredFullLicences.remove(filteredFullLicences[i]);
  //         } else {
  //           i++;
  //         }
  //         notifyListeners();
  //       }
  //     }
  //     if (selectedDegree!.id != -1) {
  //       int i = 0;
  //       while (i < filteredFullLicences.length) {
  //         if (filteredFullLicences[i].licence!.degree !=
  //             selectedDegree!.degree) {
  //           filteredFullLicences.remove(filteredFullLicences[i]);
  //         } else {
  //           i++;
  //         }
  //         notifyListeners();
  //       }
  //     }
  //     if (selectedDiscipline!.id != -1) {
  //       int i = 0;
  //       while (i < filteredFullLicences.length) {
  //         if (filteredFullLicences[i].licence!.discipline !=
  //             selectedDiscipline!.name) {
  //           filteredFullLicences.remove(filteredFullLicences[i]);
  //         } else {
  //           i++;
  //         }
  //         notifyListeners();
  //       }
  //     }
  //     if (selectedGrade!.id != -1) {
  //       int i = 0;
  //       while (i < filteredFullLicences.length) {
  //         if (filteredFullLicences[i].licence!.grade != selectedGrade!.grade) {
  //           filteredFullLicences.remove(filteredFullLicences[i]);
  //         } else {
  //           i++;
  //         }
  //         notifyListeners();
  //       }
  //     }
  //     if (selectedWeight!.id != -1) {
  //       int i = 0;
  //       while (i < filteredFullLicences.length) {
  //         if (filteredFullLicences[i].licence!.weight != null) {
  //           if (filteredFullLicences[i].licence!.weight!.toString() !=
  //               selectedWeight!.masseEnKillograme.toString()) {
  //             filteredFullLicences.remove(filteredFullLicences[i]);
  //           } else {
  //             i++;
  //           }
  //         } else {
  //           i++;
  //         }
  //         notifyListeners();
  //       }
  //     }
  //     if (selectedSeason!.id != -1) {
  //       int i = 0;
  //       while (i < filteredFullLicences.length) {
  //         if (filteredFullLicences[i].licence!.seasons !=
  //             selectedSeason!.seasons) {
  //           filteredFullLicences.remove(filteredFullLicences[i]);
  //         } else {
  //           i++;
  //         }
  //         notifyListeners();
  //       }
  //     }
  //     if (selectedSex != "الجنس") {
  //       int i = 0;
  //       while (i < filteredFullLicences.length) {
  //         if (filteredFullLicences[i].profile!.sexe != selectedSex) {
  //           filteredFullLicences.remove(filteredFullLicences[i]);
  //         } else {
  //           i++;
  //         }
  //         notifyListeners();
  //       }
  //     }
  //     if (selectedStatus != "الحالة") {
  //       int i = 0;
  //       while (i < filteredFullLicences.length) {
  //         if (filteredFullLicences[i].licence!.state != selectedStatus) {
  //           filteredFullLicences.remove(filteredFullLicences[i]);
  //         } else {
  //           i++;
  //         }
  //         notifyListeners();
  //       }
  //     }
  //   } else {
  //     Navigator.pop(context);
  //     final snackBar = MySnackBar(
  //         title: 'لا وجود للتصفية',
  //         msg: 'الرجاء تطبيق معايير للتصفية',
  //         state: ContentType.warning);
  //     ScaffoldMessenger.of(context)
  //       ..hideCurrentSnackBar()
  //       ..showSnackBar(snackBar);
  //   }
  // }

  searchFullLicences(context, id) async {
    Response res = await licenceNetwork.getLicenceById(id);
    if (res.statusCode == 200) {
      // FullLicence licence=FullLicence
      Profile profile = Profile.fromJson(res.data['profile']);
      Athlete athlete = Athlete.fromJson(res.data['athlete']);
      Licence licence = Licence.fromJson(res.data);
      FullLicence fullLicence = FullLicence(
        athlete: athlete,
        profile: profile,
        licence: licence,
      );
      selectedFullLicence = fullLicence;

      final snackBar = MySnackBar(
        title: 'اجازة موجودة',
        msg: 'تم ايجاد الاجازة المطلوبة بنجاح',
        state: ContentType.success,
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
      notify();
      GoRouter.of(context).push(Routes.LicenceScreen);
    } else {
      final snackBar = MySnackBar(
        title: 'اجازة غير موجودة',
        msg: 'الاجازة المطلوبة غير موجودة',
        state: ContentType.failure,
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  searchLicences(context, id, role) async {
    filteredFullLicences.clear();
    fullLicences.clear();
    Response res = await licenceNetwork.searchLicences(id, role);
    if ((res.statusCode == 200)) {
      for (int i = 0; i < res.data.length; i++) {
        Profile profile = Profile.fromJson(res.data[i]['profile']);
        Athlete athlete = Athlete.fromJson(res.data[i]['data']);
        Licence licence = Licence.fromJson(res.data[i]['licence']);

        FullLicence fullLicence = FullLicence(
          athlete: athlete,
          profile: profile,
          licence: licence,
        );
        filteredFullLicences.add(fullLicence);
      }

      fullLicences = filteredFullLicences;
      // FullLicence licence=FullLicence

      GoRouter.of(context).push(Routes.FilteredLicencesScreen);
      final snackBar = MySnackBar(
        title: 'اجازة موجودة',
        msg: 'تم ايجاد الاجازة المطلوبة بنجاح',
        state: ContentType.success,
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
      notify();
    } else {
      final snackBar = MySnackBar(
        title: 'اجازة غير موجودة',
        msg: 'الاجازة المطلوبة غير موجودة',
        state: ContentType.failure,
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
    notify();
  }

  filterLicences(context) async {
    fullLicences.clear();
    // if(selectedRole)
    dynamic role = (filteredRole!.id != -1) ? filteredRole!.id : "";
    dynamic state = (filteredStatus != "الحالة") ? filteredStatus : "";
    // dynamic state=(filteredStatus!.id!=-1)?filteredStatus!.id:"";
    dynamic season = (filteredSeason!.id != -1) ? filteredSeason!.id : "";
    // dynamic season=(filteredRole!.id!=-1)?selectedSeason!.id:"";
    dynamic club;
    if (currentUser.club?.id == null) {
      club = (filteredClub!.id != -1) ? filteredClub!.id : "";
    } else {
      club = currentUser.club?.id;
    }
    dynamic categorie =
        (filteredCategory!.id != -1) ? filteredCategory!.id : "";
    dynamic degree = (filteredDegree!.id != -1) ? filteredDegree!.id : "";
    dynamic grade = (filteredGrade!.id != -1) ? filteredGrade!.id : "";
    dynamic weight = (filteredWeight!.id != -1) ? filteredWeight!.id : "";
    dynamic discipline =
        (filteredDiscipline!.id != -1) ? filteredDiscipline!.id : "";
    // print(object)
    Map<String, dynamic> mapdata = {
      "userid": 274,
      "state": state,
      "page_number": currentPage,
      "page_size": 10,
      "role": role,
      "season": season,
      "club": club,
      "user": "",
      "categorie": categorie,
      "degree": degree,
      "grade": grade,
      "weight": weight,
      "discipline": discipline,
    };
    print(mapdata);
    Response res = await licenceNetwork.filterLicences(mapdata, 10, 10);
    if (res.statusCode == 200) {
      filteredFullLicences.clear();
      for (int i = 0; i < res.data.length; i++) {
        // print(res.data[i]['profile']['role']);
        print(res.data);
        Profile profile = Profile.fromJson(res.data[i]['profile']);
        Licence licence = Licence.fromJson(res.data[i]['licence']);
        late FullLicence fullLicence;
        if (profile.role == 2) {
          Athlete athlete = Athlete.fromJson(res.data[i]['data']);
          fullLicence =
              FullLicence(licence: licence, profile: profile, athlete: athlete);
          filteredFullLicences.add(fullLicence);
        }
        //  else if (profile.role == 1) {
        //   print('data: '+res.data[i]['data'].toString());
        //   Arbitrator arbitrator = Arbitrator.fromJson(res.data[i]['data']);
        //   fullLicence = FullLicence(
        //       licence: licence, profile: profile, arbitrator: arbitrator);
        // }
        else if (profile.role == 4) {
          Coach coach = Coach.fromJson(res.data[i]['data']);
          fullLicence =
              FullLicence(licence: licence, profile: profile, coach: coach);
          filteredFullLicences.add(fullLicence);
        }
        // filteredFullLicences.add(fullLicence);
      }
      fullLicences = filteredFullLicences;

      final snackBar = MySnackBar(
        title: 'اجازة موجودة',
        msg: 'تم ايجاد الاجازة المطلوبة بنجاح',
        state: ContentType.success,
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
      notify();
      print(res.data);
    } else {
      final snackBar = MySnackBar(
        title: 'اجازة غير موجودة',
        msg: 'الاجازة المطلوبة غير موجودة',
        state: ContentType.failure,
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }

    // selectedStatus = "الحالة";
    //  selectedState = "الولاية";
  }

//   filterLicences(context) async {
//     fullLicences.clear();
//     // dynamic role=(filteredRole!.id!=-1)?filteredRole!.id:"";
//       // dynamic state=(filteredStatus!.id!=-1)?filteredStatus!.id:"";
//       // dynamic season=(filteredRole!.id!=-1)?filteredS!.id:"";
//       dynamic club=(filteredClub!.id!=-1)?filteredClub!.id:"";
//       dynamic categorie=(filteredCategory!.id!=-1)?filteredCategory!.id:"";
//       dynamic degree=(filteredDegree!.id!=-1)?filteredDegree!.id:"";
//       dynamic grade=(filteredGrade!.id!=-1)?filteredGrade!.id:"";
//       dynamic weight=(filteredWeight!.id!=-1)?filteredWeight!.id:"";
//       dynamic discipline=(filteredDiscipline!.id!=-1)?filteredDiscipline!.id:"";
//       // print(filteredDiscipline!.id);
//       // print(object)
//       Map<String,dynamic> mapdata={
//         "userid":274,
//         // "state":state,
//         "page_number":currentPage,
//         "page_size":10,
// // "role":role,
// // "season":,
// "club":club,
// "user":"",
// "categorie":categorie,
// "degree":degree,
// "grade":grade,
// "weight":weight,
// "discipline":discipline,
//       };
//     Response res=await licenceNetwork.filterLicences(mapdata, 10, 10);
//     if(res.statusCode==200){
//       filteredFullLicences.clear();
//       for(int i=0;i<res.data.length;i++){
//         Profile profile=Profile.fromJson(res.data[i]['profile']);
//         Licence licence=Licence.fromJson(res.data[i]['licence']);
//         late FullLicence fullLicence;
//         if(profile.role==2){
//           Athlete athlete=Athlete.fromJson(res.data[i]['data']);
//           fullLicence=FullLicence(licence: licence,profile: profile,athlete: athlete);
//         }
//         else if(profile.role==1){
//           Arbitrator arbitrator=Arbitrator.fromJson(res.data[i]['data']);
//           fullLicence=FullLicence(licence: licence,profile: profile,arbitrator: arbitrator);
//         }
//         else if(profile.role==6){
//           Coach coach=Coach.fromJson(res.data[i]['data']);
//           fullLicence=FullLicence(licence: licence,profile: profile,coach: coach);
//         }
//         filteredFullLicences.add(fullLicence);
//       }
//       fullLicences=filteredFullLicences;
//       final snackBar = MySnackBar(
//           title: 'اجازة موجودة',
//           msg: 'تم ايجاد الاجازة المطلوبة بنجاح',
//           state: ContentType.success,
//         );
//         ScaffoldMessenger.of(context)
//           ..hideCurrentSnackBar()
//           ..showSnackBar(snackBar);
//           notify();
//     }
//     else{
//        final snackBar = MySnackBar(
//           title: 'اجازة غير موجودة',
//           msg: 'الاجازة المطلوبة غير موجودة',
//           state: ContentType.failure,
//         );
//         ScaffoldMessenger.of(context)
//           ..hideCurrentSnackBar()
//           ..showSnackBar(snackBar);
//     }
//     lockScroll=false;
//   }
  compareLicence() async {
    Map<String, dynamic> data = {
      'num_licences': selectedFullLicence!.licence!.numLicences,
      'first_name': selectedFullLicence!.profile!.firstName,
      'last_name': selectedFullLicence!.profile!.lastName,
      'sexe': selectedFullLicence!.profile!.sexe,
      'birthday': selectedFullLicence!.profile!.birthday,
    };
    Response res = await licenceNetwork.compareLicence(data);
    print(res.data);
    return res.data;
  }

  filterNextLicences(context) async {
    // fullLicences.clear();
    // dynamic role=(filteredRole!.id!=-1)?filteredRole!.id:"";
    // dynamic state=(filteredStatus!.id!=-1)?filteredStatus!.id:"";
    // dynamic season=(filteredRole!.id!=-1)?filteredS!.id:"";
    dynamic club = (filteredClub!.id != -1) ? filteredClub!.id : "";
    dynamic categorie =
        (filteredCategory!.id != -1) ? filteredCategory!.id : "";
    dynamic degree = (filteredDegree!.id != -1) ? filteredDegree!.id : "";
    dynamic grade = (filteredGrade!.id != -1) ? filteredGrade!.id : "";
    dynamic weight = (filteredWeight!.id != -1) ? filteredWeight!.id : "";
    dynamic discipline =
        (filteredDiscipline!.id != -1) ? filteredDiscipline!.id : "";
    // print(filteredDiscipline!.id);
    // print(object)
    Map<String, dynamic> mapdata = {
      "userid": 274,
      // "state":state,
      "page_number": currentPage,
      "page_size": 10,
// "role":role,
// "season":,
      "club": club,
      "user": "",
      "categorie": categorie,
      "degree": degree,
      "grade": grade,
      "weight": weight,
      "discipline": discipline,
    };
    Response res = await licenceNetwork.filterLicences(mapdata, 10, 10);
    if (res.statusCode == 200) {
      // filteredFullLicences.clear();
      for (int i = 0; i < res.data.length; i++) {
        Profile profile = Profile.fromJson(res.data[i]['profile']);
        Licence licence = Licence.fromJson(res.data[i]['licence']);
        late FullLicence fullLicence;
        if (profile.role == 2) {
          Athlete athlete = Athlete.fromJson(res.data[i]['data']);
          fullLicence =
              FullLicence(licence: licence, profile: profile, athlete: athlete);
          filteredFullLicences.add(fullLicence);
        }
        // else if(profile.role==1){
        //   Arbitrator arbitrator=Arbitrator.fromJson(res.data[i]['data']);
        //   fullLicence=FullLicence(licence: licence,profile: profile,arbitrator: arbitrator);
        // }
        else if (profile.role == 6) {
          Coach coach = Coach.fromJson(res.data[i]['data']);
          fullLicence =
              FullLicence(licence: licence, profile: profile, coach: coach);
          filteredFullLicences.add(fullLicence);
        }
        // filteredFullLicences.add(fullLicence);
      }
      fullLicences = filteredFullLicences;
      final snackBar = MySnackBar(
        title: 'اجازة موجودة',
        msg: 'تم ايجاد الاجازة المطلوبة بنجاح',
        state: ContentType.success,
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
      notify();
    } else {
      final snackBar = MySnackBar(
        title: 'اجازة غير موجودة',
        msg: 'الاجازة المطلوبة غير موجودة',
        state: ContentType.failure,
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
    lockScroll = false;
  }

  getStats() async {
    Response res = await licenceNetwork.getStats();
    if (res.statusCode == 200) {
      stats = Stats.fromJson(res.data);
    } else {}

    notify();
  }

  getClubStats(id) async {
    Response res = await licenceNetwork.getClubStats(id);
    if (res.statusCode == 200) {
      stats = Stats.fromJson(res.data);
    } else {}
    notify();
  }
}

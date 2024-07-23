import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile_ftwkf_ranking/network/club_network.dart';
// import 'package:mobile_ftwkf_ranking/network/club_network.dart';
import '../models/club.dart';
import '../models/parameters.dart';
import '../models/user.dart';
import '../widgets/global/snackbars.dart';
import 'licence_controller.dart';

class ClubProvider extends ChangeNotifier{
  bool isLoading=false;
  ClubNetwork clubNetwork=ClubNetwork();
  late Club selectedClub;
  List<Club>? clubs=[];
  chargeClub(LicenceProvider licenceController) async {
    isLoading=true;
    Parameters? params=await licenceController.getParameters();
    clubs=params!.clubs;
    isLoading=false;
    notify();
  }

  getLigue(){

  }

  createClubProfile(
    LicenceProvider licenceController,
      {String? address,
      String? cin,
      String? firstName,
      String? lastName,
      String? phone,
      String? state}) {
    licenceController.createdFullLicence!.profile!.address = address;
    licenceController.createdFullLicence!.profile!.cin = cin;
    licenceController.createdFullLicence!.profile!.firstName = firstName;
    licenceController.createdFullLicence!.profile!.lastName = lastName;
    licenceController.createdFullLicence!.profile!.phone = int.parse(phone!);
    licenceController.createdFullLicence!.profile!.role = 7;
    licenceController.createdFullLicence!.profile!.sexe = licenceController.selectedSex;
    licenceController.createdFullLicence!.profile!.state = licenceController.selectedState;
    User user = User(
        isSuperuser: false,
        username: licenceController.createdFullLicence!.profile!.phone.toString(),
        password: "12345");
    licenceController.createdFullLicence!.user = user;
  }

  createClub(context,LicenceProvider licenceController,name) async {
    try {
      Club club=Club(name: name,ligue: licenceController.selectedLigue!.id);
       Map<String, dynamic> mapdata = {};
    mapdata['user'] = licenceController.createdFullLicence!.user!.toJson();
    mapdata['club'] = club.toJson();
    mapdata['profile'] = licenceController.createdFullLicence!.profile!.toJson();
      Response res = await clubNetwork.addClub(mapdata);
      if (res.statusCode == 200) {
        // for (Season s in parameters!.seasons!){
        //   if (s.id==res.data['licence']['seasons']){
        //     createdFullLicence!.licence!.seasons=s.seasons;
        //   }
        // }
    // createdFullLicence!.licence!.club = selectedClub!.id;
    // createdFullLicence!.profile!.country=address;
    notify();
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
        final snackBar = MySnackBar(
          title: 'فشلت العملية',
          msg:
              'توجد مشكلة مع هذه الاجازة الرجاء التحقق من المعلومات المعطاة',
          state: ContentType.warning,
        );
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      }
    } catch (e) {
      final snackBar = MySnackBar(
        title: 'يوجد مشكلة',
        msg:
            'يوجد مشكلة في هذه اللحظة الرجاء اعادة المحاولة بعد قليل',
        state: ContentType.failure,
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  editClub(String name,context) async {
    Map<String,dynamic> data={"name":name};
    try{
    Response res=await clubNetwork.editClub(data,selectedClub.id);
    if(res.statusCode==200){
      final snackBar = MySnackBar(
          title: 'تمت العملية بنجاح',
          msg:
              'Les informations du club sont modifiee en succees',
          state: ContentType.success,
        );
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
    }
    else{
      final snackBar = MySnackBar(
          title: 'فشلت العملية',
          msg:
              'توجد مشكلة مع هذه الاجازة الرجاء التحقق من المعلومات المعطاة',
          state: ContentType.warning,
        );
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
    }
    }
    catch(e){
      final snackBar = MySnackBar(
        title: 'يوجد مشكلة',
        msg:
            'يوجد مشكلة في هذه اللحظة الرجاء اعادة المحاولة بعد قليل',
        state: ContentType.failure,
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  notify(){
    notifyListeners();
  }
}
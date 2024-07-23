import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_ftwkf_ranking/models/certificate.dart';
import 'package:mobile_ftwkf_ranking/network/apis.dart';
import 'package:mobile_ftwkf_ranking/network/certificate_network.dart';
import 'package:mobile_ftwkf_ranking/widgets/certificate/certificate_widget.dart';

class CertificateProvider extends ChangeNotifier{
  bool isLoading=false;
  List<Widget> myItems=[];
    final ImagePicker _picker = ImagePicker();
Apis apis=Apis();
  List<bool> isHovered=[false];
  Certificate createdCertificate=Certificate();
   DateTime selectedDate=DateTime.now();
  late Certificate selectedCertificate;
    CertificateNetwork certificateNetwork=CertificateNetwork();
  List<Certificate> certificates=[];
  getUserCertificates(int id) async {
    certificates.clear();
    isLoading=true;
    Response res = await certificateNetwork.getCertificateByUser(id);
    if (res.statusCode == 200) {
      for( int i=0;i<res.data.length;i++){
        certificates.add(Certificate.fromJson(res.data[i]));
      }
      print(certificates);
      
    } else {}
    isLoading=false;
    notify();
  }

getCertificateImagePath(String? toFillImage) {
    return "profile/certificate/";
  }

  pickCertificateImage(bool fromGallery, context, String? toFillImage) async {
    final XFile? image;
    if (fromGallery) {
      image = await _picker.pickImage(source: ImageSource.gallery);
    } else {
      image = await _picker.pickImage(source: ImageSource.camera);
    }
    String path = getCertificateImagePath(toFillImage);

    uploadCertificateImage(image!, path, 6, toFillImage,context);
    Navigator.pop(context);
    // Response res=await licenceNetwork.uploadImage();
  }

  setCertificateImagePath(String? toFillImage, String url) {
    // if (toFillImage == "profilePhoto") {
      createdCertificate!.image =
          apis.baseUrl.substring(0, apis.baseUrl.length - 5) + url;
    // } else if (toFillImage == 'idphoto') {
    //   createdFullLicence!.athlete!.identityPhoto =
    //       apis.baseUrl.substring(0, apis.baseUrl.length - 5) + url;
    // } else if (toFillImage == "photo") {
    //   createdFullLicence!.athlete!.photo =
    //       apis.baseUrl.substring(0, apis.baseUrl.length - 5) + url;
    // } else if (toFillImage == "medphoto") {
    //   createdFullLicence!.athlete!.medicalPhoto =
    //       apis.baseUrl.substring(0, apis.baseUrl.length - 5) + url;
    // }
  }


   uploadCertificateImage(
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
    Response res = await certificateNetwork.uploadImage(formData);
    if (res.statusCode == 200) {
      if (res.data != null) {
        setCertificateImagePath(toFillImage, res.data['url']);
        myItems.clear();
        myItems = [
          CertificateImageUploadWidget('صورة الحساب', this, context, 'profilePhoto',
              createdCertificate.image, 0),
          // ArbitreImageUploadWidget('صورة الهوية', this, context, 'idphoto',
          //     createdFullLicence!.arbitrator!.identityPhoto, 1),
          // ArbitreImageUploadWidget('صورة التامين', this, context, 'photo',
          //     createdFullLicence!.arbitrator!.photo, 2),
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
    Response res = await certificateNetwork.uploadImage(formData);
    if (res.statusCode == 200) {
      if (res.data != null) {
        setCertificateImagePath(toFillImage, res.data['url']);
        //toFillImage=res.data['url'];

        notify();
      }
    }
  }


  addCertificate(name,description,user) async {
     createdCertificate.name= name;
     createdCertificate.description= description;
     createdCertificate.points=0;
     createdCertificate.accepted=false;
     createdCertificate.date= selectedDate.year.toString()+"-"+selectedDate.month.toString()+"-"+selectedDate.day.toString();
     createdCertificate.user= user;
    print(createdCertificate.toJson());
    Response res=await certificateNetwork.addCertificate(createdCertificate.toJson());
    if(res.statusCode==201){
      print('added');
      certificates.add(Certificate.fromJson(res.data));
      notify();
    }
  }

  notify(){
    notifyListeners();
  }



}
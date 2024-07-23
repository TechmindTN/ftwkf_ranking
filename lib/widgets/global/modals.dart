// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mobile_ftwkf_ranking/controllers/certificate_controller.dart';
import 'package:mobile_ftwkf_ranking/controllers/licence_controller.dart';
import 'package:sizer/sizer.dart';

AthleteMediaModal(LicenceProvider licenceController,context,String? toFillImage){
  return Column(
    children: [
      InkWell(
        onTap: (() {
          
          licenceController.pickAthleteImage(true,context,toFillImage);
        }),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Icon(Icons.photo),
              SizedBox(width: 5.w,),
              const Text('فتح البوم الصور')
            ],
          ),
          
        ),
      ),
      InkWell(
        onTap: (() {
          
          licenceController.pickAthleteImage(false,context,toFillImage);
        }),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Icon(Icons.camera_alt),
              SizedBox(width: 5.w,),
              const Text('فتح آلة التصوير'),
            ],
          ),
          
        ),
      ),

    ],
  );
}


CertificateMediaModal(CertificateProvider certificateController,context,String? toFillImage){
  return Column(
    children: [
      InkWell(
        onTap: (() {
          
          certificateController.pickCertificateImage(true,context,toFillImage);
        }),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Icon(Icons.photo),
              SizedBox(width: 5.w,),
              const Text('فتح البوم الصور')
            ],
          ),
          
        ),
      ),
      InkWell(
        onTap: (() {
          
          certificateController.pickCertificateImage(false,context,toFillImage);
        }),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Icon(Icons.camera_alt),
              SizedBox(width: 5.w,),
              const Text('فتح آلة التصوير'),
            ],
          ),
          
        ),
      ),

    ],
  );
}

CoachMediaModal(LicenceProvider licenceController,context,String? toFillImage){
  return Column(
    children: [
      InkWell(
        onTap: (() async {
          await licenceController.pickCoachImage(true,context,toFillImage);
        }),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Icon(Icons.photo),
              SizedBox(width: 5.w,),
              const Text('فتح البوم الصور')
            ],
          ),
          
        ),
      ),
      InkWell(
        onTap: (() {
          licenceController.pickCoachImage(false,context,toFillImage);
        }),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Icon(Icons.camera_alt),
              SizedBox(width: 5.w,),
              const Text('فتح آلة التصوير'),
            ],
          ),
          
        ),
      ),

    ],
  );
}

ArbitreMediaModal(LicenceProvider licenceController,context,String? toFillImage){
  return Column(
    children: [
      InkWell(
        onTap: (() async {
          await licenceController.pickArbitreImage(true,context,toFillImage);
        }),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Icon(Icons.photo),
              SizedBox(width: 5.w,),
              const Text('فتح البوم الصور')
            ],
          ),
          
        ),
      ),
      InkWell(
        onTap: (() {
          licenceController.pickArbitreImage(false,context,toFillImage);
        }),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Icon(Icons.camera_alt),
              SizedBox(width: 5.w,),
              const Text('فتح آلة التصوير'),
            ],
          ),
          
        ),
      ),

    ],
  );
}

EditMediaModal(LicenceProvider licenceController,context,String? imageName,img){
  return Column(
    children: [
      InkWell(
        onTap: (() {
          
          licenceController.pickAthleteImage(true,context,imageName);
        }),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Icon(Icons.photo),
              SizedBox(width: 5.w,),
              const Text('فتح البوم الصور')
            ],
          ),
          
        ),
      ),
      InkWell(
        onTap: (() {
          
          licenceController.pickAthleteImage(false,context,imageName);
        }),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Icon(Icons.camera_alt),
              SizedBox(width: 5.w,),
              const Text('فتح آلة التصوير'),
            ],
          ),
          
        ),
      ),

    ],
  );
}
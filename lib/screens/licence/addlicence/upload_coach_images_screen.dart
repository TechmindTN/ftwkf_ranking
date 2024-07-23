import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:mobile_ftwkf_ranking/controllers/licence_controller.dart';
import 'package:mobile_ftwkf_ranking/widgets/global/snackbars.dart';
import 'package:mobile_ftwkf_ranking/widgets/licence/licence_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../router/routes.dart';

class UploadCoachLicenceImages extends StatefulWidget{
  const UploadCoachLicenceImages({super.key});

  @override
  State<UploadCoachLicenceImages> createState() => _UploadCoachLicenceImagesState();
}

class _UploadCoachLicenceImagesState extends State<UploadCoachLicenceImages> {
  late LicenceProvider licenceController;
  @override
  void initState() {
    licenceController=Provider.of<LicenceProvider>(context,listen: false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<LicenceProvider>(
      builder: (context,licenceController,child) {
        return Directionality(
                textDirection: TextDirection.rtl,

          child: Scaffold(
            appBar: AppBar(title: const Text('صور المدرب'),),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    CoachImageUploadWidget('صورة الحساب',licenceController,context,'profilePhoto',licenceController.createdFullLicence!.profile!.profilePhoto,0),
                    CoachImageUploadWidget('صورة الهوية',licenceController,context,'idphoto',licenceController.createdFullLicence!.coach!.identityPhoto,1),
                    CoachImageUploadWidget('ملتقى المدربين',licenceController,context,'photo',licenceController.createdFullLicence!.coach!.photo,2),
                    CoachImageUploadWidget('photo de degree',licenceController,context,'degreephoto',licenceController.createdFullLicence!.coach!.degreePhoto,3),
                    CoachImageUploadWidget('photo de grade',licenceController,context,'gradephoto',licenceController.createdFullLicence!.coach!.gradePhoto,4),
        
                    SizedBox(height: 5.h,)
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomAppBar(child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 30.w,
                    child: FloatingActionButton.extended(onPressed: (){
                      // licenceController.createProfile();
                      if((licenceController.createdFullLicence!.profile!.profilePhoto==null)||(licenceController.createdFullLicence!.coach!.identityPhoto==null)||(licenceController.createdFullLicence!.coach!.photo==null)||(licenceController.createdFullLicence!.coach!.degreePhoto==null)||(licenceController.createdFullLicence!.coach!.gradePhoto==null)){
                        final snackBar=MySnackBar(title: "صور ناقصة",msg: "الرجاء اضافة كل الصور المطلوبة",state: ContentType.warning);
                        ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(snackBar);
                      }
                      else{
                        GoRouter.of(context).push(Routes.AddProfileScreen);
                      }
                      
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProfileScreen()));
                    },label: const Text("تأكيد"),)),
                ],
              ),
            )),
        
          ),
        );
      }
    );

  }
}
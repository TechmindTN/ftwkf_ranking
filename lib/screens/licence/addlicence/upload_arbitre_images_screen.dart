import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:mobile_ftwkf_ranking/controllers/licence_controller.dart';
import 'package:mobile_ftwkf_ranking/widgets/global/snackbars.dart';
import 'package:mobile_ftwkf_ranking/widgets/licence/licence_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../router/routes.dart';

class UploadArbitreLicenceImages extends StatefulWidget{
  const UploadArbitreLicenceImages({super.key});

  @override
  State<UploadArbitreLicenceImages> createState() => _UploadArbitreLicenceImagesState();
}

class _UploadArbitreLicenceImagesState extends State<UploadArbitreLicenceImages> {
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
            appBar: AppBar(title: const Text('صور الحكم'),),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    ArbitreImageUploadWidget('صورة الحساب',licenceController,context,'profilePhoto',licenceController.createdFullLicence!.profile!.profilePhoto,0),
                    ArbitreImageUploadWidget('صورة الهوية',licenceController,context,'idphoto',licenceController.createdFullLicence!.arbitrator!.identityPhoto,1),
                    ArbitreImageUploadWidget('photo',licenceController,context,'photo',licenceController.createdFullLicence!.arbitrator!.photo,2),
                    // CoachImageUploadWidget('photo',licenceController,context,'degreephoto',licenceController.createdFullLicence!.coach!.degreePhoto),
                    // CoachImageUploadWidget('photo',licenceController,context,'gradephoto',licenceController.createdFullLicence!.coach!.gradePhoto),
        
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
                      if((licenceController.createdFullLicence!.profile!.profilePhoto==null)||(licenceController.createdFullLicence!.arbitrator!.identityPhoto==null)||(licenceController.createdFullLicence!.arbitrator!.photo==null)){
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
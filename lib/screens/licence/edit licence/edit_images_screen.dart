import 'package:flutter/material.dart';
import 'package:mobile_ftwkf_ranking/controllers/licence_controller.dart';
import 'package:mobile_ftwkf_ranking/widgets/licence/licence_widget.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class EditLicenceImages extends StatefulWidget {
  const EditLicenceImages({super.key});

  @override
  State<EditLicenceImages> createState() => _EditLicenceImagesState();
}

class _EditLicenceImagesState extends State<EditLicenceImages> {
  late LicenceProvider licenceController;
  @override
  void initState() {
    licenceController = Provider.of<LicenceProvider>(context, listen: false);
    // licenceController.initFields();
    licenceController.createdFullLicence =
        licenceController.selectedFullLicence;
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LicenceProvider>(
        builder: (context, licenceController, child) {
      return Directionality(
              textDirection: TextDirection.rtl,

        child: Scaffold(
          appBar: AppBar(title: Text("تعديل الاجازة ${licenceController.selectedFullLicence!.licence!.numLicences!}"),),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  AthleteImageEditWidget(
                      'صورة الحساب',
                      licenceController,
                      context,
                      'profilePhoto',
                      licenceController
                          .createdFullLicence!.profile!.profilePhoto,0),
                  AthleteImageEditWidget(
                    'صورة الهوية',
                    licenceController,
                    context,
                    'idphoto',
                    licenceController.createdFullLicence!.athlete!.identityPhoto,1
                  ),
                  AthleteImageEditWidget(
                      'صورة التأمين',
                      licenceController,
                      context,
                      'photo',
                      licenceController.createdFullLicence!.athlete!.photo,2),
                  AthleteImageEditWidget(
                      'الصورة الطبية',
                      licenceController,
                      context,
                      'medphoto',
                      licenceController
                          .createdFullLicence!.athlete!.medicalPhoto,3),
                  SizedBox(
                    height: 5.h,
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
              child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 30.w,
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        // licenceController.createProfile();
                        licenceController.editAthleteProfile(context);
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProfileScreen()));
                      },
                      label: const Text("تأكيد"),
                    )),
              ],
            ),
          )),
        ),
      );
    });

  }
}

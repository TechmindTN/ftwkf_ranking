import 'package:flutter/material.dart';
import 'package:mobile_ftwkf_ranking/controllers/licence_controller.dart';
import 'package:mobile_ftwkf_ranking/widgets/global/appbar.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../widgets/licence/coach/coach_licence_widgets.dart';



class EditCoachLicenceImages extends StatefulWidget {
  const EditCoachLicenceImages({super.key});

  @override
  State<EditCoachLicenceImages> createState() => _EditCoachLicenceImagesState();
}

class _EditCoachLicenceImagesState extends State<EditCoachLicenceImages> {
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
          // appBar: AppBar(title: Text("تعديل الاجازة "+licenceController.selectedFullLicence!.licence!.numLicences!),),
          body: CustomScrollView(
            slivers:[
              MySliverAppBar("تعديل الاجازة ${licenceController.selectedFullLicence!.licence!.numLicences!}", context, false, licenceController, false,true ),
              
              
              SliverToBoxAdapter(child: SizedBox(height: 6.h,)),
              SliverGrid(
      
                  delegate: SliverChildListDelegate([
                    CoachImageEditWidget(
                      'صورة الحساب',
                      licenceController,
                      context,
                      'profilePhoto',
                      licenceController
                          .createdFullLicence!.profile!.profilePhoto,0),
                  CoachImageEditWidget(
                    'صورة الهوية',
                    licenceController,
                    context,
                    'idphoto',
                    licenceController.createdFullLicence!.coach!.identityPhoto,1
                  ),
                  CoachImageEditWidget(
                      'Photo',
                      licenceController,
                      context,
                      'photo',
                      licenceController.createdFullLicence!.coach!.photo,2),
                      CoachImageEditWidget(
                      'Photo de degree',
                      licenceController,
                      context,
                      'degreephoto',
                      licenceController.createdFullLicence!.coach!.degreePhoto,3),
                      CoachImageEditWidget(
                      'Photo de grade',
                      licenceController,
                      context,
                      'gradephoto',
                      licenceController.createdFullLicence!.coach!.gradePhoto,4),
                  
                  ]),
                                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 0,
                      childAspectRatio: 1.2 ,
                      // mainAxisExtent: ,
                      crossAxisSpacing: 0,
                      crossAxisCount: 1)),
      
      
      
      
              
          
            ] 
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
                        licenceController.editCoachImages(context);
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

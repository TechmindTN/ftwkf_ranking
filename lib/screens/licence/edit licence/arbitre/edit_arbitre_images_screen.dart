import 'package:flutter/material.dart';
import 'package:mobile_ftwkf_ranking/controllers/licence_controller.dart';
import 'package:mobile_ftwkf_ranking/widgets/global/appbar.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'package:mobile_ftwkf_ranking/widgets/licence/arbitre/arbitre_licence_widgets.dart';

class EditArbitratorLicenceImages extends StatefulWidget {
  const EditArbitratorLicenceImages({super.key});

  @override
  State<EditArbitratorLicenceImages> createState() => _EditArbitratorLicenceImagesState();
}

class _EditArbitratorLicenceImagesState extends State<EditArbitratorLicenceImages> {
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
              MySliverAppBar("تعديل الاجازة ${licenceController.selectedFullLicence!.licence!.numLicences!}", context, false, licenceController, false,true),
              
              
              SliverToBoxAdapter(child: SizedBox(height: 6.h,)),
              SliverGrid(
      
                  delegate: SliverChildListDelegate([
                    ArbitreImageEditWidget(
                      'صورة الحساب',
                      licenceController,
                      context,
                      'profilePhoto',
                      licenceController
                          .createdFullLicence!.profile!.profilePhoto,0),
                  ArbitreImageEditWidget(
                    'صورة الهوية',
                    licenceController,
                    context,
                    'idphoto',
                    licenceController.createdFullLicence!.arbitrator!.identityPhoto,1
                  ),
                  ArbitreImageEditWidget(
                      'Photo',
                      licenceController,
                      context,
                      'photo',
                      licenceController.createdFullLicence!.arbitrator!.photo,2),
                  
                  ]),
                                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 0,
                      childAspectRatio: 1.2 ,
                      // mainAxisExtent: ,
                      crossAxisSpacing: 0,
                      crossAxisCount: 1)),
      
      
      
      
              
            //   SliverToBoxAdapter(
            //     child: Center(
            //   child: Column(
            //     children: [
            //       ArbitreImageEditWidget(
            //           'photo',
            //           licenceController,
            //           context,
            //           'profilePhoto',
            //           licenceController
            //               .createdFullLicence!.profile!.profilePhoto),
            //       ArbitreImageEditWidget(
            //         'Identite',
            //         licenceController,
            //         context,
            //         'idphoto',
            //         licenceController.createdFullLicence!.arbitrator!.identityPhoto,
            //       ),
            //       ArbitreImageEditWidget(
            //           'Assurance',
            //           licenceController,
            //           context,
            //           'photo',
            //           licenceController.createdFullLicence!.arbitrator!.photo),
            //       ArbitreImageEditWidget(
            //           'Medicale',
            //           licenceController,
            //           context,
            //           'medphoto',
            //           licenceController
            //               .createdFullLicence!.arbitrator!.medicalPhoto),
            //       SizedBox(
            //         height: 5.h,
            //       )
            //     ],
            //   ),
            // ),
            //   )
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
                        licenceController.editArbitratorImages(context);
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

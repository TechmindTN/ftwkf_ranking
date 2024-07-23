import 'package:flutter/material.dart';
import 'package:mobile_ftwkf_ranking/controllers/licence_controller.dart';
// import 'package:mobile_ftwkf_ranking/screens/licence/renew%20licence/arbitrator/renew_licence_screen.dart';
import 'package:mobile_ftwkf_ranking/widgets/global/appbar.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../router/routes.dart';
import '../../../../widgets/licence/arbitre/arbitre_licence_widgets.dart';

class RenewArbitratorLicenceImages extends StatefulWidget {
  const RenewArbitratorLicenceImages({super.key});

  @override
  State<RenewArbitratorLicenceImages> createState() => _RenewArbitratorLicenceImagesState();
}

class _RenewArbitratorLicenceImagesState extends State<RenewArbitratorLicenceImages> {
  late LicenceProvider licenceController;
  @override
  void initState() {
    licenceController = Provider.of<LicenceProvider>(context, listen: false);
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
          // appBar: AppBar(title: Text('تجديد الاجازة'+licenceController.selectedFullLicence!.licence!.numLicences!),),
          body: CustomScrollView(
            slivers:[
              MySliverAppBar('تجديد الاجازة${licenceController.selectedFullLicence!.licence!.numLicences!}', context, false, licenceController, false,true ),
               
               
              SliverToBoxAdapter(child: SizedBox(height: 6.h,)),
              SliverGrid(
      
                  delegate: SliverChildListDelegate([
                    ArbitreImageEditWidget(
                      'صورة الهوية',
                      licenceController,
                      context,
                      'idphoto',
                      licenceController.createdFullLicence!.arbitrator!.identityPhoto,1
                    ),
                    ArbitreImageEditWidget(
                        'صورة التامين',
                        licenceController,
                        context,
                        'photo',
                        licenceController.createdFullLicence!.arbitrator!.photo,2),
                    // ArbitratorImageEditWidget(
                    //     'Medicale',
                    //     licenceController,
                    //     context,
                    //     'medphoto',
                    //     licenceController
                    //         .createdFullLicence!.arbitrator!.medicalPhoto,3),
                  ]),
                                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 0,
                      childAspectRatio: 1.2 ,
                      // mainAxisExtent: ,
                      crossAxisSpacing: 0,
                      crossAxisCount: 1)),
      
      
              //  SliverToBoxAdapter(
              //    child: Center(
              //              child: Column(
              //     children: [
                    
              //       ArbitratorImageEditWidget(
              //         'Identite',
              //         licenceController,
              //         context,
              //         'idphoto',
              //         licenceController.createdFullLicence!.arbitrator!.identityPhoto,1
              //       ),
              //       ArbitratorImageEditWidget(
              //           'Assurance',
              //           licenceController,
              //           context,
              //           'photo',
              //           licenceController.createdFullLicence!.arbitrator!.photo,2),
              //       ArbitratorImageEditWidget(
              //           'Medicale',
              //           licenceController,
              //           context,
              //           'medphoto',
              //           licenceController
              //               .createdFullLicence!.arbitrator!.medicalPhoto,3),
              //       SizedBox(
              //         height: 5.h,
              //       )
              //     ],
              //              ),
              //            ),
              //  ),
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
                        licenceController.editArbitratorProfile(context);
                        GoRouter.of(context).push(Routes.RenewArbitratorLicenceScreen);
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>RenewLicenceScreen()));
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

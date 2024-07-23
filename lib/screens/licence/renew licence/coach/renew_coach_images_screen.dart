import 'package:flutter/material.dart';
import 'package:mobile_ftwkf_ranking/controllers/licence_controller.dart';
import 'package:mobile_ftwkf_ranking/widgets/global/appbar.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../router/routes.dart';
import '../../../../widgets/licence/coach/coach_licence_widgets.dart';

class RenewCoachLicenceImages extends StatefulWidget {
  const RenewCoachLicenceImages({super.key});

  @override
  State<RenewCoachLicenceImages> createState() => _RenewCoachLicenceImagesState();
}

class _RenewCoachLicenceImagesState extends State<RenewCoachLicenceImages> {
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
      return Directionality
      (
              textDirection: TextDirection.rtl,

        child: Scaffold(
          body: CustomScrollView(
            slivers:[
              MySliverAppBar('تجديد الاجازة ${licenceController.selectedFullLicence!.licence!.numLicences!}', context, false, licenceController, false,true ), 
              SliverToBoxAdapter(child: SizedBox(height: 6.h,)),
              SliverGrid(
                  delegate: SliverChildListDelegate([
                    CoachImageEditWidget(
                      'صورة الهوية',
                      licenceController,
                      context,
                      'idphoto',
                      licenceController.createdFullLicence!.coach!.identityPhoto,1
                    ),
                    CoachImageEditWidget(
                        'صورة التامين',
                        licenceController,
                        context,
                        'photo',
                        licenceController.createdFullLicence!.coach!.photo,2),
                        CoachImageEditWidget(
                        'Photo de degree',
                        licenceController,
                        context,
                        'degreePhoto',
                        licenceController.createdFullLicence!.coach!.degreePhoto,3),
                        CoachImageEditWidget(
                        'Photo de grade',
                        licenceController,
                        context,
                        'gradePhoto',
                        licenceController.createdFullLicence!.coach!.gradePhoto,4),
                  ]),
                                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 0,
                      childAspectRatio: 1.2 ,
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
                        licenceController.editCoachProfile(context);
                        GoRouter.of(context).push(Routes.RenewCoachLicenceScreen);
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

import 'package:flutter/material.dart';
import 'package:mobile_ftwkf_ranking/controllers/licence_controller.dart';
import 'package:mobile_ftwkf_ranking/widgets/global/appbar.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../global/utils.dart';
import '../../../../widgets/global/inputs.dart';

// import '../../global/utils.dart';

class RenewLicenceScreen extends StatefulWidget {
  const RenewLicenceScreen({super.key});

  @override
  State<RenewLicenceScreen> createState() => _RenewLicenceScreenState();
}

class _RenewLicenceScreenState extends State<RenewLicenceScreen> {
  late LicenceProvider licenceController;

  @override
  void initState() {
    licenceController = Provider.of<LicenceProvider>(context, listen: false);
    licenceController.initFields();

    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LicenceProvider>(
        builder: (context, licenceController, child) {
      return Directionality(
              textDirection: TextDirection.rtl,

        child: Scaffold(
          backgroundColor: const Color(0xfffafafa),
          // appBar: AppBar(title: Text('تجديد الاجازة '+licenceController.createdFullLicence!.licence!.numLicences.toString()),
      
          // ),
          body: CustomScrollView(slivers: [
            MySliverAppBar('تجديد الاجازة ${licenceController.createdFullLicence!.licence!.numLicences}', context, false, licenceController, false,true ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  // SizedBox(
                  //   height: 5.h,
                  // ),
                  // Center(
                  //     child: Text('معلومات الحساب'
                  //         // +licenceController.selectedFullLicence!.athlete!.id.toString()
                  //         )),
                  Container(
                    // man2Fct (1:93)
                    margin: const EdgeInsets.fromLTRB(0, 20, 1, 19),
                    width: 121,
                    height: 121,
                    child: (licenceController
                                    .createdFullLicence!.profile!.profilePhoto !=
                                null &&
                            licenceController
                                    .createdFullLicence!.profile!.profilePhoto !=
                                "")
                        ? InkWell(
                          onTap: () {
                            showDialog(context: context, builder: (context){
                              return Dialog(
                                child: Image.network(licenceController
                              .createdFullLicence!.profile!.profilePhoto!),
                              );
                            });
                          },
                          child: Image.network(licenceController
                              .createdFullLicence!.profile!.profilePhoto!),
                        )
                        : Image.asset(
                            'assets/icons/man.png',
                            fit: BoxFit.cover,
                          ),
                  ),
                  Container(
                    // mohsenbenmohsenbAx (1:94)
                    margin: const EdgeInsets.fromLTRB(9, 0, 0, 22),
                    child: Text(
                      '${licenceController.createdFullLicence!.profile!.lastName} ${licenceController.createdFullLicence!.profile!.firstName}',
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        height: 1.2125,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
                  // Text('معلومات الاجازة'),
                  SizedBox(
                    height: 1.h,
                  ),
                  GategorySelectInput('العمر',
                      licenceController.selectedCategory, licenceController),
                  // GradeSelectInput(
                  //     'Grade', licenceController.selectedGrade, licenceController),
                  // DegreeSelectInput('Degree', licenceController.selectedDegree,
                  //     licenceController),
                  DisciplineSelectInput('الرياضة',
                      licenceController.selectedDiscipline, licenceController),
                  // WeightSelectInput(
                  //     'الوزن', licenceController.selectedWeight, licenceController),
                  ClubSelectInput(
                      'النادي', licenceController.selectedClub, licenceController),
                  SizedBox(
                    height: 3.h,
                  ),
                  
                ],
              ),
            )
          ]),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton.extended(onPressed: (){
                    licenceController.renewLicecne(context);
                  }, label: const Text('تاكيد'),
                  
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });

  }
}

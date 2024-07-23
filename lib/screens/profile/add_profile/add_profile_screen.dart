import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:mobile_ftwkf_ranking/controllers/licence_controller.dart';
import 'package:mobile_ftwkf_ranking/widgets/global/snackbars.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../router/routes.dart';
import '../../../widgets/global/inputs.dart';

class AddProfileScreen extends StatefulWidget {
  const AddProfileScreen({super.key});

  @override
  State<AddProfileScreen> createState() => _AddProfileScreenState();
}

class _AddProfileScreenState extends State<AddProfileScreen> {
  late LicenceProvider licenceController;
  TextEditingController prenomController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nomController = TextEditingController();
  TextEditingController sexeController = TextEditingController();
  TextEditingController addresseController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController birthController = TextEditingController();
  TextEditingController cinController = TextEditingController();

  @override
  void initState() {
    licenceController = Provider.of<LicenceProvider>(context, listen: false);
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LicenceProvider>(
        builder: (context, licenceController, child) {
      return Directionality(
              textDirection: TextDirection.rtl,

        child: Scaffold(
          appBar: AppBar(
            title: const Text("اضافة معلومات الحساب"),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                TextInput('الاسم*', prenomController),
                TextInput('اللقب*', nomController),
                PhoneInput('رقم الهاتف*', phoneController),
      
                PhoneInput('رقم الهوية', cinController),
                SelectInput('الجنس*', licenceController.selectedSex,
                    licenceController, ['ذكر', 'انثى']),
                    LigueSelectInput("الولاية*",licenceController.selectedLigue,licenceController),
                // SelectInput('الولاية', licenceController.selectedState,
                //     licenceController, [
                //   'اريانة',
                //   'باجة',
                //   'بن عروس',
                //   'بنزرت',
                //   'قابس',
                //   'قفصة',
                //   'جندوبة',
                //   'القيروان',
                //   'القصرين',
                //   'قبلي',
                //   'الكاف',
                //   'المهدية',
                //   'منوبة',
                //   'مدنين',
                //   'المنستير',
                //   'نابل',
                //   'صفاقس',
                //   'سيدي بوزيد',
                //   'سليانة',
                //   'سوسة',
                //   'تطاوين',
                //   'توزر',
                //   'تونس',
                //   'زغوان'
                // ]),
                TextInput('عنوان المنزل', addresseController),
                Dateinput('تاريخ الولادة*', birthController, context,
                    licenceController.selectedBirth, licenceController)
      
                // String? birthday;
              ],
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
                        print(licenceController.selectedRole.id);
                        if (
                          // (addresseController.text == null) ||
                          //   (addresseController.text == "") ||
                          //   (cinController.text == null) ||
                          //   (cinController.text == "") ||
                            
                            (nomController.text == "") ||
                            
                            (prenomController.text == "") ||
                            
                            (phoneController.text == "") ||
                            (licenceController.selectedLigue == null) ||
                            (licenceController.selectedLigue == "") ||
                            (licenceController.selectedLigue == "الولاية*") ||
                            (licenceController.selectedSex == "") ||
                            (licenceController.selectedSex == null) ||
                            (licenceController.selectedSex == "الجنس*")
                             ||
                            //  (birthController.text == null) ||
                            (birthController.text == "")
                            // (licenceController.selectedBirth == null) ||
                            // (licenceController.selectedBirth == "")
                            ) {
      
                          final snackBar = MySnackBar(
                              title: "خانات اجبارية",
                              msg: "الرجاء ملئ جميع الخانات الاجبارية",
                              state: ContentType.warning);
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);
                        } else {
                          if(licenceController.selectedRole.id==2){
                          licenceController.createAthleteProfile(
                              address: addresseController.text,
                              cin: cinController.text,
                              firstName: prenomController.text,
                              lastName: nomController.text,
                              phone: phoneController.text,
                              state: stateController.text);
                          GoRouter.of(context)
                              .push(Routes.AddAthleteLicenceScreen);
                        }
                        else if(licenceController.selectedRole.id==4){
                          licenceController.createCoachProfile(
                              address: addresseController.text,
                              cin: cinController.text,
                              firstName: prenomController.text,
                              lastName: nomController.text,
                              phone: phoneController.text,
                              state: stateController.text);
                          GoRouter.of(context)
                              .push(Routes.AddCoachLicenceScreen);
                        }
                        else if(licenceController.selectedRole.id==1){
                          licenceController.createArbitreProfile(
                              address: addresseController.text,
                              cin: cinController.text,
                              firstName: prenomController.text,
                              lastName: nomController.text,
                              phone: phoneController.text,
                              state: stateController.text);
                          GoRouter.of(context)
                              .push(Routes.AddArbitreLicenceScreen);
                        }
                        }
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>AddAthleteScreen()));
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

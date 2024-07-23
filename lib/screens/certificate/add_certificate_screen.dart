import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:mobile_ftwkf_ranking/controllers/certificate_controller.dart';
import 'package:mobile_ftwkf_ranking/controllers/licence_controller.dart';
import 'package:mobile_ftwkf_ranking/widgets/global/snackbars.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../router/routes.dart';
import '../../../widgets/global/inputs.dart';

class AddCertificateScreen extends StatefulWidget {
  const AddCertificateScreen({super.key});

  @override
  State<AddCertificateScreen> createState() => _AddCertificateScreenState();
}

class _AddCertificateScreenState extends State<AddCertificateScreen> {
  late LicenceProvider licenceController;
  late CertificateProvider certificateController;
  TextEditingController descriptionController = TextEditingController();
  // TextEditingController phoneController = TextEditingController();
  TextEditingController nomController = TextEditingController();
  // TextEditingController sexeController = TextEditingController();
  // TextEditingController addresseController = TextEditingController();
  // TextEditingController stateController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  // TextEditingController cinController = TextEditingController();

  @override
  void initState() {
    licenceController = Provider.of<LicenceProvider>(context, listen: false);
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CertificateProvider>(
        builder: (context, certificateController, child) {
      return Directionality(
              textDirection: TextDirection.rtl,

        child: Scaffold(
          appBar: AppBar(
            title: const Text("اضافة معلومات الشهادة"),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                TextInput('اسم الشهادة*', nomController),
                TextInput('الوصف*', descriptionController),
                Dateinput('تاريخ الشهادة*', dateController, context,
                    certificateController.selectedDate, licenceController)
      
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
                        // print(licenceController.selectedRole.id);
                        if (
                          // (addresseController.text == null) ||
                          //   (addresseController.text == "") ||
                          //   (cinController.text == null) ||
                          //   (cinController.text == "") ||
                            
                            (nomController.text == "") ||
                            
                           
                           
                             
                            //  (birthController.text == null) ||
                            (dateController.text == "")
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
                          certificateController.addCertificate(nomController.text, descriptionController.text,  licenceController.currentUser.id);
                          // if(licenceController.selectedRole.id==2){
                          // certificateController.createCertificate(
                          //     address: addresseController.text,
                          //     cin: cinController.text,
                          //     firstName: prenomController.text,
                          //     lastName: nomController.text,
                          //     phone: phoneController.text,
                          //     state: stateController.text);
                          GoRouter.of(context)
                              .push(Routes.CertificateListScreen);
                        // }
                        // else if(licenceController.selectedRole.id==4){
                        //   licenceController.createCoachProfile(
                        //       address: addresseController.text,
                        //       cin: cinController.text,
                        //       firstName: prenomController.text,
                        //       lastName: nomController.text,
                        //       phone: phoneController.text,
                        //       state: stateController.text);
                        //   GoRouter.of(context)
                        //       .push(Routes.AddCoachLicenceScreen);
                        // }
                        // else if(licenceController.selectedRole.id==1){
                        //   licenceController.createArbitreProfile(
                        //       address: addresseController.text,
                        //       cin: cinController.text,
                        //       firstName: prenomController.text,
                        //       lastName: nomController.text,
                        //       phone: phoneController.text,
                        //       state: stateController.text);
                        //   GoRouter.of(context)
                        //       .push(Routes.AddArbitreLicenceScreen);
                        // }
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

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:mobile_ftwkf_ranking/controllers/licence_controller.dart';
import 'package:mobile_ftwkf_ranking/router/routes.dart';
import 'package:mobile_ftwkf_ranking/widgets/global/snackbars.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/global/inputs.dart';

class AddArbitreScreen extends StatefulWidget {
  const AddArbitreScreen({super.key});

  @override
  State<AddArbitreScreen> createState() => _AddArbitreScreenState();
}

class _AddArbitreScreenState extends State<AddArbitreScreen> {
  // String? categoryId;
  // dynamic? gradeId;
  // dynamic? idDegree;
  // int? discipline;
  // int? profile;
  // dynamic? weights;
  // String? club;
  late LicenceProvider licenceController;

  TextEditingController categoryController = TextEditingController();
  TextEditingController gradeController = TextEditingController();
  TextEditingController degreeController = TextEditingController();
  TextEditingController disciplineController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController clubController = TextEditingController();

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
            title: const Text("اضافة اجازة حكم"),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                // String? categoryId;
                // dynamic? gradeId;
                // dynamic? idDegree;
      
                // int? discipline;
      
                // dynamic? weights;
                // String? club;
                // TextInput('الاسم',categoryController),
                // TextInput('اللقب',gradeController),
                // TextInput('رقم الهاتف',degreeController),
      
                // TextInput('رقم الهوية',disciplineController),
                // GategorySelectInput('الوزن',
                //     licenceController.selectedCategory, licenceController),
                GradeSelectInput('Grade', licenceController.selectedGrade,
                    licenceController),
                // DegreeSelectInput('Degree', licenceController.selectedDegree,
                //     licenceController),
                // DisciplineSelectInput('الرياضة',
                //     licenceController.selectedDiscipline, licenceController),
      
                // WeightSelectInput('الوزن', licenceController.selectedWeight,
                //     licenceController),
                ClubSelectInput(
                    'نادي', licenceController.selectedClub, licenceController),
                // TextInput('عنوان المنزل',prenomController),
                // Dateinput('تاريخ الولادة',birthController,context,licenceController.selectedBirth,licenceController)
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
                        // print(licenceController.selectedCategory!.id);
                        // print(licenceController.selectedGrade!.id);
                        // print(licenceController.selectedDegree!.id);
                        // print(licenceController.selectedDiscipline!.id);

                        if (
                          // (licenceController.selectedCategory == null) ||
                          //   (licenceController.selectedCategory!.id == -1) ||
                          //   (licenceController.selectedClub == null) ||
                          //   (licenceController.selectedClub!.id == -1) ||
                          //   (licenceController.selectedDegree == null) ||
                          //   (licenceController.selectedDegree!.id == -1) ||
                          //   (licenceController.selectedDiscipline == null) ||
                          //   (licenceController.selectedDiscipline!.id == -1) ||
                            (licenceController.selectedGrade == null) ||
                            (licenceController.selectedGrade!.id == -1) 
                            // ||
                            // (licenceController.selectedWeight == null) ||
                            // (licenceController.selectedWeight!.id == -1)
                            ) {
                          final snackBar = MySnackBar(
                              title: "خانات اجبارية",
                              msg: "الرجاء ملئ جميع الخانات الاجبارية",
                              state: ContentType.warning);
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);
                        } else {
                          licenceController.createArbitre(context);
                          // GoRouter.of(context).dispose();
                          GoRouter.of(context).go(Routes.Home);
                        }
      
      // Navigator.of(context, rootNavigator:
      // true).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
      // LicenceListScreen()), (route) => false);                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>AddLicenceScreen()));
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

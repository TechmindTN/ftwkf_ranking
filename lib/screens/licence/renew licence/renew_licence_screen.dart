import 'package:flutter/material.dart';
import 'package:mobile_ftwkf_ranking/controllers/licence_controller.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../global/utils.dart';
import '../../../widgets/global/inputs.dart';

// import '../../global/utils.dart';

class RenewLicenceScreen extends StatefulWidget{
  const RenewLicenceScreen({super.key});

  @override
  State<RenewLicenceScreen> createState() => _RenewLicenceScreenState();
}

class _RenewLicenceScreenState extends State<RenewLicenceScreen> {
  late LicenceProvider licenceController;

  @override
  void initState() {
    
    licenceController=Provider.of<LicenceProvider>(context,listen: false);
    licenceController.initFields();
    
 

    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<LicenceProvider>(
      builder: (context,licenceController,child) {
        return Directionality(
                textDirection: TextDirection.rtl,

          child: Scaffold(
            appBar: AppBar(title: Text('تجديد الاجازة ${licenceController.createdFullLicence!.licence!.numLicences}'),
           
            ),
            body: SingleChildScrollView(child: Column(
        
              children: [
                SizedBox(height: 5.h,),
                const Center(child: Text('معلومات الحساب'
                // +licenceController.selectedFullLicence!.athlete!.id.toString()
                )
                
                ),
                Container(
                // man2Fct (1:93)
                margin: const EdgeInsets.fromLTRB(0, 20, 1, 19),
                width: 121,
                height: 121,
                child: (licenceController.createdFullLicence!.profile!.profilePhoto!=null && licenceController.createdFullLicence!.profile!.profilePhoto!="")?
                Image.network(licenceController.createdFullLicence!.profile!.profilePhoto!)
                :Image.asset(
                  'assets/icons/man.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                // mohsenbenmohsenbAx (1:94)
                margin: const EdgeInsets.fromLTRB(9, 0, 0, 22),
                child: Text(
                                  '${licenceController.createdFullLicence!.profile!.lastName} ${licenceController.createdFullLicence!.profile!.firstName}',
        
                  style: SafeGoogleFont (
                    'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    height: 1.2125,
                    color: const Color(0xff000000),
                  ),
                ),
              ),
              
              
        
        const Text('معلومات الاجازة'),
                SizedBox(height: 3.h,),
                    GategorySelectInput('العمر',licenceController.selectedCategory,licenceController),
                    // GradeSelectInput('Grade',licenceController.selectedGrade,licenceController)	,
                    // DegreeSelectInput('Degree',licenceController.selectedDegree,licenceController),
                    DisciplineSelectInput('الرياضة',licenceController.selectedDiscipline,licenceController)	,
                  
                    // WeightSelectInput('الوزن',licenceController.selectedWeight,licenceController),
                    ClubSelectInput('النادي',licenceController.selectedClub,licenceController),
                                  SizedBox(height: 3.h,),
        
                    FloatingActionButton.extended(onPressed: (){
                      licenceController.renewLicecne(context);
                      // licenceController.editLicenceAthlete(context);
                    }, label: const Text('تأكيد')),
                SizedBox(height: 3.h,),
        
              ],
            )
            ),
            
           
          ),
        );
      }
    );

  }
}
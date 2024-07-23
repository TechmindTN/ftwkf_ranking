import 'package:flutter/material.dart';
import 'package:mobile_ftwkf_ranking/controllers/licence_controller.dart';
import 'package:mobile_ftwkf_ranking/widgets/clubs/club_widgets.dart';
// import 'package:mobile_ftwkf_ranking/widgets/clubs/club_widgets.dart';
// import 'package:mobile_ftwkf_ranking/widgets/clubs/club_widgets.dart';
import 'package:mobile_ftwkf_ranking/widgets/global/appbar.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/licence/licence_widget.dart';

class SelectClubScreen extends StatefulWidget{
  const SelectClubScreen({super.key});


  @override
  State<SelectClubScreen> createState() => _SelectClubScreenState();
}

class _SelectClubScreenState extends State<SelectClubScreen> {
  late LicenceProvider licenceController;
  @override
  void initState() {
    licenceController=Provider.of<LicenceProvider>(context,listen: false);
    // licenceController.getParameters();
    // licenceController.initSelected();
    // licenceController.initCreate();
    // licenceController.initSelected();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<LicenceProvider>(
      builder: (context,licenceController,child) {
        return Directionality(
                  textDirection: TextDirection.rtl,

          child: Scaffold(
            // appBar: AppBar(title: Text("Selectioner le role"),),
            body: CustomScrollView(
              slivers: [
                // MyAppBar("اختيار النادي", context, false, licenceController, false,false,),
                SliverToBoxAdapter(
                  child: SizedBox(height: 2.h),
                ),
                SliverGrid.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
            
              ), itemCount: licenceController.currentUser!.clubs!.length,
               itemBuilder: (context, index) {
                return ClubCard(licenceController.currentUser!.clubs![index], context, licenceController);
              },)
                
              ],
               
            ),
          ),
        );
      }
    );

  }
}
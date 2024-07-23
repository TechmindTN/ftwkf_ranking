import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:mobile_ftwkf_ranking/controllers/licence_controller.dart';
import 'package:mobile_ftwkf_ranking/models/full_licence.dart';
import 'package:mobile_ftwkf_ranking/router/routes.dart';
import 'package:mobile_ftwkf_ranking/widgets/global/appbar.dart';
import 'package:mobile_ftwkf_ranking/widgets/global/snackbars.dart';
import 'package:mobile_ftwkf_ranking/widgets/licence/licence_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class LicenceListScreen extends StatefulWidget{
  const LicenceListScreen({super.key});

  @override
  State<LicenceListScreen> createState() => _LicenceListScreenState();
}

class _LicenceListScreenState extends State<LicenceListScreen> {
  late LicenceProvider licenceController;
  TextEditingController numControl=TextEditingController();
  final GlobalKey<ScaffoldState> sKey=GlobalKey();
  @override
  void didChangeDependencies() {
   
    
    super.didChangeDependencies();
  }

  @override
  void initState() {
    licenceController=Provider.of<LicenceProvider>(context,listen: false);
    licenceController.currentPage=0;
    licenceController.getLicences();
    licenceController.getParameters();
    licenceController.initSelected();
    licenceController.initCreate();
    WidgetsBinding.instance.addPostFrameCallback((_) 
      //  Future.delayed(Duration(seconds: 3), () => 
       {
        if(licenceController.added){
      final snackBar=MySnackBar(title: "تمت الاضافة بنجاح",msg: "تمت اضافة الاجازة بنجاح",state: ContentType.success);
      ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(snackBar);
      licenceController.added=false;
    }
       
      //  );
    });
    
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  if(licenceController.added){
    //   final snackBar=MySnackBar(title: "Ajout de licence succees",msg: "La licence a ete ajoutee avec succees",state: ContentType.success);
    //   ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(snackBar);
    //   licenceController.added=false;
    // }
    return Consumer<LicenceProvider>(
      builder: (context,licenceController,child) {
        return Directionality(
                textDirection: TextDirection.rtl,

          child: Scaffold(
            key: sKey,
            drawer: MyDrawer(licenceController, context),
            
            
            backgroundColor: const Color(0xfffafafa),
            appBar: MyAppBar("الاجازات", context, false,licenceController,false,sKey,14,false),
            body: Column(
              // physics: const NeverScrollableScrollPhysics(),
              // controller: ScrollController(),
              // primary: false,
              children: [
                LicenceListHeader(licenceController,numControl,context,""),
                // MyAppBar("الاجازات", context, true,licenceController,false),
                // Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // children: [
                // // SizedBox(height: 2.h),
                // LicenceListHeader(licenceController,numControl,context),
                
                
                
                // ],
                //           ),   
        (licenceController.isLoading)?const Center(child: CircularProgressIndicator(),):NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo){
                    // print(scrollInfo.metrics.pixels);
                    if (scrollInfo.metrics.pixels ==
        scrollInfo.metrics.maxScrollExtent) {
          if(licenceController.lockScroll==false){
            licenceController.getNextLicences();
            licenceController.lockScroll=true;
          }
          

    }
    return true;
                  },
                  child: Container(
                    height: 60.h,
                    child: ListView(
                      primary: true,
                      shrinkWrap: true,
                      // controller: ScrollController(
                        
                      // ),
                      // primary: ,
                      children: [
                        for(FullLicence fullLicence in licenceController.fullLicences)
                        Center(child: LicenceItem(fullLicence,licenceController,context)),
                      ],
                    ),
                  ),
                ),
              SizedBox(height: 3.h)
                ]
              
            ),
            //  floatingActionButton: FloatingActionButton(onPressed: () {
            //   GoRouter.of(context).push(Routes.SelectRoleScreen);
            //   // Navigator.push(context, MaterialPageRoute(builder: ((context) => SelectRoleScreen())));
            // },
            // child: const Icon(Icons.add),
            // ),
            ),
        );
      }
    );

  }
}
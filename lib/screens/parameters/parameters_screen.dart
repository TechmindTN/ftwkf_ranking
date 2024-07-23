import 'package:flutter/material.dart';
import 'package:mobile_ftwkf_ranking/controllers/licence_controller.dart';
import 'package:mobile_ftwkf_ranking/router/routes.dart';
import 'package:mobile_ftwkf_ranking/widgets/global/appbar.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ParametersScreen extends StatefulWidget{
  const ParametersScreen({super.key});

  @override
  State<ParametersScreen> createState() => _ParametersScreenState();
}

class _ParametersScreenState extends State<ParametersScreen> {
  late LicenceProvider licenceController;
  @override
  void initState() {
    licenceController=Provider.of<LicenceProvider>(context,listen: false);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xfffafafa),
      body: CustomScrollView(
        slivers: [
          MySliverAppBar('اعدادات الحساب', context, false,licenceController,false,false),
          SliverToBoxAdapter(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height:5.h),
                  // Container(
                  //   width: 80.w,
                  //   height: 15.h,
                  //   decoration: BoxDecoration(
                  //     color: const Color.fromARGB(255, 66, 144, 208),
                  //     borderRadius: BorderRadius.circular(5),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         offset: Offset(0, 1),
                  //         color: Colors.black12,
                  //         blurRadius: 10,
                  //         spreadRadius: 1
                  //       )
                  //     ]
                  //   ),
                  //   child: Center(
                  //     child: Text(
                  //       "البطولات",
                  //       style: TextStyle(
                  //         fontSize: 20,
                  //         color: Colors.white
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height:2.h),
                  InkWell(
                    onTap: (){
                      GoRouter.of(context).push(Routes.CertificateListScreen);
                    },
                    child: Container(
                      width: 80.w,
                      height: 15.h,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 66, 144, 208),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 1
                          )
                        ]
                      ),
                      child: Center(
                        child: Text(
                          "الشهائد",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height:2.h),
                  InkWell(
                    onTap: (){
                      print(licenceController.currentFullLicence.licence!.role);
                      if(licenceController.currentFullLicence.licence!.role=="رياضي"){
                         GoRouter.of(context).push(Routes.EditAthleteLicenceScreen);
                      }
                      else if(licenceController.currentFullLicence.licence!.role=="مدرب"){
                         GoRouter.of(context).push(Routes.EditCoachLicenceScreen);
                      }
                      else if(licenceController.currentFullLicence.licence!.role=="حكم"){
                         GoRouter.of(context).push(Routes.EditArbitratorLicenceScreen);
                      }
                      // GoRouter.of(context).push(Routes.EditAthleteLicenceScreen);
                    },
                    child: Container(
                      width: 80.w,
                      height: 15.h,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 66, 144, 208),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 1
                          )
                        ]
                      ),
                      child: Center(
                        child: Text(
                          "تعديل الحساب",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }
}
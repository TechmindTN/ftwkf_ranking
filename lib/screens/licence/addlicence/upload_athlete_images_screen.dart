import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobile_ftwkf_ranking/controllers/licence_controller.dart';
import 'package:mobile_ftwkf_ranking/widgets/global/appbar.dart';
import 'package:mobile_ftwkf_ranking/widgets/global/snackbars.dart';
import 'package:mobile_ftwkf_ranking/widgets/licence/licence_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../router/routes.dart';

class UploadAthleteLicenceImages extends StatefulWidget {
  const UploadAthleteLicenceImages({super.key});

  @override
  State<UploadAthleteLicenceImages> createState() =>
      _UploadAthleteLicenceImagesState();
}

class _UploadAthleteLicenceImagesState
    extends State<UploadAthleteLicenceImages> {
  late LicenceProvider licenceController;
  // CarouselController carouselController = CarouselController();
  bool isFirst=true;
  bool isLast=false;
  List<Widget> myItems=[];
  @override
  void initState() {
    licenceController = Provider.of<LicenceProvider>(context, listen: false);
   
    super.initState();
  }

  @override
  void didChangeDependencies() {
    licenceController.myItems= [
                                    AthleteImageUploadWidget(
                                        'صورة الحسابة',
                                        licenceController,
                                        context,
                                        'profilePhoto',
                                        licenceController.createdFullLicence!
                                            .profile!.profilePhoto,0),
                                    AthleteImageUploadWidget(
                                        'صورة الهوية',
                                        licenceController,
                                        context,
                                        'idphoto',
                                        licenceController.createdFullLicence!
                                            .athlete!.identityPhoto,1),
                                    AthleteImageUploadWidget(
                                        'صورة التأمين',
                                        licenceController,
                                        context,
                                        'photo',
                                        licenceController.createdFullLicence!
                                            .athlete!.photo,2),
                                    AthleteImageUploadWidget(
                                        'الصورة الطبية',
                                        licenceController,
                                        context,
                                        'medphoto',
                                        licenceController.createdFullLicence!
                                            .athlete!.medicalPhoto,3),
                                  ];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LicenceProvider>(
        builder: (context, licenceController, child) {
      return Directionality(
              textDirection: TextDirection.rtl,

        child: Scaffold(
          // appBar: AppBar(),
          body: CustomScrollView(
            slivers: [
              MySliverAppBar(
                  "صور الرياضي", context, false, licenceController, false,true),
              SliverToBoxAdapter(
                child: Center(
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         // crossAxisAlignment: CrossAxisAlignment.center,
      
                //         children: [
                //           Visibility(
                //             maintainState: true,
                //             maintainAnimation: true,
                //             maintainSize: true,
                //             visible: !isFirst,
                //             child: IconButton(
                //               icon: Icon(
                //                 Icons.arrow_back_ios,
                //                 size: 50,
                //               ),
                //               onPressed: () {
                                
                //                 carouselController.previousPage();
                //               },
                //             ),
                //           ),
                //           Column(
                //             children: [
                //               SizedBox(
                //                 height: 12.h,
                //               ),
                //               Container(
                //                   width: 70.w,
                //                   child: CarouselSlider(
      
                //                     carouselController: carouselController,
                //                     options: CarouselOptions(
                                      
                //                       enableInfiniteScroll: false,
                //                         height: 60.h,
                //                         viewportFraction: 1,
                                        
                //                         onPageChanged: (index, reason) {
                //                           if(index>0){
                //                             isFirst=false;
                //                             if(index==licenceController.myItems.length-1){
                //                               isLast=true;
                //                             }
                //                             else{
                //                               isLast=false;
                //                             }
                                            
                //                           }
                                          
                //                           else{
                //                             isFirst=true;
                //                           }
                //                           licenceController.notify();
                //                         },
                //                         enlargeCenterPage: true),
                                        
                //                     items: licenceController.myItems
                //                     // .map((i) {
                //                     //   return Builder(
                //                     //     builder: (BuildContext context) {
                //                     //       return i;
                //                     //       // return Container(
                //                     //       //     width: MediaQuery.of(context).size.width,
                //                     //       //     margin: EdgeInsets.symmetric(horizontal: 5.0),
                //                     //       //     decoration: BoxDecoration(color: Colors.amber),
                //                     //       //     child: Text(
                //                     //       //       'text $i',
                //                     //       //       style: TextStyle(fontSize: 16.0),
                //                     //       //     ));
                //                     //     },
                //                     //   );
                //                     // }).toList(),
                //                   )
                                  child: Column(
                                    children: [
                                      AthleteImageUploadWidget('صورة الحساب',licenceController,context,'profilePhoto',licenceController.createdFullLicence!.profile!.profilePhoto,0),
                                      AthleteImageUploadWidget('صورة الهوية',licenceController,context,'idphoto',licenceController.createdFullLicence!.athlete!.identityPhoto,1),
                                      AthleteImageUploadWidget('صورة التأمين',licenceController,context,'photo',licenceController.createdFullLicence!.athlete!.photo,2),
                                      AthleteImageUploadWidget('الصورة الطبية',licenceController,context,'medphoto',licenceController.createdFullLicence!.athlete!.medicalPhoto,3),
                                      SizedBox(height: 5.h,)
                                    ],
                                  ),
                //                   ),
                //             ],
                //           ),
                //           Visibility(
                //             maintainState: true,
                //             maintainAnimation: true,
                //             maintainSize: true,
                //             visible: !isLast,
                //             child: IconButton(
                //               icon: Icon(
                //                 Icons.arrow_forward_ios,
                //                 size: 50,
                //               ),
                //               onPressed: () {
                //                 carouselController.nextPage();
                //               },
                //             ),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                ),
              )
            ],
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
                        if ((licenceController.createdFullLicence!.profile!.profilePhoto == null) ||
                            (licenceController
                                    .createdFullLicence!.athlete!.identityPhoto ==
                                null) ||
                            (licenceController
                                    .createdFullLicence!.athlete!.photo ==
                                null) ||
                            (licenceController
                                    .createdFullLicence!.athlete!.medicalPhoto ==
                                null)) {
                          final snackBar = MySnackBar(
                              title: "صور ناقصة",msg: "الرجاء اضافة كل الصور المطلوبة",
                              state: ContentType.warning);
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);
                        } else {
                          GoRouter.of(context).push(Routes.AddProfileScreen);
                        }
      
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProfileScreen()));
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

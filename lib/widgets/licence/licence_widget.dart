// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mobile_ftwkf_ranking/controllers/licence_controller.dart';
import 'package:mobile_ftwkf_ranking/models/full_licence.dart';
import 'package:mobile_ftwkf_ranking/models/role.dart';
import 'package:mobile_ftwkf_ranking/widgets/global/modals.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../global/utils.dart';
import '../../router/routes.dart';
import '../global/inputs.dart';

Widget LicenceItem(
    FullLicence fullLicence, LicenceProvider licenceController, context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        // autogroupqd1zLpG (F37U4uNLqRBdFGbp4sQD1z)

        // //width: double.infinity,
        //height: double.infinity,
        width: 90.w,
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Color(0x3f000000),
              offset: Offset(0, 2),
              blurRadius: 10,
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            licenceController.selectedFullLicence = fullLicence;
            // Navigator.push(context,
            //     MaterialPageRoute(builder: ((context) => LicenceScreen())));
            GoRouter.of(context).push(Routes.LicenceScreen);
            // Navigator.pushNamed(context, Routes.LicenceScreen);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // autogroupitbe2SC (F37UKZcanBTmfvyEYdiTBE)
                  margin: const EdgeInsets.fromLTRB(6, 0, 0, 2),
                  //width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // licencenum16358749xKr (1:62)
                        margin: const EdgeInsets.fromLTRB(27, 0, 0, 0),
                        child: Text(
                          'اجازة رقم :${fullLicence.licence!.numLicences!}',
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            height: 1.2125,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                      Text(
                        // valideTXW (1:64)
                        "الرتبة "+fullLicence.licence!.rank.toString()!,
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          height: 1.2125,
                          color: (fullLicence.licence!.state.toString() ==
                                  "نشطة")
                              ? const Color(0xff02ce16)
                              : (fullLicence.licence!.state.toString() ==
                                      "في الانتظار")
                                  ? const Color(0xfff5700a)
                                  : const Color(0xfffc0303),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // autogroupubylbtc (F37UQoxqf6Dn3wXHhuubYL)
                  margin: const EdgeInsets.fromLTRB(110, 0, 0, 3),
                  //width: double.infinity,
                  height: 18.h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // man2L5W (2:231)
                        margin: const EdgeInsets.fromLTRB(0, 2, 2, 0),
                        width: 65,
                        height: 65,
                        child: (fullLicence.profile!.profilePhoto != null &&
                                fullLicence.profile!.profilePhoto != "")
                            ? Image.network(fullLicence.profile!.profilePhoto!)
                            : Image.asset(
                                'assets/icons/man.png',
                                fit: BoxFit.cover,
                              ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // athletecYp (1:65)
                            margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Text(
                              fullLicence.profile!.firstName!+" "+fullLicence.profile!.lastName!,
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                height: 1.2125,
                                color: const Color(0xff717171),
                              ),
                            ),
                          ),
                          Container(
                            // athletecYp (1:65)
                            margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Text(
                              fullLicence.licence!.role!,
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                height: 1.2125,
                                color: const Color(0xff717171),
                              ),
                            ),
                          ),
                          if(fullLicence.licence!.role!="حكم")
                          Container(
                            // mohsenclub8XA (1:63)
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                            child: Text(
                              fullLicence.licence!.club.toString(),
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                height: 1.2125,
                                color: const Color(0xff717171),
                              ),
                            ),
                          ),
                          if(fullLicence.licence!.role=="رياضي")
                          Text(
                            // akaberTZS (2:232)
                            fullLicence.licence!.categorie.toString(),
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              height: 1.2125,
                              color: const Color(0xff717171),
                            ),
                          ),
                          Text(
                            fullLicence.licence!.ligue.toString(),
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              height: 1.2125,
                              color: const Color(0xff717171),
                            ),
                          ),
                          Text(
                            "النقاط: "+fullLicence.licence!.points.toString(),
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              height: 1.2125,
                              color: const Color(0xff717171),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Container(
                //   // benarouscBS (2:233)
                //   margin: EdgeInsets.fromLTRB(0, 0, 68, 5),
                //   child: Text(
                //     'بن عروس',
                //     style: SafeGoogleFont (
                //       'Inter',
                //       fontSize: 18,
                //       fontWeight: FontWeight.w400,
                //       height: 1.2125,
                //       color: Color(0xff717171),
                //     ),
                //   ),
                // ),
                // Container(
                //   // 8Qg (2:234)
                //   margin: EdgeInsets.fromLTRB(0, 0, 58, 0),
                //   child: Text(
                //     '2022-2023',
                //     style: SafeGoogleFont (
                //       'Inter',
                //       fontSize: 18,
                //       fontWeight: FontWeight.w400,
                //       height: 1.2125,
                //       color: Color(0xff717171),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget LicenceRow(String key, dynamic value) {
  return Container(
    // autogroup88fjWYp (F37ZNvBnENG3MzFKy188fJ)
    margin: const EdgeInsets.fromLTRB(51, 0, 36, 24),
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          key,
          style: SafeGoogleFont(
            'Inter',
            fontSize: 18,
            fontWeight: FontWeight.w400,
            height: 1.2125,
            color: const Color(0xff717171),
          ),
        ),
        Text(
          // MZS (1:96)
          value.toString(),
          style: SafeGoogleFont(
            'Inter',
            fontSize: 18,
            fontWeight: FontWeight.w400,
            height: 1.2125,
            color: (value=="في الانتظار")?Colors.orange:(value=="مقبولة")?Colors.green:(value=="منتهية")?Colors.red:Color(0xff717171),
          ),
        ),
      ],
    ),
  );
}

Widget RolePhotos(FullLicence fullLicence,context,LicenceProvider licenceController) {
  if (fullLicence.licence!.role == "رياضي") {
    return AthletePhotosWidget(fullLicence,licenceController,context);
  } else if (fullLicence.licence!.role == "حكم") {
    return ArbitratorPhotosWidget(fullLicence,licenceController,context);
  } else if (fullLicence.licence!.role == "مدرب") {
    return CoachPhotosWidget(fullLicence,licenceController,context);
  } else {
    return const SizedBox();
  }
}

Widget ArbitratorPhotosWidget(FullLicence fullLicence,LicenceProvider licenceController,context) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    (fullLicence.arbitrator!.identityPhoto != null &&
            fullLicence.arbitrator!.identityPhoto != "")
        ? InkWell(
          onTap: () {
                      licenceController.showImage(context,fullLicence.arbitrator!.identityPhoto);
                    },
          child: Image.network(
              fullLicence.arbitrator!.identityPhoto!,
              width: 40.w,
            ),
        )
        : Image.asset(
            'assets/icons/man.png',
            width: 40.w,
            fit: BoxFit.cover,
          ),
    (fullLicence.arbitrator!.photo != null &&
            fullLicence.arbitrator!.photo != "")
        ? InkWell(
          onTap: () {
                      licenceController.showImage(context,fullLicence.arbitrator!.photo);
                    },
          child: Image.network(
              fullLicence.arbitrator!.photo!,
              width: 40.w,
            ),
        )
        : Image.asset(
            'assets/icons/man.png',
            width: 40.w,
            fit: BoxFit.cover,
          ),
  ]);
}

Widget CoachPhotosWidget(FullLicence fullLicence,LicenceProvider licenceController,context) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    (fullLicence.coach!.identityPhoto != null &&
            fullLicence.coach!.identityPhoto != "")
        ? InkWell(
          onTap: () {
                      licenceController.showImage(context,fullLicence.coach!.identityPhoto);
                    },
          child: Image.network(
              fullLicence.coach!.identityPhoto!,
              width: 20.w,
            ),
        )
        : Image.asset(
            'assets/icons/man.png',
            width: 20.w,
            fit: BoxFit.cover,
          ),
    (fullLicence.coach!.photo != null && fullLicence.coach!.photo != "")
        ? InkWell(
          onTap: () {
                      licenceController.showImage(context,fullLicence.coach!.photo);
                    },
          child: Image.network(
              fullLicence.coach!.photo!,
              width: 20.w,
            ),
        )
        : Image.asset(
            'assets/icons/man.png',
            width: 20.w,
            fit: BoxFit.cover,
          ),
    (fullLicence.coach!.degreePhoto != null &&
            fullLicence.coach!.degreePhoto != "")
        ? InkWell(
          onTap: () {
                      licenceController.showImage(context,fullLicence.coach!.degreePhoto);
                    },
          child: Image.network(
              fullLicence.coach!.degreePhoto!,
              width: 20.w,
            ),
        )
        : Image.asset(
            'assets/icons/man.png',
            width: 20.w,
            fit: BoxFit.cover,
          ),
    (fullLicence.coach!.gradePhoto != null &&
            fullLicence.coach!.gradePhoto != "")
        ? InkWell(
          onTap: () {
                      licenceController.showImage(context,fullLicence.coach!.gradePhoto);
                    },
          child: Image.network(
              fullLicence.coach!.gradePhoto!,
              width: 20.w,
            ),
        )
        : Image.asset(
            'assets/icons/man.png',
            width: 20.w,
            fit: BoxFit.cover,
          ),
  ]);
}

Widget AthletePhotosWidget(FullLicence fullLicence,LicenceProvider licenceController,context) {
  return Container(
    constraints: BoxConstraints(maxWidth: 100.w),
    width: 100.w,
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 18.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                (fullLicence.athlete!.identityPhoto != null &&
                        fullLicence.athlete!.identityPhoto != "")
                    ? InkWell(
                      onTap: () {
                        licenceController.showImage(context,fullLicence.athlete!.identityPhoto);
                      },
                      child: Image.network(
                          fullLicence.athlete!.identityPhoto!,
                          fit: BoxFit.cover,
                          width: 30.w,
                        ),
                    )
                    : Image.asset(
                        'assets/icons/man.png',
                        fit: BoxFit.cover,
                        width: 30.w,
                      ),
                const Center(child: Text('الهوية'))
              ],
            ),
          ),
          SizedBox(
            height: 18.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                (fullLicence.athlete!.photo != null &&
                        fullLicence.athlete!.photo != "")
                    ? InkWell(
                      onTap: () {
                        licenceController.showImage(context,fullLicence.athlete!.photo);
                      },
                      child: Image.network(
                          fullLicence.athlete!.photo!,
                          fit: BoxFit.cover,
                          width: 30.w,
                        ),
                    )
                    : Image.asset(
                        'assets/icons/man.png',
                        fit: BoxFit.cover,
                        width: 30.w,
                      ),
                const Center(child: Text('التامين'))
              ],
            ),
          ),
          SizedBox(
            height: 18.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                (fullLicence.athlete!.medicalPhoto != null &&
                        fullLicence.athlete!.medicalPhoto != "")
                    ? InkWell(
                      onTap: () {
                        licenceController.showImage(context,fullLicence.athlete!.medicalPhoto);
                      },
                      child: Image.network(
                          fullLicence.athlete!.medicalPhoto!,
                          fit: BoxFit.cover,
                          width: 30.w,
                        ),
                    )
                    : Image.asset(
                        'assets/icons/man.png',
                        fit: BoxFit.cover,
                        width: 30.w,
                      ),
                const Center(child: Text('الصورة الطبية'))
              ],
            ),
          ),
        ]),
  );
}

Widget RoleCard(Role role, context,LicenceProvider licenceController) {
  
  // if(licenceController.currentUser.club!.id==null){

  
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: (() {
            licenceController.selectedRole=role;
            if (role.roles == "رياضي") {
              GoRouter.of(context).push(Routes.UploadAthleteImagesScreen);
              // Navigator.push(context,
              //     MaterialPageRoute(builder: ((context) => UploadLicenceImages())));
            }
            else if (role.roles == "مدرب") {
              GoRouter.of(context).push(Routes.UploadCoachImagesScreen);
              // Navigator.push(context,
              //     MaterialPageRoute(builder: ((context) => UploadLicenceImages())));
            }else if (role.roles == "حكم") {
              GoRouter.of(context).push(Routes.UploadArbitreImagesScreen);
              // Navigator.push(context,
              //     MaterialPageRoute(builder: ((context) => UploadLicenceImages())));
            }
          }),
          child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.grey  ),
              width: 35.w,
              height: 18.h,
              child: Center(child: 
              Image.asset("assets/images/logo-ftwkf.png")
              )),
        ),
      ),
      Text(role.roles!,
         style: const TextStyle(
                fontSize: 18
              ),)
    ],
  );
  // }

  //  else{
  //   if(role.roles=="نادي"||role.roles=="manager"){
  //     return const SizedBox();
  //   }
  //   else{
  //      return Padding(
  //   padding: const EdgeInsets.all(8.0),
  //   child: InkWell(
  //     onTap: (() {
  //       licenceController.selectedRole=role;
  //       if (role.roles == "رياضي") {
  //         GoRouter.of(context).push(Routes.UploadAthleteImagesScreen);
  //         // Navigator.push(context,
  //         //     MaterialPageRoute(builder: ((context) => UploadLicenceImages())));
  //       }
  //       else if (role.roles == "مدرب") {
  //         GoRouter.of(context).push(Routes.UploadCoachImagesScreen);
  //         // Navigator.push(context,
  //         //     MaterialPageRoute(builder: ((context) => UploadLicenceImages())));
  //       }else if (role.roles == "حكم") {
  //         GoRouter.of(context).push(Routes.UploadArbitreImagesScreen);
  //         // Navigator.push(context,
  //         //     MaterialPageRoute(builder: ((context) => UploadLicenceImages())));
  //       }
  //     }),
  //     child: Container(
  //         decoration: const BoxDecoration(
  //             borderRadius: BorderRadius.all(Radius.circular(5)),
  //             color: Colors.red),
  //         width: 60.w,
  //         height: 10.h,
  //         child: Center(child: Text(role.roles!))),
  //   ),
  // );
  //   }

  // }
}

Widget AthleteImageUploadWidget(txt, licenceController, context,
    String? toFillImage, String? placeHolderImage,int index) {
    //  bool ishovered=true;
  return Consumer<LicenceProvider>(

    builder: (context,licenceController,child) {
      return Column(

        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onHover: (value) {
                
                if(value){
                  licenceController.isHovered[index]=true;
                  licenceController.notify();
                  
                }
                else{
                  licenceController.isHovered[index]=false;
                  licenceController.notify();
                }
              },
              
              onTap: (() {
                showModalBottomSheet(
              context: context,
              builder: (context) {
                return AthleteMediaModal(licenceController, context, toFillImage);
              });
                // licenceController.pickAthleteImage(true,context,toFillImage);
              }),
              child: Container(
               
                  decoration: BoxDecoration(
                    image: (placeHolderImage != null)
                      ? DecorationImage(image: NetworkImage(placeHolderImage,
                      
                      
                      ),
                      opacity: (licenceController.isHovered[index])?0.3:1,
                      fit: BoxFit.cover
                      ):null,
                    boxShadow: const [
                      BoxShadow(color: Colors.black26),
                      BoxShadow(
                        color: Color(0xffD9D9D9),
                        spreadRadius: -12,
                        blurRadius: 20,

                      )
                    ],
                      borderRadius: const BorderRadius.all(Radius.circular(40)),
                      ),
                  width: 30.w,
                  height: 22.h,
               
                   child: (licenceController.isHovered[index])?
                   Center(
                    child: Icon(Icons.camera_alt,
                    size: 5.w,
                    ),
                   )
                   :const SizedBox(),
                      ),
            ),
          ),
          SizedBox(
            height: 0.5.h,
          ),
          Text(txt,
          style: const TextStyle(
            fontSize: 20
          ),
          ),
          SizedBox(
            height: 1.h,
          ),
        ],
      );
    }
  );
}


Widget CoachImageUploadWidget(txt, licenceController, context,
    String? toFillImage, String? placeHolderImage,int index) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
           onHover: (value) {
                
                if(value){
                  licenceController.isHovered[index]=true;
                  licenceController.notify();
                  
                }
                else{
                  licenceController.isHovered[index]=false;
                  licenceController.notify();
                }
              },
              
              onTap: (() {
                showModalBottomSheet(
              context: context,
              builder: (context) {
                return CoachMediaModal(licenceController, context, toFillImage);
              });
                // licenceController.pickCoachImage(true,context,toFillImage);
              }),
          child: Container(
               decoration: BoxDecoration(
                    image: (placeHolderImage != null)
                      ? DecorationImage(image: NetworkImage(placeHolderImage,
                      
                      
                      ),
                      opacity: (licenceController.isHovered[index])?0.3:1,
                      fit: BoxFit.cover
                      ):null,
                    boxShadow: const [
                      BoxShadow(color: Colors.black26),
                      BoxShadow(
                        color: Color(0xffD9D9D9),
                        spreadRadius: -12,
                        blurRadius: 20,

                      )
                    ],
                      borderRadius: const BorderRadius.all(Radius.circular(40)),
                      ),
                  width: 30.w,
                  height: 22.h,
               
                   child: (licenceController.isHovered[index])?
                   Center(
                    child: Icon(Icons.camera_alt,
                    size: 5.w,
                    ),
                   )
                   :const SizedBox(),),
        ),
      ),
      // Text(placeHolderImage.toString()),
        SizedBox(
            height: 0.5.h,
          ),
          Text(txt,
          style: const TextStyle(
            fontSize: 20
          ),
          ),
      SizedBox(
        height: 1.h,
      ),
      // FloatingActionButton.extended(
      //   onPressed: () {
      //     showModalBottomSheet(
      //         context: context,
      //         builder: (context) {
      //           return CoachMediaModal(licenceController, context, toFillImage);
      //         });
      //   },
      //   label: Text("Select"),
      // )
    ],
  );
}

Widget ArbitreImageUploadWidget(txt,LicenceProvider licenceController, context,
    String? toFillImage, String? placeHolderImage,int index) {
  return Column(
    children: [
      InkWell(
        onTap: () async {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return ArbitreMediaModal(licenceController, context, toFillImage);
              });
        //  await licenceController.pickArbitreImage(true, context, toFillImage);
        },
        onHover: (value) {
                
                if(value){
                  licenceController.isHovered[index]=true;
                  licenceController.notify();
                  
                }
                else{
                  licenceController.isHovered[index]=false;
                  licenceController.notify();
                }
              },
        child: Container(
            decoration: BoxDecoration(
                    image: (placeHolderImage != null)
                      ? DecorationImage(image: NetworkImage(placeHolderImage,
                      
                      
                      ),
                      opacity: (licenceController.isHovered[index])?0.3:1,
                      fit: BoxFit.cover
                      ):null,
                    boxShadow: const [
                      BoxShadow(color: Colors.black26),
                      BoxShadow(
                        color: Color(0xffD9D9D9),
                        spreadRadius: -12,
                        blurRadius: 20,

                      )
                    ],
                      borderRadius: const BorderRadius.all(Radius.circular(40)),
                      // color: Color(0xffD9D9D9)
                      ),
                  width: 30.w,
                  height: 22.h,
             child: (licenceController.isHovered[index])?
                   Center(
                    child: Icon(Icons.camera_alt,
                    size: 5.w,
                    ),
                   )
                   :const SizedBox(),),
      ),
      // Text(placeHolderImage.toString()),
     SizedBox(
            height: 0.5.h,
          ),
          Text(txt,
          style: const TextStyle(
            fontSize: 20
          ),
          ),
          SizedBox(
            height: 1.h,
          ),
      // FloatingActionButton.extended(
      //   onPressed: () {
      //     showModalBottomSheet(
      //         context: context,
      //         builder: (context) {
                // return ArbitreMediaModal(licenceController, context, toFillImage);
      //         });
      //   },
      //   label: Text("Select"),
      // )
    ],
  );
}

Widget AthleteImageEditWidget(
    txt, LicenceProvider licenceController, context, imageName, img,index) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
           onTap: () async {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return AthleteMediaModal(licenceController, context, imageName);
              });
        //  await licenceController.pickAthleteImage(true, context, imageName);
        },
        onHover: (value) {
                
                if(value){
                  licenceController.isHovered[index]=true;
                  licenceController.notify();
                  
                }
                else{
                  licenceController.isHovered[index]=false;
                  licenceController.notify();
                }
              },
          child: Container(
               decoration: BoxDecoration(
                    image: (img != null)
                      ? DecorationImage(image: NetworkImage(img,
                      
                      
                      ),
                      opacity: (licenceController.isHovered[index])?0.3:1,
                      fit: BoxFit.cover
                      ):null,
                    boxShadow: const [
                      BoxShadow(color: Colors.black26),
                      BoxShadow(
                        color: Color(0xffD9D9D9),
                        spreadRadius: -12,
                        blurRadius: 20,

                      )
                    ],
                      borderRadius: const BorderRadius.all(Radius.circular(40)),
                      // color: Color(0xffD9D9D9)
                      ),
                  width: 30.w,
                  height: 22.h,
              child: (licenceController.isHovered[index])?
                   Center(
                    child: Icon(Icons.camera_alt,
                    size: 5.w,
                    ),
                   )
                   :const SizedBox(),),
        ),
      ),
      // Text(placeHolderImage.toString()),
      SizedBox(
            height: 0.5.h,
          ),
          Text(txt,
          style: const TextStyle(
            fontSize: 20
          ),
          ),
          SizedBox(
            height: 1.h,
          ),
      // FloatingActionButton.extended(
      //   onPressed: () {
      //     showModalBottomSheet(
      //         context: context,
      //         builder: (context) {
      //           return EditMediaModal(
      //               licenceController, context, imageName, img);
      //         });
      //   },
      //   label: Text("Select"),
      // )
    ],
  );
}

SearchDialog(LicenceProvider licenceController, numControl, context) {
  return AlertDialog(
    title: const Text('البحث برقم الاجازة'),
    content: SizedBox(
        width: 70.w,
        height: 10.h,
        child: Center(
          child: TextFormField(
            controller: numControl,
          ),
        )),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              licenceController.findLicence(numControl.text, context);
            },
            child: const Center(child: Text('تأكيد')),
          )
        ],
      )
    ],
  );
}

FilterDialog(LicenceProvider licenceController, context) {
  return AlertDialog(
    
    contentPadding: const EdgeInsets.only(left: 4,right: 4,top: 24,bottom: 20),
    insetPadding: const EdgeInsets.symmetric(horizontal: 36,vertical: 24),
    scrollable: true,
    title: const Center(child: Text('التصفية')),
    content: SizedBox(
        width: 100.w,
        // height: 90.h,
        child: Center(
          child: Column(
            
            children: [
              SeasonSelectInput('الموسم',licenceController.selectedSeason,licenceController),
                     RoleSelectInput('النوع',licenceController.filteredRole,licenceController),
                GategorySelectInput('العمر',licenceController.filteredCategory,licenceController),
                    // GradeSelectInput('Grade',licenceController.filteredGrade,licenceController)	,
                    // DegreeSelectInput('Degree',licenceController.filteredDegree,licenceController),
                    DisciplineSelectInput('الرياضة',licenceController.filteredDiscipline,licenceController)	,
                    // WeightSelectInput('الوزن',licenceController.filteredWeight,licenceController),
                    if(licenceController.currentUser.club?.id==null)
                    ClubSelectInput('النادي',licenceController.filteredClub,licenceController),
                    //  SelectInput('الجنس',licenceController.filteredSex,licenceController,['ذكر','انثى']),
                    //  SelectInput('الحالة',licenceController.filteredStatus,licenceController,["نشطة","في الانتظار","منتهية"]),
            ],
          ),

          // child: TextFormField(
          //   controller: numControl,
          // ),
        )),
        actionsPadding: const EdgeInsets.all(0),
    actions: [
      Container(
        color: const Color(0xff4C9AFF),
        width: 100.w,
        height: 8.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                licenceController.filterLicences(context);
                GoRouter.of(context).push(Routes.FilteredLicencesScreen);
                // licenceController.findLicence(numControl.text, context);
              },
              child: const Center(child: Text('تأكيد',
              style: TextStyle(
                color: Colors.white
              ),
              )),
            )
          ],
        ),
      )
    ],
  );
}


Widget LicenceListHeader(LicenceProvider licenceController,numControl,context,role){
  return Center(
    child: SizedBox(
      width: 90.w,
      child: Column(
       children: [
        // SizedBox(height: 5.h,),
        //  FirstRow(licenceController),
         SizedBox(height: 3.h,),
        SearchFilter(licenceController,numControl,context,role),
        SizedBox(height: 2.h,),
        InkWell(onTap: (){
          licenceController.getLicences();
        }, child: Container(
           width: 28.w,
        height: 6.h,
          decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0,2)
            )
          ],
        ),
          child: Center(child: Text("Clear Filters"))))
       ],
      ),
    ),
  );
}

Widget FirstRow(LicenceProvider licenceController){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text("المجموع: ${licenceController.stats.totalLicences}",
     style: const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 20
    ),),
    const Text("تفاصيل التصفية >>",
    style: TextStyle(
      color: Color(0xff2DA9E0),
      fontSize: 20,
      // fontWeight: FontWeight.w600
    ),
    )
  ],);
}

Widget SearchFilter(LicenceProvider licenceController,numControl,context,role){
  return Row(
    children: [
      SearchField(licenceController,numControl,context,role),
      SizedBox(width: 5.w,),
      FilterField(licenceController,context)
    ],
  );
}

Widget SearchField(LicenceProvider licenceController,numControl,context,role){
  return Container(
    width: 68.w,
    height: 8.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      boxShadow: const [
        BoxShadow(
          
          color: Colors.black26,
          blurRadius: 10,
          offset: Offset(0,2)
        )
      ],
      color: Colors.white
    ),
    child: SearchInput(licenceController,numControl,context,role)
  );
}
Widget FilterField(LicenceProvider licenceController,context){
  return InkWell(
    onTap: (){
      licenceController.showFilterDialog(context);
    },
    child: Container(
      width: 17.w,
        height: 8.h,
        color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0,2)
            )
          ],
        ),
    
        // constraints: BoxConstraints(
        //   maxWidth: 8.w
        // ),
        width: 8.w,
        height: 8.h,
        child: Image.asset("assets/icons/filter.png",
        scale: 9,
        width: 12,
        ),
      ),
    ),
  );
  // return Container(
  //   decoration: BoxDecoration(
  //     borderRadius: BorderRadius.circular(6),
  //     color: Colors.white,
  //      boxShadow: [
        
  //       BoxShadow(
  //         color: Colors.black26,
  //         blurRadius: 10,
  //         offset: Offset(0,2)
  //       )
  //     ],
  //   ),
  //   // width: 17.w,
    
  //   height: 8.h,
  //   child: Container(
  //     constraints: BoxConstraints(maxWidth: 8.w,
  //     maxHeight: 2.h
  //     ),
  //     width: 8.w,
  //     height: 2.h,
      
  //     child: Image.asset("assets/icons/filter.png",
  //     fit: BoxFit.cover,
  //     // width: 5.w,
  //     // height: 10,
  //     width: 10,
  //     ),
  //   ),
  // );
}

// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mobile_ftwkf_ranking/widgets/global/buttons.dart';
import 'package:mobile_ftwkf_ranking/widgets/global/inputs.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/club_controller.dart';
import '../../controllers/licence_controller.dart';
import '../../global/utils.dart';
import '../../models/club.dart';
import '../../router/routes.dart';


Widget ClubItem(
    Club club, LicenceProvider licenceController,ClubProvider clubController, context) {
  return Directionality(
            textDirection: TextDirection.rtl,

    child: Center(
      child: Container(
       
        width: 30.w,
        height: 15.h,
        
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
            clubController.selectedClub = club;
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
                        // man2L5W (2:231)
                        margin: const EdgeInsets.fromLTRB(0, 2, 2, 0),
                        // width: 25.w,
                        height: 8.h,
                        child: (club.logo != null &&
                                club.logo != "")
                            ? Image.network(club.logo.toString())
                            : Image.asset(
                                'assets/icons/man.png',
                                fit: BoxFit.cover,
                              ),
                      ),
                      SizedBox(height: 1.h,),
                Container(
                  // height: .h,
                  // autogroupitbe2SC (F37UKZcanBTmfvyEYdiTBE)
                  margin: const EdgeInsets.fromLTRB(2, 0, 0, 6),
                  //width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // licencenum16358749xKr (1:62)
                        margin: const EdgeInsets.fromLTRB(0, 0, 27, 0),
                        child: Text(
                           club.name.toString(),
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            // height: 1.2125,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                ),
                Container(
                  // autogroupubylbtc (F37UQoxqf6Dn3wXHhuubYL)
                  margin: const EdgeInsets.fromLTRB(0, 0, 110, 3),
                  //width: double.infinity,
                  height: 1.h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 28.w,
                            // athletecYp (1:65)
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'الولاية',
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    // height: 1.2125,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                                Text(
                                  club.ligue.toString(),
                                  //fullLicence.licence!.role!,
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    // height: 1.2125,
                                    color: const Color(0xff717171),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        
                          // Container(
                          //   margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
                          //   width: 38.w,
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       Text(
                          //         "Age",
                          //         style: SafeGoogleFont(
                          //           'Inter',
                          //           fontSize: 18,
                          //           fontWeight: FontWeight.w400,
                          //           // height: 1.2125,
                          //           color: Color(0xff000000),
                          //         ),
                          //       ),
                          //       Text(
                          //         // akaberTZS (2:232)
                          //         fullLicence.licence!.categorie.toString(),
                          //         style: SafeGoogleFont(
                          //           'Inter',
                          //           fontSize: 18,
                          //           fontWeight: FontWeight.w400,
                          //           // height: 1.2125,
                          //           color: Color(0xff717171),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // Container(
                          //   margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
                          //   width: 38.w,
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       Text(
                          //         'الولاية',
                          //         style: SafeGoogleFont(
                          //           'Inter',
                          //           fontSize: 18,
                          //           fontWeight: FontWeight.w400,
                          //           // height: 1.2125,
                          //           color: Color(0xff000000),
                          //         ),
                          //       ),
                          //       Text(
                          //         fullLicence.profile!.state.toString(),
                          //         style: SafeGoogleFont(
                          //           'Inter',
                          //           fontSize: 18,
                          //           fontWeight: FontWeight.w400,
                          //           // height: 1.2125,
                          //           color: Color(0xff717171),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // Container(
                          //   margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
                          //   width: 38.w,
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              
                          //     children: [
                          //      Text(
                          //         'الموسم',
                          //         style: SafeGoogleFont(
                          //           'Inter',
                          //           fontSize: 18,
                          //           fontWeight: FontWeight.w400,
                          //           // height: 1.2125,
                          //           color: Color(0xff000000),
                          //         ),
                          //       ),
                                
                          //       Text(
                          //         fullLicence.licence!.seasons.toString()!,
                          //         style: SafeGoogleFont(
                          //           'Inter',
                          //           fontSize: 18,
                          //           fontWeight: FontWeight.w400,
                          //           // height: 1.2125,
                          //           color: Color(0xff717171),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Container(
                //   // benarouscBS (2:233)
                //   margin: EdgeInsets.fromLTRB(0, 0, 68, 5),
                //   child: Text(
                //     'Ben Arous',
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


Widget ClubCard(Club club, context,LicenceProvider licenceController) {
  //print('aaaa');
  // if(licenceController.currentUser.club!.id==null){
    String img="assets/images/logo-ftwkf.png";
    
    
  //  if (role.roles == "رياضي") {
  //             img="assets/icons/running-white.png";
  //           }
  //           else if (role.roles == "مدرب") {
  //             img="assets/icons/coach-white.png";
  //           }else if (role.roles == "حكم") {
  //             img="assets/icons/referee-white.png";
  //           }else if (role.roles == "النادي") {
  //             img="assets/icons/club-white.png";
  //           }
  return Directionality(
            textDirection: TextDirection.rtl,

    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (() {
              licenceController.currentUser.club=club;
    GoRouter.of(context).go(Routes.Home);
              // licenceController.selectedRole=role;
              //print(role.roles);
              //print('aaaa');
              // if (role.roles == "رياضي") {
              //   img="assets/icons/running.png";
              //   GoRouter.of(context).push(Routes.UploadAthleteImagesScreen);
              // }
              // else if (role.roles == "مدرب") {
              //   img="assets/icons/coach.png";
              //   GoRouter.of(context).push(Routes.UploadCoachImagesScreen);
              // }
              //  else if (role.roles == "نادي") {
              //   img="assets/icons/club.png";
              //   GoRouter.of(context).push(Routes.AddProfileScreen);
              // }
              // else if (role.roles == "حكم") {
              //   img="assets/icons/referee.png";
              //   GoRouter.of(context).push(Routes.UploadArbitreImagesScreen);
              // }
            }),
            child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Color(0xff92DDFF,
          )  ),
                width: 20.w,
                height: 12.h,
                child: Center(child: 
                Image.asset(img,
                width: 12.w,
                )
                )),
          ),
        ),
        Text(club.name!,
           style: const TextStyle(
                  fontSize: 18
                ),)
      ],
    ),
  );
  // }
  //  else{
  //   if(role.roles=="النادي"||role.roles=="manager"){
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
  //       }
  //       else if (role.roles == "مدرب") {
  //         GoRouter.of(context).push(Routes.UploadCoachImagesScreen);
  //       }else if (role.roles == "حكم") {
  //         GoRouter.of(context).push(Routes.UploadArbitreImagesScreen);
  //       }
  //       else if (role.roles == "النادي") {
  //         GoRouter.of(context).push(Routes.AddProfileScreen);
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

Widget ClubListHeader(LicenceProvider licenceController,ClubProvider clubController,numControl,context,role){
  return Directionality(
            textDirection: TextDirection.rtl,

    child: Center(
      child: SizedBox(
        width: 183.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
          // SizedBox(height: 5.h,),
          
          SearchFilter(licenceController,numControl,context,role),
          SizedBox(height: 3.h,),
          
           FirstRow(licenceController),
           SizedBox(height: 3.h,),
         ],
        ),
      ),
    ),
  );
}

Widget FirstRow(LicenceProvider licenceController){
  return const Directionality(
            textDirection: TextDirection.rtl,

    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      // Text("Total: "+licenceController.parameters!.clubs!.length.toString(),
      //  style: TextStyle(
      //   fontWeight: FontWeight.w600,
      //   fontSize: 20
      // ),),
      // Text("Details de filtre >>",
      // style: TextStyle(
      //   color: Color(0xff2DA9E0),
      //   fontSize: 20,
      //   // fontWeight: FontWeight.w600
      // ),
      // )
    ],),
  );
}

Widget SearchFilter(LicenceProvider licenceController,numControl,context,role){
  return Directionality(
            textDirection: TextDirection.rtl,

    child: Row(
      children: [
        SearchField(licenceController,numControl,context,role),
        SizedBox(width: 2.w,),
        
        FilterField(licenceController,context),
        SizedBox(width: 2.w,),
        SearchButton(licenceController,numControl,context,role),
        SizedBox(width: 2.w,),
       
      //   Text("Total: "+licenceController.fullLicences.length.toString(),
      //  style: TextStyle(
      //   fontWeight: FontWeight.w600,
      //   fontSize: 20
      // ),),
      ],
    ),
  );
}

Widget SearchField(LicenceProvider licenceController,numControl,context,role){
  return Directionality(
            textDirection: TextDirection.rtl,

    child: Container(
      width: 100.w,
      height: 3.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          (licenceController.isShadow)?const BoxShadow(
            
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0,2)
          ):const BoxShadow()
        ],
        color: Colors.white
      ),
      child: SearchInput(licenceController,numControl,context,role)
    ),
  );
}
Widget FilterField(LicenceProvider licenceController,context){
  return Directionality(
            textDirection: TextDirection.rtl,

    child: InkWell(
      onTap: (){
        // licenceController.showFilterDialog(context);
      },
      child: Container(
        width: 7.w,
          height: 3.h,
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
    ),
  );
}
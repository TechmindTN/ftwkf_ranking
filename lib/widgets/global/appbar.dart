// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mobile_ftwkf_ranking/controllers/licence_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
// import 'package:url_launcher/url_launcher.dart';

import '../../router/routes.dart';

Widget MySliverAppBar(title,context,isDrawer,LicenceProvider licenceController,isActions,isback){
  return SliverAppBar(
    
    actions: (isActions)?[
            PopupMenuButton(
              
              // surfaceTintColor: Colors.white,
              color: Colors.white,
              icon: const Icon(Icons.more_vert,color: Colors.white,),
              itemBuilder: (context){
                    //  if(licenceController.currentUser.club!.id!=null)
                     return [
                            const PopupMenuItem<int>(
                              
                                value: 0,
                                child: Text("تعديل الاجازة"),
                            ),

                            const PopupMenuItem<int>(
                                value: 1,
                                child: Text("تعديل صور الاجازة"),
                            ),

                            // const PopupMenuItem<int>(
                            //     value: 2,
                            //     child: Text("تجديد الاجازة"),
                            // ),
                            
                        ];
                       
                   },
                   onSelected:(value){
                    
                     if(licenceController.selectedFullLicence!.licence!.role=="رياضي"){
                      if(value == 0){
                        GoRouter.of(context).push(Routes.EditAthleteLicenceScreen);
                        // Navigator.push(context, MaterialPageRoute(builder: ((context) => EditLicenceScreen())));
                      }else if(value == 1){
                        GoRouter.of(context).push(Routes.EditAthleteImagesScreen);
                        // Navigator.push(context, MaterialPageRoute(builder: ((context) => EditLicenceImages())));
                      }else if(value == 2){
                        GoRouter.of(context).push(Routes.RenewAthleteImages);
                        // Navigator.push(context, MaterialPageRoute(builder: ((context) => RenewLicenceImages())));
                      }
                   }
                    else if(licenceController.selectedFullLicence!.licence!.role=="حكم"){
                      if(value==0){
                        GoRouter.of(context).push(Routes.EditArbitratorLicenceScreen);
                      }
                      else if(value == 1){
                        GoRouter.of(context).push(Routes.EditArbitratorImagesScreen);
                        // Navigator.push(context, MaterialPageRoute(builder: ((context) => EditLicenceImages())));
                      }
                      else if(value == 2){
                        GoRouter.of(context).push(Routes.RenewArbitratorImagesScreen);
                        // Navigator.push(context, MaterialPageRoute(builder: ((context) => EditLicenceImages())));
                      }
                    }
                    else if(licenceController.selectedFullLicence!.licence!.role=="مدرب"){
                      if(value==0){
                        GoRouter.of(context).push(Routes.EditCoachLicenceScreen);
                      }
                      else if(value == 1){
                        GoRouter.of(context).push(Routes.EditCoachImagesScreen);
                        // Navigator.push(context, MaterialPageRoute(builder: ((context) => EditLicenceImages())));
                      }
                      else if(value == 2){
                        GoRouter.of(context).push(Routes.RenewCoachImagesScreen);
                        // Navigator.push(context, MaterialPageRoute(builder: ((context) => EditLicenceImages())));
                      }
                    }
                   }
                   )
          ]:[],
    surfaceTintColor: Colors.white,
     floating: true,
            snap: true,
            pinned: false,
            foregroundColor: Colors.white,
    // collapsedHeight: 10.h,
    leading: (isback==false)?Visibility(
      visible: isDrawer,
      child: Builder(
        builder: (context) {
          return IconButton(icon:const Icon(Icons.short_text_rounded,color: Colors.white,),
          onPressed: ( ){
            Scaffold.of(context).openDrawer();
          },
          color: Colors.black,
          );
        }
      ),
    ):InkWell(
      onTap: (){
        Navigator.pop(context);
      },
      child: Icon(Icons.arrow_back)),
    centerTitle: true,
    backgroundColor: const Color.fromARGB(255, 66, 144, 208),
    title: Text(title,
    style: const TextStyle(color: Colors.white),
    ),
  );
}


 MyAppBar(title,context,isDrawer,LicenceProvider licenceController,isActions,GlobalKey<ScaffoldState> key,double padding,isback){
  return PreferredSize(preferredSize: Size(100.w,8.h),
  
   child: Container(
    color: const Color.fromARGB(255, 66, 144, 208),
    height: 8.h,
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(

            padding: const EdgeInsets.only(right:8.0,bottom: 8),
            child: (isDrawer)?InkWell(
              onTap: () {
                key.currentState?.openDrawer();
              },
              child: const Icon(Icons.short_text,
              color: Colors.white,
              size: 25,
              
              ),
            ):(isback==true)?InkWell(onTap: (){
              Navigator.pop(context);
            }, child: Icon(Icons.arrow_back)):const SizedBox()
          ),
          Text(title,
      style: const TextStyle(color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: 20
      ),
      ),
      (isActions)?
              PopupMenuButton(
                
                // surfaceTintColor: Colors.white,
                color: Colors.white,
                icon: const Icon(Icons.more_vert,color: Colors.black,),
                itemBuilder: (context){
                      //  if(licenceController.currentUser.club!.id!=null)
                       return [
                              const PopupMenuItem<int>(
                                
                                  value: 0,
                                  child: Text("تعديل الاجازة"),
                              ),
        
                              const PopupMenuItem<int>(
                                  value: 1,
                                  child: Text("تعديل صور الاجازة"),
                              ),
        
                              const PopupMenuItem<int>(
                                  value: 2,
                                  child: Text("تجديد الاجازة"),
                              ),
                              
                          ];
                         
                     },
                     onSelected:(value){
                      
                       if(licenceController.selectedFullLicence!.licence!.role=="رياضي"){
                        if(value == 0){
                          GoRouter.of(context).push(Routes.EditAthleteLicenceScreen);
                          // Navigator.push(context, MaterialPageRoute(builder: ((context) => EditLicenceScreen())));
                        }else if(value == 1){
                          GoRouter.of(context).push(Routes.EditAthleteImagesScreen);
                          // Navigator.push(context, MaterialPageRoute(builder: ((context) => EditLicenceImages())));
                        }else if(value == 2){
                          GoRouter.of(context).push(Routes.RenewAthleteImages);
                          // Navigator.push(context, MaterialPageRoute(builder: ((context) => RenewLicenceImages())));
                        }
                     }
                      else if(licenceController.selectedFullLicence!.licence!.role=="حكم"){
                        if(value==0){
                          GoRouter.of(context).push(Routes.EditArbitratorLicenceScreen);
                        }
                        else if(value == 1){
                          GoRouter.of(context).push(Routes.EditArbitratorImagesScreen);
                          // Navigator.push(context, MaterialPageRoute(builder: ((context) => EditLicenceImages())));
                        }
                        else if(value == 2){
                          GoRouter.of(context).push(Routes.RenewArbitratorImagesScreen);
                          // Navigator.push(context, MaterialPageRoute(builder: ((context) => EditLicenceImages())));
                        }
                      }
                      else if(licenceController.selectedFullLicence!.licence!.role=="مدرب"){
                        if(value==0){
                          GoRouter.of(context).push(Routes.EditCoachLicenceScreen);
                        }
                        else if(value == 1){
                          GoRouter.of(context).push(Routes.EditCoachImagesScreen);
                          // Navigator.push(context, MaterialPageRoute(builder: ((context) => EditLicenceImages())));
                        }
                        else if(value == 2){
                          GoRouter.of(context).push(Routes.RenewCoachImagesScreen);
                          // Navigator.push(context, MaterialPageRoute(builder: ((context) => EditLicenceImages())));
                        }
                      }
                     }
                     )
            :SizedBox(width: padding.w,),
        ],
      ),
    ),
  ),

  );

    
  //   actions: (isActions)?[
  //           PopupMenuButton(
              
  //             // surfaceTintColor: Colors.white,
  //             color: Colors.white,
  //             icon: const Icon(Icons.more_vert,color: Colors.black,),
  //             itemBuilder: (context){
  //                   //  if(licenceController.currentUser.club!.id!=null)
  //                    return [
  //                           const PopupMenuItem<int>(
                              
  //                               value: 0,
  //                               child: Text("تعديل الاجازة"),
  //                           ),

  //                           const PopupMenuItem<int>(
  //                               value: 1,
  //                               child: Text("تعديل صور الاجازة"),
  //                           ),

  //                           const PopupMenuItem<int>(
  //                               value: 2,
  //                               child: Text("تجديد الاجازة"),
  //                           ),
                            
  //                       ];
                       
  //                  },
  //                  onSelected:(value){
                    
  //                    if(licenceController.selectedFullLicence!.licence!.role=="رياضي"){
  //                     if(value == 0){
  //                       GoRouter.of(context).push(Routes.EditAthleteLicenceScreen);
  //                       // Navigator.push(context, MaterialPageRoute(builder: ((context) => EditLicenceScreen())));
  //                     }else if(value == 1){
  //                       GoRouter.of(context).push(Routes.EditAthleteImagesScreen);
  //                       // Navigator.push(context, MaterialPageRoute(builder: ((context) => EditLicenceImages())));
  //                     }else if(value == 2){
  //                       GoRouter.of(context).push(Routes.RenewAthleteImages);
  //                       // Navigator.push(context, MaterialPageRoute(builder: ((context) => RenewLicenceImages())));
  //                     }
  //                  }
  //                   else if(licenceController.selectedFullLicence!.licence!.role=="حكم"){
  //                     if(value==0){
  //                       GoRouter.of(context).push(Routes.EditArbitratorLicenceScreen);
  //                     }
  //                     else if(value == 1){
  //                       GoRouter.of(context).push(Routes.EditArbitratorImagesScreen);
  //                       // Navigator.push(context, MaterialPageRoute(builder: ((context) => EditLicenceImages())));
  //                     }
  //                     else if(value == 2){
  //                       GoRouter.of(context).push(Routes.RenewArbitratorImagesScreen);
  //                       // Navigator.push(context, MaterialPageRoute(builder: ((context) => EditLicenceImages())));
  //                     }
  //                   }
  //                   else if(licenceController.selectedFullLicence!.licence!.role=="مدرب"){
  //                     if(value==0){
  //                       GoRouter.of(context).push(Routes.EditCoachLicenceScreen);
  //                     }
  //                     else if(value == 1){
  //                       GoRouter.of(context).push(Routes.EditCoachImagesScreen);
  //                       // Navigator.push(context, MaterialPageRoute(builder: ((context) => EditLicenceImages())));
  //                     }
  //                     else if(value == 2){
  //                       GoRouter.of(context).push(Routes.RenewCoachImagesScreen);
  //                       // Navigator.push(context, MaterialPageRoute(builder: ((context) => EditLicenceImages())));
  //                     }
  //                   }
  //                  }
  //                  )
  //         ]:[],
  //   surfaceTintColor: Colors.white,
  //    floating: true,
  //           snap: true,
  //           pinned: false,
  //           foregroundColor: Colors.white,
  //   // collapsedHeight: 10.h,
  //   leading: Visibility(
  //     visible: isDrawer,
  //     child: Builder(
  //       builder: (context) {
  //         return IconButton(icon:const Icon(Icons.short_text_rounded),
  //         onPressed: ( ){
  //           Scaffold.of(context).openDrawer();
  //         },
  //         color: Colors.black,
  //         );
  //       }
  //     ),
  //   ),
  //   centerTitle: true,
  //   backgroundColor: Colors.white,
  //   title: Text(title,
  //   style: const TextStyle(color: Colors.black),
  //   ),
  // );
}


Widget MyDrawer(LicenceProvider licenceController,context){
  return Drawer(
    
    width: 60.w,
    backgroundColor: Colors.white,
    child: SingleChildScrollView(
      child: Column(
        children: [
          IdentifierField(licenceController,context),
          DrawerField(Icons.home,"الشاشة الرئيسية",Routes.Home,context),
          DrawerField(Icons.list,"الاجازات",Routes.LicenceListScreen,context),
          UrlDrawerField(Icons.list,"confidentialite",Uri.parse("http://app.ftwkf.org.tn/politique-de-confidentialite/"),context),
          // DrawerField(Icons.list,"Licences"),
          // DrawerField(Icons.list,"Licences"),
          // DrawerField(Icons.list,"Licences"),
          // DrawerField(Icons.list,"Licences"),
          // DrawerField(Icons.list,"Licences"),
          // DrawerField(Icons.list,"Licences"),
          // DrawerField(Icons.list,"Licences"),
          // DrawerField(Icons.list,"Licences"),
          // DrawerField(Icons.list,"Licences"),
          // DrawerField(Icons.list,"Licences"),
          // DrawerField(Icons.list,"Licences"),
          // DrawerField(Icons.list,"Licences"),
        ],
      ),
    ),

  );
}

Widget IdentifierField(LicenceProvider licenceController,context){
  return Container(
    // color: Colors.red,
    decoration: const BoxDecoration(
      border: Border(bottom: BorderSide(
        width: 1,
        color: Colors.black,

      ))
    ),
    height: 20.h,
   child: Center(
     child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 8.w,
                  child: Container(
                    width: 14.w,
                    
                    decoration: BoxDecoration(
                      boxShadow: const [BoxShadow(
   
                        color: Colors.black12,
                        blurRadius: 10,
   
                      )],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Image.asset("assets/images/logo-ftwkf.png"),
                    )),
                ),
                SizedBox(width: 5.w,),
                Text(licenceController.currentUser.username!,
                style: const TextStyle(
                  fontSize: 20
                ),
                )
              ],
            ),
            // SizedBox(),
            
         ]),
         SizedBox(height: 2.h,),
         InkWell(
          onTap: () {
            showDialog(context: context, builder: (context){
              return LogoutDialog(licenceController,context);
            });
            // licenceController.logout(context);
          },
           child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: const Color(0xff2DA9E0),width: 2 )
              // color: Color(0xff92DDFF),
              // color: Colors.red,
            
            ),
            width: 45.w,
            
            height: 6.h,
            child: const Center(child: Text("تسجيل الخروج",
            style: TextStyle(
              color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 18
         
            ),
            ),),
                 ),
         )
       ],
     ),
   ),


  );
}


Widget DrawerField(icon,txt,togo,context,){
   return InkWell(
    onTap: (){
      GoRouter.of(context).go(togo);
    },
     child: Container(
      // color: Colors.red,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(
          width: 1,
          color: Colors.black,
   
        ))
      ),
      height: 10.h,
     child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 12.w,),
        Row(
          children: [
            Icon(icon),
            SizedBox(width: 5.w,),
            Text(txt,
            style: const TextStyle(
              fontSize: 20
            ),
            )
          ],
        ),
        // SizedBox(),
        
     ]),
   
   
     ),
   );
}

Widget UrlDrawerField(icon,txt,Uri togo,context,){
   return InkWell(
    onTap: ()async {
  //      if (!await launchUrl(togo)) {
  //   throw Exception('Could not launch $togo');
  // }
      // GoRouter.of(context).go(togo);
    },
     child: Container(
      // color: Colors.red,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(
          width: 1,
          color: Colors.black,
   
        ))
      ),
      height: 10.h,
     child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 12.w,),
        Row(
          children: [
            Icon(icon),
            SizedBox(width: 5.w,),
            Text(txt,
            style: const TextStyle(
              fontSize: 20
            ),
            )
          ],
        ),
        // SizedBox(),
        
     ]),
   
   
     ),
   );
}


Widget LogoutDialog(LicenceProvider licenceController,context){
  return AlertDialog(
    title: const Text("تسجيل الخروج"),
    content: const Text("هل تود فعلا الخروج؟؟"),
    actions: [
      TextButton(onPressed: (){
        licenceController.logout(context);
      }, child: const Text("تسجيل الخروج",
      style: TextStyle(
        color: Colors.red
      ),
      )),
      TextButton(onPressed: (){}, child: const Text("الغاء"))
    ],
  );
}


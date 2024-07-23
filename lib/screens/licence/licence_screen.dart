import 'package:flutter/material.dart';
import 'package:mobile_ftwkf_ranking/controllers/licence_controller.dart';
import 'package:mobile_ftwkf_ranking/router/routes.dart';
import 'package:mobile_ftwkf_ranking/screens/licence/compare/compare_licence_screen.dart';
import 'package:mobile_ftwkf_ranking/widgets/global/appbar.dart';
import 'package:mobile_ftwkf_ranking/widgets/licence/licence_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../global/utils.dart';

class LicenceScreen extends StatefulWidget{
  const LicenceScreen({super.key});

  @override
  State<LicenceScreen> createState() => _LicenceScreenState();
}

class _LicenceScreenState extends State<LicenceScreen> {
  late LicenceProvider licenceController;
  @override
  void initState() {
    licenceController=Provider.of<LicenceProvider>(context,listen: false);
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<LicenceProvider>(
      builder: (context,licenceController,child) {
        return Directionality(
                textDirection: TextDirection.rtl,

          child: Scaffold(
            // appBar: AppBar(title: Text('الاجازة '+licenceController.selectedFullLicence!.licence!.numLicences.toString()),
            // actions: [
            //   PopupMenuButton(itemBuilder: (context){
            //           //  if(licenceController.currentUser.club!.id!=null)
            //            return [
            //                   PopupMenuItem<int>(
            //                       value: 0,
            //                       child: Text("Modifier"),
            //                   ),
        
            //                   PopupMenuItem<int>(
            //                       value: 1,
            //                       child: Text("Modifier les images"),
            //                   ),
        
            //                   PopupMenuItem<int>(
            //                       value: 2,
            //                       child: Text("Renouvellement"),
            //                   ),
                              
            //               ];
            //               // else{
            //               //   return [
            //               //     PopupMenuItem<int>(
            //               //         value: 0,
            //               //         child: Text("Modifier"),
            //               //     ),
        
            //               //     PopupMenuItem<int>(
            //               //         value: 1,
            //               //         child: Text("Modifier les images"),
            //               //     ),
        
            //               //     PopupMenuItem<int>(
            //               //         value: 2,
            //               //         child: Text("Renouvellement"),
            //               //     ),
            //               //     PopupMenuItem<int>(
            //               //         value: 3,
            //               //         child: Text("Activer"),
            //               //     ),
            //               //     PopupMenuItem<int>(
            //               //         value: 4,
            //               //         child: Text("Refuser"),
            //               //     ),
                              
            //               // ];
            //               // }
            //          },
            //          onSelected:(value){
            //           if(licenceController.selectedFullLicence!.licence!.role=="رياضي")
            //             if(value == 0){
            //               GoRouter.of(context).push(Routes.EditAthleteLicenceScreen);
            //               // Navigator.push(context, MaterialPageRoute(builder: ((context) => EditLicenceScreen())));
            //               //  print("My account menu is selected.");
            //             }else if(value == 1){
            //               GoRouter.of(context).push(Routes.EditAthleteImagesScreen);
            //               // Navigator.push(context, MaterialPageRoute(builder: ((context) => EditLicenceImages())));
            //               //  print("Settings menu is selected.");
            //             }else if(value == 2){
            //               GoRouter.of(context).push(Routes.RenewAthleteImages);
            //               // Navigator.push(context, MaterialPageRoute(builder: ((context) => RenewLicenceImages())));
            //                print("Logout menu is selected.");
            //             }
            //          }
            //          )
            // ],
            // ),
        
        
            body: CustomScrollView(
              slivers: [
                MySliverAppBar('الاجازة ${licenceController.selectedFullLicence!.licence!.numLicences!}', context, false,licenceController,false,true),
                SliverToBoxAdapter(
                  child: Column(
                          
                  children: [
                    Container(
                    // man2Fct (1:93)
                    margin: const EdgeInsets.fromLTRB(0, 20, 1, 19),
                    width: 121,
                    height: 121,
                    child: (licenceController.selectedFullLicence!.profile!.profilePhoto!=null && licenceController.selectedFullLicence!.profile!.profilePhoto!="")?
                    InkWell(
                      onTap: () {
                          licenceController.showImage(context,licenceController.selectedFullLicence!.profile!.profilePhoto);
                        },
                      child: Image.network(licenceController.selectedFullLicence!.profile!.profilePhoto!))
                    :Image.asset(
                      'assets/icons/man.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    // mohsenbenmohsenbAx (1:94)
                    margin: const EdgeInsets.fromLTRB(9, 0, 0, 22),
                    child: Text(
                      '${licenceController.selectedFullLicence!.profile!.lastName} ${licenceController.selectedFullLicence!.profile!.firstName}',
                      style: SafeGoogleFont (
                        'Inter',
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        height: 1.2125,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
                  LicenceRow('الرتبة',licenceController.selectedFullLicence!.licence!.rank),
                    LicenceRow('النقاط',licenceController.selectedFullLicence!.licence!.points),
                    LicenceRow('اللقب',licenceController.selectedFullLicence!.profile!.lastName),
                    LicenceRow('الاسم',licenceController.selectedFullLicence!.profile!.firstName),
                    LicenceRow('الجنس',licenceController.selectedFullLicence!.profile!.sexe),
                          
                    LicenceRow('رقم الهاتف',licenceController.selectedFullLicence!.profile!.phone),
                    LicenceRow('عنوان المنزل',licenceController.selectedFullLicence!.profile!.address),
                    LicenceRow('نوع الاجازة',licenceController.selectedFullLicence!.licence!.role),
                    if(licenceController.selectedFullLicence!.licence!.role=="رياضي")
                    LicenceRow('العمر',licenceController.selectedFullLicence!.licence!.categorie),
                    LicenceRow('رقم الهوية',licenceController.selectedFullLicence!.profile!.cin),
                    LicenceRow('تاريخ الولادة',licenceController.selectedFullLicence!.profile!.birthday.toString()),
                    if(licenceController.selectedFullLicence!.licence!.role!="حكم")
                    LicenceRow('النادي',licenceController.selectedFullLicence!.licence!.club),
                    // LicenceRow('Ligue',licenceController.selectedFullLicence!.licence!.),
                    if(licenceController.selectedFullLicence!.licence!.role!="حكم")
                    LicenceRow('الرياضة',licenceController.selectedFullLicence!.licence!.discipline),
                    // LicenceRow('Nationalite',licenceController.selectedFullLicence!.profile!.),
                    if(licenceController.selectedFullLicence!.licence!.role=="مدرب")
                    LicenceRow('Degree',licenceController.selectedFullLicence!.licence!.degree),
                    if((licenceController.selectedFullLicence!.licence!.role=="مدرب")||(licenceController.selectedFullLicence!.licence!.role=="حكم"))
                    LicenceRow('Grade',licenceController.selectedFullLicence!.licence!.grade),
                    LicenceRow('الموسم',licenceController.selectedFullLicence!.licence!.seasons),
                    
                    LicenceRow('الحالة',licenceController.selectedFullLicence!.licence!.state),
                    RolePhotos(licenceController.selectedFullLicence!,context,licenceController)
                  ],
                            ),
                ),
              ],
               
            ),
           bottomNavigationBar: 
          //  (licenceController.selectedFullLicence!.licence!.state=="في الانتظار"&&licenceController.currentUser.club!.id==null)?
           BottomAppBar(
            color:const Color.fromARGB(255, 66, 144, 208) ,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("الرتبة: "+licenceController.selectedFullLicence!.licence!.rank.toString(), style: SafeGoogleFont(
            'Inter',
            fontSize: 18,
            fontWeight: FontWeight.w400,
            height: 1.2125,
            color: const Color(0xffffffff),
          ),),
                   Text("النقاط: "+licenceController.selectedFullLicence!.licence!.points.toString(), style: SafeGoogleFont(
            'Inter',
            fontSize: 18,
            fontWeight: FontWeight.w400,
            height: 1.2125,
            color: const Color(0xffffffff),
          ),),
                ],
              )
          //     (licenceController.selectedFullLicence!.licence!.role=="رياضي")?Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         ElevatedButton(onPressed: (){
          //           GoRouter.of(context).push(Routes.CompareLicence);
          //          },
          //          style: ButtonStyle(
          //   backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          // ), child: const Text("تحقق"),
          //          )
          //          ],
          //     ):

          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //          ElevatedButton(onPressed: (){
          //           licenceController.validateLicence(context);
          //         },
          //         style: ButtonStyle(
        
          //   backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          // ), child: const Text("قبول"),
          //         ),
          // //          ElevatedButton(onPressed: (){
                    
          // //          },
          // //          style: ButtonStyle(
          // //   backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
          // // ), child: const Text("رفض"),
          // //          )
          //          ],
          //     ),
          //         ElevatedButton(onPressed: (){
          //           licenceController.validateLicence(context);
          //         },
          //         style: ButtonStyle(
        
          //   backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          // ), child: const Text("قبول"),
          //         ),
          //          ElevatedButton(onPressed: (){
                    
          //          },
          //          style: ButtonStyle(
          //   backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
          // ), child: const Text("رفض"),
          //          )
                
            ))
            // :const BottomAppBar(),
           
          ),
        );
      }
    );

  }
}
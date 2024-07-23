import 'package:flutter/material.dart';
import 'package:mobile_ftwkf_ranking/controllers/certificate_controller.dart';
import 'package:mobile_ftwkf_ranking/controllers/licence_controller.dart';
import 'package:mobile_ftwkf_ranking/router/routes.dart';
import 'package:mobile_ftwkf_ranking/screens/licence/compare/compare_licence_screen.dart';
import 'package:mobile_ftwkf_ranking/widgets/certificate/certificate_widget.dart';
import 'package:mobile_ftwkf_ranking/widgets/global/appbar.dart';
import 'package:mobile_ftwkf_ranking/widgets/licence/licence_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../global/utils.dart';

class CertificateScreen extends StatefulWidget{
  const CertificateScreen({super.key});

  @override
  State<CertificateScreen> createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
  late LicenceProvider licenceController;
  @override
  void initState() {
    licenceController=Provider.of<LicenceProvider>(context,listen: false);
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<CertificateProvider>(
      builder: (context,certificateController,child) {
        return Directionality(
                textDirection: TextDirection.rtl,

          child: Scaffold(
            // appBar: AppBar(title: Text('الاجازة '+certificateController.selectedFullLicence!.licence!.numLicences.toString()),
            // actions: [
            //   PopupMenuButton(itemBuilder: (context){
            //           //  if(certificateController.currentUser.club!.id!=null)
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
            //           if(certificateController.selectedFullLicence!.licence!.role=="رياضي")
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
                MySliverAppBar('الشهادة ${certificateController.selectedCertificate.name}', context, false,licenceController,false,true),
                SliverToBoxAdapter(
                  child: Column(
                          
                  children: [
                    Container(
                    // man2Fct (1:93)
                    margin: const EdgeInsets.fromLTRB(0, 20, 1, 19),
                    width: 121,
                    height: 121,
                    child: (certificateController.selectedCertificate!.image!=null && certificateController.selectedCertificate!.image!="")?
                    InkWell(
                      onTap: () {
                          // certificateController.showImage(context,certificateController.selectedCertificate!.image);
                        },
                      child: Image.network(certificateController.selectedCertificate!.image!))
                    :Image.asset(
                      'assets/icons/man.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Container(
                  //   // mohsenbenmohsenbAx (1:94)
                  //   margin: const EdgeInsets.fromLTRB(9, 0, 0, 22),
                  //   child: Text(
                  //     '${certificateController.selectedCertificate!.profile!.lastName} ${certificateController.selectedCertificate!.profile!.firstName}',
                  //     style: SafeGoogleFont (
                  //       'Inter',
                  //       fontSize: 20,
                  //       fontWeight: FontWeight.w400,
                  //       height: 1.2125,
                  //       color: const Color(0xff000000),
                  //     ),
                  //   ),
                  // ),
                    CertificateRow('الاسم',certificateController.selectedCertificate!.name!),
                    CertificateRow('الوصف',certificateController.selectedCertificate!.description),
                    CertificateRow('التاريخ',certificateController.selectedCertificate!.date),
                    if(certificateController.selectedCertificate!.accepted==true)
                    CertificateRow('النقاط',certificateController.selectedCertificate!.points),
                    if(certificateController.selectedCertificate!.accepted==true)
                    CertificateRow('الحالة',"مقبولة"),
                    if(certificateController.selectedCertificate!.accepted==false)
                    CertificateRow('الحالة',"في الانتظار"),
                         
                    // LicenceRow('رقم الهاتف',certificateController.selectedFullLicence!.profile!.phone),
                    // LicenceRow('عنوان المنزل',certificateController.selectedFullLicence!.profile!.address),
                    // LicenceRow('نوع الاجازة',certificateController.selectedFullLicence!.licence!.role),
                    // if(certificateController.selectedFullLicence!.licence!.role=="رياضي")
                    // LicenceRow('العمر',certificateController.selectedFullLicence!.licence!.categorie),
                    // LicenceRow('رقم الهوية',certificateController.selectedFullLicence!.profile!.cin),
                    // LicenceRow('تاريخ الولادة',certificateController.selectedFullLicence!.profile!.birthday.toString()),
                    // if(certificateController.selectedFullLicence!.licence!.role!="حكم")
                    // LicenceRow('النادي',certificateController.selectedFullLicence!.licence!.club),
                    // // LicenceRow('Ligue',certificateController.selectedFullLicence!.licence!.),
                    // if(certificateController.selectedFullLicence!.licence!.role!="حكم")
                    // LicenceRow('الرياضة',certificateController.selectedFullLicence!.licence!.discipline),
                    // // LicenceRow('Nationalite',certificateController.selectedFullLicence!.profile!.),
                    // if(certificateController.selectedFullLicence!.licence!.role=="مدرب")
                    // LicenceRow('Degree',certificateController.selectedFullLicence!.licence!.degree),
                    // if((certificateController.selectedFullLicence!.licence!.role=="مدرب")||(certificateController.selectedFullLicence!.licence!.role=="حكم"))
                    // LicenceRow('Grade',certificateController.selectedFullLicence!.licence!.grade),
                    // LicenceRow('الموسم',certificateController.selectedFullLicence!.licence!.seasons),
                    
                    // LicenceRow('الحالة',certificateController.selectedFullLicence!.licence!.state),
                    // RolePhotos(certificateController.selectedFullLicence!,context,certificateController)
                  ],
                            ),
                ),
              ],
               
            ),
          //  bottomNavigationBar: (certificateController.selectedFullLicence!.licence!.state=="في الانتظار"&&certificateController.currentUser.club!.id==null)?BottomAppBar(child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: (certificateController.selectedFullLicence!.licence!.role=="رياضي")?Row(
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
          //           certificateController.validateLicence(context);
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
          // //         ElevatedButton(onPressed: (){
          // //           certificateController.validateLicence(context);
          // //         },
          // //         style: ButtonStyle(
        
          // //   backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          // // ), child: const Text("قبول"),
          // //         ),
          // //          ElevatedButton(onPressed: (){
                    
          // //          },
          // //          style: ButtonStyle(
          // //   backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
          // // ), child: const Text("رفض"),
          // //          )
                
          //   )):const BottomAppBar(),
           
          ),
        );
      }
    );

  }
}
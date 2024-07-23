import 'package:flutter/material.dart';
import 'package:mobile_ftwkf_ranking/controllers/licence_controller.dart';
import 'package:mobile_ftwkf_ranking/router/routes.dart';
import 'package:mobile_ftwkf_ranking/widgets/global/appbar.dart';
import 'package:mobile_ftwkf_ranking/widgets/stats/stats_widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class CompareLicenceScreen extends StatefulWidget{
  @override
  State<CompareLicenceScreen> createState() => _CompareLicenceScreenState();
}

class _CompareLicenceScreenState extends State<CompareLicenceScreen> {
  late LicenceProvider licenceController;
  @override
  void initState() {
    licenceController=Provider.of<LicenceProvider>(context,listen: false);
    // licenceController.compareLicence();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: AppBar(title:Text('التحقق من الاجازات'))),
            SliverToBoxAdapter(
              
              child: Text('aaaaa'),
            ),
            SliverToBoxAdapter(
              child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CompareCell(txt: "الصورة",isColored: true,),
                              CompareCell(txt: "الاسم",isColored: true,),
                              CompareCell(txt: "اللقب",isColored: true,),
                              // CompareCell(txt: "الجنس",isColored: true,),
                              CompareCell(txt: "تاريخ الولادة",isColored: true,),
                                
                              // CompareCell(txt: "رقم الهاتف",isColored: true,),
                                
                                
                              // CompareCell(txt: "عنوان السكن",isColored: true,),
                              
                              // CompareCell(txt: "رقم الهوية",isColored: true,),
                                              // CompareCell(txt: "رقم الاجازة",isColored: true,),
                              
                              // CompareCell(txt: "نوع الاجازة",isColored: true,),
                              CompareCell(txt: "النادي",isColored: true,),
                              CompareCell(txt: "الرياضة",isColored: true,),
                              CompareCell(txt: "العمر",isColored: true,),
                              CompareCell(txt: "الجهة",isColored: true,),
                              // CompareCell(txt: "الوزن",isColored: true,),
                              CompareCell(txt: "الموسم",isColored: true,),
                              // CompareCell(txt: "حالة الاجازة",isColored: true,),
                              // CompareCell(txt: "الاسم",isColored: true,),
                              // CompareCell(txt: "الاسم",isColored: true,),
                            ]),
            ),
      
            SliverToBoxAdapter(
              child: FutureBuilder(future: licenceController.compareLicence(), builder: (context,snapshot){
                              if(snapshot.connectionState==ConnectionState.done){
                                List<dynamic>? licences=snapshot.data as List<dynamic>;
                                return Column(
                                  children: [
                                    for (var l in licences)
                                    Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CompareCellImage(txt:  l['profile']['profile_photo'],isColored: false),
                              PrimaryCompareCell(txt: l['profile']['first_name'],isColored: l['profile']['first_name']==licenceController.selectedFullLicence!.profile!.firstName!,),
                              PrimaryCompareCell(txt: l['profile']['last_name'],isColored: l['profile']['last_name']==licenceController.selectedFullLicence!.profile!.lastName!,),
                              // PrimaryCompareCell(txt: l['profile']['sexe'],isColored: l['profile']['sexe']==licenceController.selectedFullLicence!.profile!.sexe!,),
                              PrimaryCompareCell(txt: l['profile']['birthday'],isColored: l['profile']['birthday']==licenceController.selectedFullLicence!.profile!.birthday!,),
                                
                              // PrimaryCompareCell(txt: l['profile']['phone'].toString(),isColored: l['profile']['phone'].toString()==licenceController.selectedFullLicence!.profile!.phone!.toString(),),
                                
                                
                              // PrimaryCompareCell(txt: l['profile']['address'],isColored: l['profile']['address']==licenceController.selectedFullLicence!.profile!.address!,),
                              
                              // PrimaryCompareCell(txt: l['profile']['cin'],isColored: l['profile']['cin']==licenceController.selectedFullLicence!.profile!.cin!,),
                                              // PrimaryCompareCell(txt: l['licence']['num_licences'],isColored: l['licence']['num_licences']==licenceController.selectedFullLicence!.licence!.numLicences!,),
                              
                              // PrimaryCompareCell(txt:l['licence']['role'],isColored: l['licence']['role']==licenceController.selectedFullLicence!.licence!.role!,),
                              PrimaryCompareCell(txt: l['licence']['club'],isColored: l['licence']['club']==licenceController.selectedFullLicence!.licence!.club!,),
                              PrimaryCompareCell(txt: l['licence']['discipline'],isColored: l['licence']['discipline']==licenceController.selectedFullLicence!.licence!.discipline!,),
                              PrimaryCompareCell(txt:l['licence']['categorie'],isColored: l['licence']['categorie']==licenceController.selectedFullLicence!.licence!.categorie!,),
                              PrimaryCompareCell(txt: l['licence']['ligue'].toString(),isColored: l['licence']['ligue'].toString()==licenceController.selectedFullLicence!.licence!.ligue.toString(),),
                              // PrimaryCompareCell(txt: l['licence']['weight'].toString(),isColored: l['licence']['weight'].toString()==licenceController.selectedFullLicence!.licence!.weight.toString(),),
                              PrimaryCompareCell(txt: l['licence']['seasons'],isColored: l['licence']['seasons']==licenceController.selectedFullLicence!.licence!.seasons!,),
                              // PrimaryCompareCell(txt: l['licence']['state'],isColored: l['licence']['state']==licenceController.selectedFullLicence!.licence!.state!,),
                              // CompareCell(txt: "الاسم",isColored: true,),
                              // CompareCell(txt: "الاسم",isColored: true,),
                            ]),
                                  ],
                                );
                                
                              }
                              else{
                                return Center(child: CircularProgressIndicator());
                              }
                            })
            ),
      
            SliverToBoxAdapter(
              child: Column(
                          children: [
                            SizedBox(height: 1.h,),
                  
                            Center(child:Text("الاجازة الحالية",
                            style: TextStyle(
                              fontSize: 20
                            ),
                            )),
                            SizedBox(height: 1.h,),
                            // Center(child:Text("الاجازة الحالية")),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CompareCell(txt: "الصورة",isColored: true,),
                              CompareCell(txt: "الاسم",isColored: true,),
                              CompareCell(txt: "اللقب",isColored: true,),
                              // CompareCell(txt: "الجنس",isColored: true,),
                              CompareCell(txt: "تاريخ الولادة",isColored: true,),
                                
                              // CompareCell(txt: "رقم الهاتف",isColored: true,),
                                
                                
                              // CompareCell(txt: "عنوان السكن",isColored: true,),
                              
                              // CompareCell(txt: "رقم الهوية",isColored: true,),
                              //                 CompareCell(txt: "رقم الاجازة",isColored: true,),
                              
                              // CompareCell(txt: "نوع الاجازة",isColored: true,),
                              CompareCell(txt: "النادي",isColored: true,),
                              CompareCell(txt: "الرياضة",isColored: true,),
                              CompareCell(txt: "العمر",isColored: true,),
                              CompareCell(txt: "الجهة",isColored: true,),
                              // CompareCell(txt: "الوزن",isColored: true,),
                              CompareCell(txt: "الموسم",isColored: true,),
                              // CompareCell(txt: "حالة الاجازة",isColored: true,),
                              // CompareCell(txt: "الاسم",isColored: true,),
                              // CompareCell(txt: "الاسم",isColored: true,),
                            ]),
                            
                       
                                
                                 Column(
                                  children: [
                                   
                                    Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CompareCellImage(txt:  licenceController.selectedFullLicence!.profile!.profilePhoto!,isColored: false,),
                              CompareCell(txt: licenceController.selectedFullLicence!.profile!.firstName!,isColored: false,),
                              CompareCell(txt: licenceController.selectedFullLicence!.profile!.lastName!,isColored: false,),
                              // CompareCell(txt: licenceController.selectedFullLicence!.profile!.sexe!,isColored: false,),
                              CompareCell(txt: licenceController.selectedFullLicence!.profile!.birthday!,isColored: false,),
                                
                              // CompareCell(txt: licenceController.selectedFullLicence!.profile!.phone!.toString(),isColored: false,),
                                
                                
                              // CompareCell(txt: licenceController.selectedFullLicence!.profile!.address!,isColored: false,),
                              
                              // CompareCell(txt: licenceController.selectedFullLicence!.profile!.cin!,isColored: false,),
                              //                 CompareCell(txt: licenceController.selectedFullLicence!.licence!.numLicences!,isColored: false,),
                              
                              // CompareCell(txt:licenceController.selectedFullLicence!.licence!.role!,isColored: false,),
                              CompareCell(txt: licenceController.selectedFullLicence!.licence!.club!,isColored: false,),
                              CompareCell(txt: licenceController.selectedFullLicence!.licence!.discipline!,isColored: false,),
                              CompareCell(txt:licenceController.selectedFullLicence!.licence!.categorie!,isColored: false,),
                              CompareCell(txt: licenceController.selectedFullLicence!.licence!.ligue.toString(),isColored: false,),
                              // CompareCell(txt: licenceController.selectedFullLicence!.licence!.weight.toString(),isColored: false,),
                              CompareCell(txt: licenceController.selectedFullLicence!.licence!.seasons!,isColored: false,),
                              // CompareCell(txt: licenceController.selectedFullLicence!.licence!.state!,isColored: false,),
                              // CompareCell(txt: "الاسم",isColored: true,),
                              // CompareCell(txt: "الاسم",isColored: true,),
                            ]),
                                  ],
                                )
                                
                              
                              
                          ],
                        ),
            )
                      
                    
          ]
                
             
            
           
         
          // slivers: [
          //    AppBar(title:Text('التحقق من الاجازات'),
          //     // context, false,licenceController,false
          //   //  ,true
          //    ),
          //   SliverToBoxAdapter(
          //     child: Directionality(
          //       textDirection: TextDirection.rtl,
          //       child: Center(
          //         child: Container(
          //           height: 40.h,
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Column(
          //                 children: [
          //                   SizedBox(height: 1.h,),
                  
          //                   Center(child:Text("الاجازات المشابهة",
          //                   style: TextStyle(
          //                     fontSize: 20
          //                   ),
          //                   )),
          //                   SizedBox(height: 1.h,),
          //                   Row(
          //                     mainAxisAlignment: MainAxisAlignment.center,
          //                     children: [
          //                       CompareCell(txt: "الصورة",isColored: true,),
          //                     CompareCell(txt: "الاسم",isColored: true,),
          //                     CompareCell(txt: "اللقب",isColored: true,),
          //                     CompareCell(txt: "الجنس",isColored: true,),
          //                     CompareCell(txt: "تاريخ الولادة",isColored: true,),
                                
          //                     CompareCell(txt: "رقم الهاتف",isColored: true,),
                                
                                
          //                     CompareCell(txt: "عنوان السكن",isColored: true,),
                              
          //                     CompareCell(txt: "رقم الهوية",isColored: true,),
          //                                     CompareCell(txt: "رقم الاجازة",isColored: true,),
                              
          //                     CompareCell(txt: "نوع الاجازة",isColored: true,),
          //                     CompareCell(txt: "النادي",isColored: true,),
          //                     CompareCell(txt: "الرياضة",isColored: true,),
          //                     CompareCell(txt: "العمر",isColored: true,),
          //                     CompareCell(txt: "الجهة",isColored: true,),
          //                     // CompareCell(txt: "الوزن",isColored: true,),
          //                     CompareCell(txt: "الموسم",isColored: true,),
          //                     CompareCell(txt: "حالة الاجازة",isColored: true,),
          //                     // CompareCell(txt: "الاسم",isColored: true,),
          //                     // CompareCell(txt: "الاسم",isColored: true,),
          //                   ]),
          //                   FutureBuilder(future: licenceController.compareLicence(), builder: (context,snapshot){
          //                     if(snapshot.connectionState==ConnectionState.done){
          //                       List<dynamic>? licences=snapshot.data as List<dynamic>;
          //                       return Column(
          //                         children: [
          //                           for (var l in licences)
          //                           Row(
          //                     mainAxisAlignment: MainAxisAlignment.center,
          //                     children: [
          //                       CompareCellImage(txt:  l['profile']['profile_photo'],isColored: false),
          //                     PrimaryCompareCell(txt: l['profile']['first_name'],isColored: l['profile']['first_name']==licenceController.selectedFullLicence!.profile!.firstName!,),
          //                     PrimaryCompareCell(txt: l['profile']['last_name'],isColored: l['profile']['last_name']==licenceController.selectedFullLicence!.profile!.lastName!,),
          //                     PrimaryCompareCell(txt: l['profile']['sexe'],isColored: l['profile']['sexe']==licenceController.selectedFullLicence!.profile!.sexe!,),
          //                     PrimaryCompareCell(txt: l['profile']['birthday'],isColored: l['profile']['birthday']==licenceController.selectedFullLicence!.profile!.birthday!,),
                                
          //                     PrimaryCompareCell(txt: l['profile']['phone'].toString(),isColored: l['profile']['phone'].toString()==licenceController.selectedFullLicence!.profile!.phone!.toString(),),
                                
                                
          //                     PrimaryCompareCell(txt: l['profile']['address'],isColored: l['profile']['address']==licenceController.selectedFullLicence!.profile!.address!,),
                              
          //                     PrimaryCompareCell(txt: l['profile']['cin'],isColored: l['profile']['cin']==licenceController.selectedFullLicence!.profile!.cin!,),
          //                                     PrimaryCompareCell(txt: l['licence']['num_licences'],isColored: l['licence']['num_licences']==licenceController.selectedFullLicence!.licence!.numLicences!,),
                              
          //                     PrimaryCompareCell(txt:l['licence']['role'],isColored: l['licence']['role']==licenceController.selectedFullLicence!.licence!.role!,),
          //                     PrimaryCompareCell(txt: l['licence']['club'],isColored: l['licence']['club']==licenceController.selectedFullLicence!.licence!.club!,),
          //                     PrimaryCompareCell(txt: l['licence']['discipline'],isColored: l['licence']['discipline']==licenceController.selectedFullLicence!.licence!.discipline!,),
          //                     PrimaryCompareCell(txt:l['licence']['categorie'],isColored: l['licence']['categorie']==licenceController.selectedFullLicence!.licence!.categorie!,),
          //                     PrimaryCompareCell(txt: l['licence']['ligue'].toString(),isColored: l['licence']['ligue'].toString()==licenceController.selectedFullLicence!.licence!.ligue.toString(),),
          //                     // PrimaryCompareCell(txt: l['licence']['weight'].toString(),isColored: l['licence']['weight'].toString()==licenceController.selectedFullLicence!.licence!.weight.toString(),),
          //                     PrimaryCompareCell(txt: l['licence']['seasons'],isColored: l['licence']['seasons']==licenceController.selectedFullLicence!.licence!.seasons!,),
          //                     PrimaryCompareCell(txt: l['licence']['state'],isColored: l['licence']['state']==licenceController.selectedFullLicence!.licence!.state!,),
          //                     // CompareCell(txt: "الاسم",isColored: true,),
          //                     // CompareCell(txt: "الاسم",isColored: true,),
          //                   ]),
          //                         ],
          //                       );
                                
          //                     }
          //                     else{
          //                       return Center(child: CircularProgressIndicator());
          //                     }
          //                   })
          //                 ],
          //               ),
          //               Column(
          //                 children: [
          //                   SizedBox(height: 1.h,),
                  
          //                   Center(child:Text("الاجازة الحالية",
          //                   style: TextStyle(
          //                     fontSize: 20
          //                   ),
          //                   )),
          //                   SizedBox(height: 1.h,),
          //                   // Center(child:Text("الاجازة الحالية")),
          //                   Row(
          //                     mainAxisAlignment: MainAxisAlignment.center,
          //                     children: [
          //                       CompareCell(txt: "الصورة",isColored: true,),
          //                     CompareCell(txt: "الاسم",isColored: true,),
          //                     CompareCell(txt: "اللقب",isColored: true,),
          //                     CompareCell(txt: "الجنس",isColored: true,),
          //                     CompareCell(txt: "تاريخ الولادة",isColored: true,),
                                
          //                     CompareCell(txt: "رقم الهاتف",isColored: true,),
                                
                                
          //                     CompareCell(txt: "عنوان السكن",isColored: true,),
                              
          //                     CompareCell(txt: "رقم الهوية",isColored: true,),
          //                                     CompareCell(txt: "رقم الاجازة",isColored: true,),
                              
          //                     CompareCell(txt: "نوع الاجازة",isColored: true,),
          //                     CompareCell(txt: "النادي",isColored: true,),
          //                     CompareCell(txt: "الرياضة",isColored: true,),
          //                     CompareCell(txt: "العمر",isColored: true,),
          //                     CompareCell(txt: "الجهة",isColored: true,),
          //                     // CompareCell(txt: "الوزن",isColored: true,),
          //                     CompareCell(txt: "الموسم",isColored: true,),
          //                     CompareCell(txt: "حالة الاجازة",isColored: true,),
          //                     // CompareCell(txt: "الاسم",isColored: true,),
          //                     // CompareCell(txt: "الاسم",isColored: true,),
          //                   ]),
                            
                       
                                
          //                        Column(
          //                         children: [
                                   
          //                           Row(
          //                     mainAxisAlignment: MainAxisAlignment.center,
          //                     children: [
          //                       CompareCellImage(txt:  licenceController.selectedFullLicence!.profile!.profilePhoto!,isColored: false,),
          //                     CompareCell(txt: licenceController.selectedFullLicence!.profile!.firstName!,isColored: false,),
          //                     CompareCell(txt: licenceController.selectedFullLicence!.profile!.lastName!,isColored: false,),
          //                     CompareCell(txt: licenceController.selectedFullLicence!.profile!.sexe!,isColored: false,),
          //                     CompareCell(txt: licenceController.selectedFullLicence!.profile!.birthday!,isColored: false,),
                                
          //                     CompareCell(txt: licenceController.selectedFullLicence!.profile!.phone!.toString(),isColored: false,),
                                
                                
          //                     CompareCell(txt: licenceController.selectedFullLicence!.profile!.address!,isColored: false,),
                              
          //                     CompareCell(txt: licenceController.selectedFullLicence!.profile!.cin!,isColored: false,),
          //                                     CompareCell(txt: licenceController.selectedFullLicence!.licence!.numLicences!,isColored: false,),
                              
          //                     CompareCell(txt:licenceController.selectedFullLicence!.licence!.role!,isColored: false,),
          //                     CompareCell(txt: licenceController.selectedFullLicence!.licence!.club!,isColored: false,),
          //                     CompareCell(txt: licenceController.selectedFullLicence!.licence!.discipline!,isColored: false,),
          //                     CompareCell(txt:licenceController.selectedFullLicence!.licence!.categorie!,isColored: false,),
          //                     CompareCell(txt: licenceController.selectedFullLicence!.licence!.ligue.toString(),isColored: false,),
          //                     // CompareCell(txt: licenceController.selectedFullLicence!.licence!.weight.toString(),isColored: false,),
          //                     CompareCell(txt: licenceController.selectedFullLicence!.licence!.seasons!,isColored: false,),
          //                     CompareCell(txt: licenceController.selectedFullLicence!.licence!.state!,isColored: false,),
          //                     // CompareCell(txt: "الاسم",isColored: true,),
          //                     // CompareCell(txt: "الاسم",isColored: true,),
          //                   ]),
          //                         ],
          //                       )
                                
                              
                              
          //                 ],
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
      
            
          // ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
          //         ElevatedButton(onPressed: (){
          //           GoRouter.of(context).push(Routes.CompareLicence);
          //          },
          //          style: ButtonStyle(
          //   backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          // ), child: const Text("تحقق"),
          //          )
                  ElevatedButton(onPressed: (){
                    licenceController.validateLicence(context);
                    
                  },
                  style: ButtonStyle(
        
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          ), child: const Text("قبول"),
                  ),
          //          ElevatedButton(onPressed: (){
                    
          //          },
          //          style: ButtonStyle(
          //   backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
          // ), child: const Text("رفض"),
          //          )
                ],
              ),
            )),
      );
    // TODO: implement build
  }
}
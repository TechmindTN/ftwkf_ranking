import 'package:flutter/material.dart';
import 'package:mobile_ftwkf_ranking/controllers/licence_controller.dart';
import 'package:mobile_ftwkf_ranking/router/routes.dart';
import 'package:mobile_ftwkf_ranking/screens/licence/compare/compare_licence_screen.dart';
import 'package:mobile_ftwkf_ranking/widgets/global/appbar.dart';
import 'package:mobile_ftwkf_ranking/widgets/licence/licence_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../global/utils.dart';

class ProfileScreen extends StatefulWidget{
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late LicenceProvider licenceController;
    final GlobalKey<ScaffoldState> sKey=GlobalKey();
     late VideoPlayerController _controller;
  @override
  void initState() {
    licenceController=Provider.of<LicenceProvider>(context,listen: false);
    licenceController.getParameters();
    super.initState();
  }
  @override
  Future<void> didChangeDependencies() async {

                       _controller =  VideoPlayerController.networkUrl(Uri.parse(
        // licenceController.currentFullLicence.profile!.video!
        "https://www.youtube.com/watch?v=93gcf30R2hY"
        ))..initialize();
    // // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<LicenceProvider>(
      builder: (context,licenceController,child) {
        return Directionality(
                textDirection: TextDirection.rtl,

          child: Scaffold(
            // appBar: AppBar(title: Text('الاجازة '+licenceController.currentFullLicence!.licence!.numLicences.toString()),
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
            //           if(licenceController.currentFullLicence!.licence!.role=="رياضي")
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
                MySliverAppBar('الاجازة ${licenceController.currentFullLicence!.licence!.numLicences!}', context, false,licenceController,false,false),
                SliverToBoxAdapter(
                  child: Column(
                          
                  children: [
                    Container(
                    // man2Fct (1:93)
                    margin: const EdgeInsets.fromLTRB(0, 20, 1, 19),
                    width: 121,
                    height: 121,
                    child: (licenceController.currentFullLicence!.profile!.profilePhoto!=null && licenceController.currentFullLicence!.profile!.profilePhoto!="")?
                    InkWell(
                      onTap: () {
                          licenceController.showImage(context,licenceController.currentFullLicence!.profile!.profilePhoto);
                        },
                      child: Image.network(licenceController.currentFullLicence!.profile!.profilePhoto!))
                    :Image.asset(
                      'assets/icons/man.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    // mohsenbenmohsenbAx (1:94)
                    margin: const EdgeInsets.fromLTRB(9, 0, 0, 22),
                    child: Text(
                      '${licenceController.currentFullLicence!.profile!.lastName} ${licenceController.currentFullLicence!.profile!.firstName}',
                      style: SafeGoogleFont (
                        'Inter',
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        height: 1.2125,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
                  if((licenceController.currentFullLicence.profile!.video!=null)&&(licenceController.currentFullLicence.profile!.video!=""))ElevatedButton(onPressed: (){
                    showDialog(context: context, builder: (context){
                    
                     
                      return AlertDialog(
                        content: Container(
                          child: Column(
                            children: [
                              AspectRatio(

                                aspectRatio: _controller.value.aspectRatio,
                                child: VideoPlayer(_controller,
                                
                                )),
                                ElevatedButton(onPressed: (){
                                  _controller.play();
                                }, child: Text("Play")),
                                ElevatedButton(onPressed: (){
                                  _controller.pause();
                                }, child: Text("Pause"))
                            ],
                          ),
                        ),
                      );
                    });
                  }, child: Text("تشغيل الفيديو")),
                    LicenceRow('اللقب',licenceController.currentFullLicence!.profile!.lastName),
                    LicenceRow('الاسم',licenceController.currentFullLicence!.profile!.firstName),
                    LicenceRow('الجنس',licenceController.currentFullLicence!.profile!.sexe),
                          
                    LicenceRow('رقم الهاتف',licenceController.currentFullLicence!.profile!.phone),
                    LicenceRow('عنوان المنزل',licenceController.currentFullLicence!.profile!.address),
                    LicenceRow('نوع الاجازة',licenceController.currentFullLicence!.licence!.role),
                    if(licenceController.currentFullLicence!.licence!.role=="رياضي")
                    LicenceRow('العمر',licenceController.currentFullLicence!.licence!.categorie),
                    LicenceRow('رقم الهوية',licenceController.currentFullLicence!.profile!.cin),
                    LicenceRow('تاريخ الولادة',licenceController.currentFullLicence!.profile!.birthday.toString()),
                    if(licenceController.currentFullLicence!.licence!.role!="حكم")
                    LicenceRow('النادي',licenceController.currentFullLicence!.licence!.club),
                    // LicenceRow('Ligue',licenceController.currentFullLicence!.licence!.),
                    if(licenceController.currentFullLicence!.licence!.role!="حكم")
                    LicenceRow('الرياضة',licenceController.currentFullLicence!.licence!.discipline),
                    // LicenceRow('Nationalite',licenceController.currentFullLicence!.profile!.),
                    if(licenceController.currentFullLicence!.licence!.role=="مدرب")
                    LicenceRow('Degree',licenceController.currentFullLicence!.licence!.degree),
                    if((licenceController.currentFullLicence!.licence!.role=="مدرب")||(licenceController.currentFullLicence!.licence!.role=="حكم"))
                    LicenceRow('Grade',licenceController.currentFullLicence!.licence!.grade),
                    LicenceRow('الموسم',licenceController.currentFullLicence!.licence!.seasons),
                    
                    LicenceRow('الحالة',licenceController.currentFullLicence!.licence!.state),
                    // RolePhotos(licenceController.currentFullLicence!,context,licenceController)
                  ],
                            ),
                ),
              ],
               
            ),
          //  bottomNavigationBar: (licenceController.currentFullLicence!.licence!.state=="في الانتظار"&&licenceController.currentUser.club!.id==null)?BottomAppBar(child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: (licenceController.currentFullLicence!.licence!.role=="رياضي")?Row(
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
          // //         ElevatedButton(onPressed: (){
          // //           licenceController.validateLicence(context);
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
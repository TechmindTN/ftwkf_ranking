// ignore_for_file: file_names

import 'dart:ui';

// import 'package:competition/global/global.dart';
import 'package:flutter/material.dart';
import 'package:mobile_ftwkf_ranking/controllers/licence_controller.dart';
import 'package:mobile_ftwkf_ranking/router/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/global/inputs.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameControl=TextEditingController();
    TextEditingController psdControl=TextEditingController();
    late LicenceProvider licenceController;
        // late SettingsController settingsController;

  final _formKey = GlobalKey<FormState>();
@override
  void initState() {
    licenceController=Provider.of<LicenceProvider>(context,listen:false);
    // licenceController.checkLogin(context);
        // settingsController=Provider.of<SettingsController>(context,listen:false);

    super.initState();
  }


      @override
  Future<void> didChangeDependencies() async {
    // authController=Provider.of<AuthController>(context,listen: false);
    //  authController.prefs = await SharedPreferences.getInstance();
    //  authController.checkLogin(context);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
      // Global global=Global(context);

    return Scaffold(
     body: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Text("Authentifier",
                          
                          // style: Theme.of(context).textTheme.headline2,
                          // ),
                          Image.asset("assets/images/logo-ftwkf.png"),

    
                         Directionality(
                          textDirection: TextDirection.rtl,
                           child: Center(
                             child: Consumer<LicenceProvider>(
                                             builder: (context,licenceController,child) {
                                  return Padding(
                                          padding: const EdgeInsets.only(left:12.0),
                                      child: TextFormField(
                                             
                                             expands: false,
                                             
                                             enabled: true,
                                             controller: usernameControl,
                                             obscureText: false,
                                             decoration: InputDecoration(
                                               
                                               hintText: "رقم الاجازة",
                                              //  border: InputBorder.none,
                                       
                                             ),
                                             
                                           
                                                ),
                                    );
                                }
                              ),
                           ),
                         ),
                         Directionality(
                          textDirection: TextDirection.rtl,
                           child: Center(
                             child: Consumer<LicenceProvider>(
                                             builder: (context,licenceController,child) {
                                  return Padding(
                                          padding: const EdgeInsets.only(left:12.0),
                                      child: TextFormField(
                                             
                                             expands: false,
                                             
                                             enabled: true,
                                             controller: psdControl,
                                             obscureText: true,
                                             decoration: InputDecoration(
                                               
                                               hintText: "كلمة السر",
                                              //  border: InputBorder.none,
                                       
                                             ),
                                             
                                           
                                                ),
                                    );
                                }
                              ),
                           ),
                         ),
                          
                          // AuthInput("رقم الاجازة", usernameControl,false),
                          // AuthInput("كلمة السر", psdControl,true),
                         
                         
                         
                         
                         
                          // TextInput(hint: "Numéro Téléphone",hide: false,control: usernameControl,required: true,),
                          
                          // TextInput(hint: "Mot de passe",hide: true,control: psdControl,controller: authController,required: true,),
      
                          // !authController.isLoading?
                          FloatingActionButton.extended(onPressed: (){
                            // GoRouter.of(context).go(Routes.Home);
                            licenceController.simpleLogin(context,usernameControl.text,psdControl.text);
      
      
                                    // Navigator.pushNamed(context, "/role");
      
                            // Navigator.pushNamed(context, "/home");
                          },
                          
                           label: const Text("تسجيل الدخول",
                           style: TextStyle(color: Colors.white),
                          // style: Theme.of(context).textTheme.button,
                          ),
                          backgroundColor: Theme.of(context).primaryColor,
                          // isExtended: true,
                          extendedPadding: const EdgeInsets.symmetric(horizontal: 40),
                          ),
                          // :
                          // CircularProgressIndicator(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("ليس لديك حساب",
                              style: TextStyle(
                                                          fontSize: 16,
                    
                              ),
                              ),
                              InkWell(
                                onTap: () {
                                  GoRouter.of(context).push(Routes.Register);
                                  // Navigator.pushNamed(context, "/select_role");
                                  
                                },
                                child:Text("انشاء حساب",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w700
                                ),)
                              ),
                            ],
                          ),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("نسيت كلمة المرور؟؟",
                              style: TextStyle(                          fontSize: 16,
                    ),
                              ),
                              InkWell(
                                child:Text("استرجاع كلمة المرور",
                                style: TextStyle(
                                                            fontSize: 16,
                    
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w700
                                ),)
                              ),
                            ],
                          ),
                          
                              
                        ],
                      ),
     )
                    );
      

  }
}
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

class RegisterScreen extends StatefulWidget{
  const RegisterScreen({super.key});


  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController usernameControl=TextEditingController();
    TextEditingController psdControl=TextEditingController();
    TextEditingController psdConfirmControl=TextEditingController();
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
      
      body: Directionality(
              textDirection: TextDirection.rtl,

        child: Container(
          width: 100.w,
          height: 100.h,
          // height: global.height,
          // width: global.width,
          decoration: const BoxDecoration
          (
            image: DecorationImage(
              image:AssetImage("assets/images/kungfuimage.jpg",
              
              ),
              fit: BoxFit.cover,
              
              opacity: 0.4
              )
          ),
           child:  BackdropFilter(
            filter:  ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              decoration:  BoxDecoration(color: Colors.white.withOpacity(0.0)),
           
           child: Center(
            child: SingleChildScrollView(
              child: Container(
                width: 90.w,
                height: 80.h,
                decoration: const BoxDecoration(
                  color: Color(0xffd9d9d9),
                  // color: SettingsController.isDarkTheme?Color.fromARGB(255, 34, 34, 34):Color(0xffd9d9d9),
                  borderRadius:  BorderRadius.all(Radius.circular(2)),
                ),
                child: Center(child: 
                Consumer<LicenceProvider>(
                  builder: (context,licenceController,child) {
                    return Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Text("Authentifier",
                          
                          // style: Theme.of(context).textTheme.headline2,
                          // ),
                          Image.asset("assets/images/logo-ftwkf.png"),
                          AuthInput("رقم الاجازة", usernameControl,false),
                          AuthInput("كلمة السر", psdControl,true),
                          AuthInput("تاكيد كلمة السر", psdConfirmControl,true),
                          // TextInput(hint: "Numéro Téléphone",hide: false,control: usernameControl,required: true,),
                          
                          // TextInput(hint: "Mot de passe",hide: true,control: psdControl,controller: authController,required: true,),
      
                          // !authController.isLoading?
                          FloatingActionButton.extended(onPressed: (){
                            // GoRouter.of(context).go(Routes.Home);
                            licenceController.createUser(context,username:usernameControl.text,psd:psdControl.text);
      
      
                                    // Navigator.pushNamed(context, "/role");
      
                            // Navigator.pushNamed(context, "/home");
                          },
                          
                           label: const Text("انشاء حساب",
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
                              const Text("لديك حساب",
                              style: TextStyle(
                                                          fontSize: 16,
                    
                              ),
                              ),
                              InkWell(
                                onTap: () {
                                  GoRouter.of(context).push(Routes.Login);
                                  // Navigator.pushNamed(context, "/select_role");
                                  
                                },
                                child:Text("تسجيل الدخول",
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
                    );
                  }
                )
                ),
              ),
            ),
            
           ),
            ),
          ),
        ),
      ),
    );

  }
}
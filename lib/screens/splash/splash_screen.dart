import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/licence_controller.dart';

class MySplashScreen extends StatefulWidget{
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  late Widget next;
  late LicenceProvider licenceController;

  @override
  void initState() {
    licenceController=Provider.of<LicenceProvider>(context,listen: false);
    // licenceController.checkLogin(context);
    
    licenceController.checkLogin(context);
    
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // if(licenceController.currentUser.club!.id==null){
      // licenceController.getStats();
    // }
    // else{
    //   licenceController.getClubStats();
    // }
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
            textDirection: TextDirection.rtl,

      child: Scaffold(
        body: 
        // Center(
        //   child: Text("Mochkla fi check login"),
        // )
         Center(child: Image.asset("assets/images/logo-ftwkf.png")),
      ),
    );

  }
}
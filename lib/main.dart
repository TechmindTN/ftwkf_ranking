import 'package:flutter/material.dart';
import 'package:mobile_ftwkf_ranking/controllers/certificate_controller.dart';
import 'package:mobile_ftwkf_ranking/controllers/club_controller.dart';
import 'package:mobile_ftwkf_ranking/controllers/licence_controller.dart';
import 'package:mobile_ftwkf_ranking/controllers/parameters_controller.dart';
import 'package:mobile_ftwkf_ranking/router/pages.dart';

import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp( TestApp());
}
class TestApp extends StatelessWidget{
  final Pages pages=Pages();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>LicenceProvider()),
        ChangeNotifierProvider(create: (_)=>ClubProvider()),
        ChangeNotifierProvider(create: (_)=>ParameterProvider()),
        ChangeNotifierProvider(create: (_)=>CertificateProvider()),
        ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return SafeArea(
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'FTWKF',
              theme: ThemeData(
               
                
                primarySwatch: Colors.blue,
              ),
              routerConfig: pages.router,
              // home: Scaffold(body: Center(child: Text("Mochkla fil project"),)),
            ),
          );
        }
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}
class MyApp extends StatelessWidget {
   MyApp({super.key});
  final Pages pages=Pages();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      
      providers: [
        ChangeNotifierProvider(create: (_)=>LicenceProvider()),
        ChangeNotifierProvider(create: (_)=>ClubProvider()),
        ChangeNotifierProvider(create: (_)=>ParameterProvider()),
        ChangeNotifierProvider(create: (_)=>CertificateProvider()),
        ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return SafeArea(
            child: MaterialApp.router(
              
               debugShowCheckedModeBanner: false,
              title: 'FTWKF',
              theme: ThemeData(
               
                
                primarySwatch: Colors.blue,
              ),
              routerConfig: pages.router,
              // home: const MyHomePage(title: 'Flutter Demo Home Page'),
            ),
          );
        }
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

 

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
 

//   @override
//   Widget build(BuildContext context) {
   
//     return  LicencePage();
    
//   }
// }

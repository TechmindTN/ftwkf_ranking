import 'package:flutter/material.dart';
import 'package:mobile_ftwkf_ranking/controllers/certificate_controller.dart';
import 'package:mobile_ftwkf_ranking/global/utils.dart';
import 'package:mobile_ftwkf_ranking/models/certificate.dart';
import 'package:mobile_ftwkf_ranking/router/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_ftwkf_ranking/widgets/global/modals.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';



Widget CertificateImageUploadWidget(txt, certificateController, context,
    String? toFillImage, String? placeHolderImage,int index) {
    //  bool ishovered=true;
  return Consumer<CertificateProvider>(

    builder: (context,certificateeController,child) {
      return Column(

        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onHover: (value) {
                
                if(value){
                  certificateeController.isHovered[index]=true;
                  certificateeController.notify();
                  
                }
                else{
                  certificateeController.isHovered[index]=false;
                  certificateeController.notify();
                }
              },
              
              onTap: (() {
                showModalBottomSheet(
              context: context,
              builder: (context) {
                return CertificateMediaModal(certificateeController, context, toFillImage);
              });
                // licenceController.pickAthleteImage(true,context,toFillImage);
              }),
              child: Container(
               
                  decoration: BoxDecoration(
                    image: (placeHolderImage != null)
                      ? DecorationImage(image: NetworkImage(placeHolderImage,
                      
                      
                      ),
                      opacity: (certificateeController.isHovered[index])?0.3:1,
                      fit: BoxFit.cover
                      ):null,
                    boxShadow: const [
                      BoxShadow(color: Colors.black26),
                      BoxShadow(
                        color: Color(0xffD9D9D9),
                        spreadRadius: -12,
                        blurRadius: 20,

                      )
                    ],
                      borderRadius: const BorderRadius.all(Radius.circular(40)),
                      ),
                  width: 30.w,
                  height: 22.h,
               
                   child: (certificateeController.isHovered[index])?
                   Center(
                    child: Icon(Icons.camera_alt,
                    size: 5.w,
                    ),
                   )
                   :const SizedBox(),
                      ),
            ),
          ),
          SizedBox(
            height: 0.5.h,
          ),
          Text(txt,
          style: const TextStyle(
            fontSize: 20
          ),
          ),
          SizedBox(
            height: 1.h,
          ),
        ],
      );
    }
  );
}


Widget CertifItem(
    Certificate certif, CertificateProvider certificateController, context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        // autogroupqd1zLpG (F37U4uNLqRBdFGbp4sQD1z)

        // //width: double.infinity,
        //height: double.infinity,
        width: 90.w,
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
            certificateController.selectedCertificate = certif;
            // Navigator.push(context,
            //     MaterialPageRoute(builder: ((context) => LicenceScreen())));
            GoRouter.of(context).push(Routes.CertificateScreen);
            // Navigator.pushNamed(context, Routes.LicenceScreen);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // autogroupitbe2SC (F37UKZcanBTmfvyEYdiTBE)
                  margin: const EdgeInsets.fromLTRB(6, 0, 0, 2),
                  //width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // licencenum16358749xKr (1:62)
                        margin: const EdgeInsets.fromLTRB(27, 0, 0, 0),
                        child: Text(
                         certif.name!,
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            height: 1.2125,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                      Text(
                        // valideTXW (1:64)
                        certif.date.toString(),
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          height: 1.2125,
                          // color: (fullLicence.licence!.state.toString() ==
                          //         "نشطة")
                          //     ? const Color(0xff02ce16)
                          //     : (fullLicence.licence!.state.toString() ==
                          //             "في الانتظار")
                          //         ? const Color(0xfff5700a)
                          //         : const Color(0xfffc0303),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // autogroupubylbtc (F37UQoxqf6Dn3wXHhuubYL)
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                  //width: double.infinity,
                  height: 22.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // athletecYp (1:65)
                        margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: Text(
                          certif.description!,
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            height: 1.2125,
                            color: const Color(0xff717171),
                          ),
                        ),
                      ),
                       Center(
                         child: Container(
                                           // man2L5W (2:231)
                                           margin: const EdgeInsets.fromLTRB(0, 2, 2, 0),
                                           // width: 200,
                                           height: 100,
                                           child: (certif.image != null &&
                             certif.image != "")
                          ? Image.network(certif.image!)
                          : Image.asset(
                              'assets/icons/man.png',
                              fit: BoxFit.cover,
                            ),
                                         ),
                       ),
                      // Container(
                      //   // athletecYp (1:65)
                      //   margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      //   child: Text(
                      //     fullLicence.licence!.role!,
                      //     style: SafeGoogleFont(
                      //       'Inter',
                      //       fontSize: 18,
                      //       fontWeight: FontWeight.w400,
                      //       height: 1.2125,
                      //       color: const Color(0xff717171),
                      //     ),
                      //   ),
                      // ),
                      
                     
                      // Text(
                      //   fullLicence.licence!.ligue.toString(),
                      //   style: SafeGoogleFont(
                      //     'Inter',
                      //     fontSize: 18,
                      //     fontWeight: FontWeight.w400,
                      //     height: 1.2125,
                      //     color: const Color(0xff717171),
                      //   ),
                      // ),
                      // Text(
                      //   fullLicence.licence!.seasons.toString(),
                      //   style: SafeGoogleFont(
                      //     'Inter',
                      //     fontSize: 18,
                      //     fontWeight: FontWeight.w400,
                      //     height: 1.2125,
                      //     color: const Color(0xff717171),
                      //   ),
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("النقاط: "+certif.points.toString(),
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            height: 1.2125,
                            color: const Color(0xff717171),
                          ),),
                          (certif.accepted==true)?Text("الحالة: مقبولة",
                          style: SafeGoogleFont(
                            'Inter',
                            
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            height: 1.2125,
                            color:Colors.green,
                          ),):Text("الحالة: في الانتظار",
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            height: 1.2125,
                            color: Colors.orange,
                          ),)
                        ],
                       )
                    ],
                  ),
                ),
                // Container(
                //   // benarouscBS (2:233)
                //   margin: EdgeInsets.fromLTRB(0, 0, 68, 5),
                //   child: Text(
                //     'بن عروس',
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


Widget CertificateRow(String key, dynamic value) {
   Color color=Color(0xff717171);
  if(value=="مقبولة"){
    color=Colors.green;
  }
  else if(value=="في الانتظار"){
    color=Colors.orange;
  }
  return Container(
    // autogroup88fjWYp (F37ZNvBnENG3MzFKy188fJ)
    margin: const EdgeInsets.fromLTRB(51, 0, 36, 24),
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          key,
          style: SafeGoogleFont(
            'Inter',
            fontSize: 18,
            fontWeight: FontWeight.w400,
            height: 1.2125,
            color: const Color(0xff717171),
          ),
        ),
        Text(
          // MZS (1:96)
          value.toString(),
          style: SafeGoogleFont(
            'Inter',
            fontSize: 18,
            fontWeight: FontWeight.w400,
            height: 1.2125,
            color: color
          ),
        ),
      ],
    ),
  );
}
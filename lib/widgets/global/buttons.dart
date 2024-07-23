// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/licence_controller.dart';

Widget SearchButton(LicenceProvider licenceController,numControl,context,role){
  return Directionality(
            textDirection: TextDirection.rtl,

    child: InkWell(
      onTap: (){
        if(numControl.text.length==13){
          // licenceController.searchFullLicence(context,numControl.text.toString());
        }
        else if(numControl.text.length<13){
          licenceController.searchLicences(context,numControl.text.toString(),role);
        }
        
      },
      child: Container(
        width: 12.w,
        height: 3.05.h,
        
        decoration: BoxDecoration(
          color: const Color(0xff5fcafa),
            borderRadius: BorderRadius.circular(6),
              boxShadow: const [
                
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0,2)
                )
              ],
        ),
        
        child: const Center(child: Text("بحث",
        style: TextStyle(
          color: Colors.white
        ),
    
        )),
      ),
    ),
  );
}


Widget SecondarySearchButton(LicenceProvider licenceController,firstControl,lastControl,context,role){
  return Directionality(
            textDirection: TextDirection.rtl,

    child: InkWell(
      onTap: (){
        // licenceController.searchProfiles(firstControl.text,lastControl.text,context);
        // if(numControl.text.length==13){
        //   licenceController.searchFullLicence(context,numControl.text.toString());
        // }
        // else if(numControl.text.length<13){
        //   licenceController.searchLicences(context,numControl.text.toString(),role);
        // }
        
      },
      child: Container(
        width: 12.w,
        height: 3.05.h,
        
        decoration: BoxDecoration(
          color: const Color(0xff5fcafa),
            borderRadius: BorderRadius.circular(6),
              boxShadow: const [
                
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0,2)
                )
              ],
        ),
        
        child: const Center(child: Text("بحث",
        style: TextStyle(
          color: Colors.white
        ),
    
        )),
      ),
    ),
  );
}
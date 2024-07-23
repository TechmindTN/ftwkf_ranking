// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../controllers/licence_controller.dart';

Widget ArbitreImageEditWidget(
    txt, LicenceProvider licenceController, context, imageName, img,index) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
           onTap: () async {
         await licenceController.pickArbitreImage(true, context, imageName);
        },
        onHover: (value) {
                
                if(value){
                  licenceController.isHovered[index]=true;
                  licenceController.notify();
                  
                }
                else{
                  licenceController.isHovered[index]=false;
                  licenceController.notify();
                }
              },
          child: Container(
               decoration: BoxDecoration(
                    image: (img != null)
                      ? DecorationImage(image: NetworkImage(img,
                      
                      
                      ),
                      opacity: (licenceController.isHovered[index])?0.3:1,
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
                      // color: Color(0xffD9D9D9)
                      ),
                  width: 30.w,
                  height: 22.h,
              child: (licenceController.isHovered[index])?
                   Center(
                    child: Icon(Icons.camera_alt,
                    size: 5.w,
                    ),
                   )
                   :const SizedBox(),),
        ),
      ),
      // Text(placeHolderImage.toString()),
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
      // FloatingActionButton.extended(
      //   onPressed: () {
      //     showModalBottomSheet(
      //         context: context,
      //         builder: (context) {
      //           return EditMediaModal(
      //               licenceController, context, imageName, img);
      //         });
      //   },
      //   label: Text("Select"),
      // )
    ],
  );
}



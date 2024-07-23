// ignore_for_file: non_constant_identifier_names

// import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mobile_ftwkf_ranking/controllers/licence_controller.dart';
import 'package:mobile_ftwkf_ranking/models/Stats.dart';
// import 'package:mobile_ftwkf_ranking/models/stats.dart';
import 'package:sizer/sizer.dart';

Widget imageWidget(){
  return SizedBox(
    width: 90.w,
    height: 15.h,
    // decoration: BoxDecoration(
    //   color: Colors.red,
    //   // borderRadius: BorderRadius.all(Radius.circular(200))
    // ),
    child: ClipRRect(
borderRadius: BorderRadius.circular(5),
      child: Image.asset('assets/images/image.PNG',
      fit: BoxFit.fill,
      
      ),
    ),
  );
}

Widget SeasonWidget(){
  return const Padding(
    padding: EdgeInsets.all(16.0),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("الموسم ",
          style: TextStyle(
            fontSize: 20
          ),
          ),
          Text("2022-2023",
          style: TextStyle(
            fontSize: 20,
            color: Color(0xff2DA9E0)
          ),
          )
        ],
      ),
    ),
  );
}

Widget StatItems(Stats stats,context,LicenceProvider licenceController){
  return Directionality(
            textDirection: TextDirection.rtl,

    child: Padding(
      padding: const EdgeInsets.only(bottom:12.0),
      child: SizedBox(
        width: 90.w,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if(licenceController.currentUser.club!.id==null)
                InkWell(
                  onTap: (){
                    // GoRouter.of(context).go(Routes.ClubListScreen);
                  },
                  child: StatItem("النوادي",stats.clubs.toString(),"assets/icons/club-white.png")),
                InkWell(
                   onTap: (){
                    // GoRouter.of(context).go(Routes.AthleteLicenceListScreen);
                  },
                  child: StatItem("الرياضيين",stats.athletes.toString(),"assets/icons/running-white.png")),
                    InkWell(
                   onTap: (){
                    // GoRouter.of(context).go(Routes.CoachLicenceListScreen);
                  },
                  child: StatItem("المدربين",stats.coaches.toString(),"assets/icons/coach-white.png")),
                InkWell(
                   onTap: (){
                    // GoRouter.of(context).go(Routes.ArbitratorLicenceListScreen);
                  },
                  child: StatItem("الحكام",stats.arbitrators.toString(),"assets/icons/referee-white.png"))
                
              ],
            ),
            // Row(
            //    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
              
            //   ],
            // )
          ],
        ),
      ),
    ),
  );
}

Widget StatItem(txt,val,img){
  return Directionality(
            textDirection: TextDirection.rtl,

    child: Column(
      children: [
        Container(
          width: 18.w,
          height: 18.h,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 66, 144, 208),
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
             BoxShadow(color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 2))
          ]
          ),
          child: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(img,
              scale: 10,
              ),
              Text(val,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white
              ),
              ),
              Text(txt,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15
        ),
        )
            ],
          )),
        ),
        const SizedBox(height: 10,),
      ],
    ),
  );
}


Widget MyChart(Stats stats){
  //print('active '+stats.activeLicences.toString());
  //print('pending '+stats.pendingLicences.toString());
  //print('expired '+stats.expiredLicences.toString());
  return Directionality(
            textDirection: TextDirection.rtl,

    child: Padding(
      padding: const EdgeInsets.only(top:12.0),
      child: SizedBox(
        width: 90.w,
        height: 35.h,
        child: Column(
          children: [
            const SizedBox(height: 16,),
            Container
            (
              width: 90.w,
              height: 26.h,
              decoration: const BoxDecoration(color:  Color.fromARGB(255, 66, 144, 208),
              borderRadius: BorderRadius.all(Radius.circular(8)),
              boxShadow: [
                BoxShadow(color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 2)
                )
              ]
              ),
              child: Column(
                children: [
                   const Text("حالة الاجازات",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white
            ),
            ),
            SizedBox(height: 2.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyLegend(),
                      SizedBox(
                        width: 60.w,
              height: 3.h,
                        // child: PieChart(
                        // swapAnimationDuration: const Duration(milliseconds: 150), // Optional
                        // swapAnimationCurve: Curves.linear, // Optional
                        // PieChartData(
                        //   startDegreeOffset: 0,
                        //   centerSpaceRadius: 0,
                        //   sectionsSpace: 0,
                        //   sections: [
                        //     PieChartSectionData(
                        //       radius: 50,
                        //       badgeWidget: Badge(label: Text(stats.expiredLicences.toString(),
                        //       style: const TextStyle(fontSize: 14),
                        //       )),
                        //        badgePositionPercentageOffset: 1.3,
                        //       showTitle: false,
                        //     color: Colors.red,
                        //     value: (stats.expiredLicences!/100)*100,
                        //     title: stats.expiredLicences.toString(),
                        //   ),
                        //    PieChartSectionData(
                        //      badgeWidget: Badge(
                        //       backgroundColor: Colors.orange,
                        //       label: Text(stats.pendingLicences.toString(),
                        //       style: const TextStyle(fontSize: 14),
                        //       )),
                        //        badgePositionPercentageOffset: 1.3,
                        //       showTitle: false,
                        //                      radius: 50,
                        //     color: Colors.orange,
                        //     value: (stats.pendingLicences!/100)*100,
                        //     title: stats.pendingLicences.toString()
                        //   ), PieChartSectionData(
                        //     color: Colors.green,
                        //     value: (stats.activeLicences!/100)*100,                radius: 50,
                        //      badgeWidget: Badge(
                        //       backgroundColor: Colors.green,
                        //       label: Text(stats.activeLicences.toString(),
                        //       style: const TextStyle(fontSize: 14),
                        //       )),
                        //        badgePositionPercentageOffset: 1.3,
                        //       showTitle: false,
                        //     title: stats.activeLicences.toString()
                        //   ),
                        //   ]
                        // ),
                        //       ),
                      ),
                    ],
                  ),
                ],
              ),)
          ],
        ),
      ),
    ),
  );
}

Widget MyLegend(){
  return Directionality(
            textDirection: TextDirection.rtl,

    child: SizedBox(
      width: 30.w,
      height: 15.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [LegendItem("نشطة",Colors.green),
        LegendItem("في الانتظار",Colors.orange),
        LegendItem("منتهية",Colors.red)
        ],
      ),
    ),
  );
}

LegendItem(txt,color){
  return Directionality(
            textDirection: TextDirection.rtl,

    child: Padding(
      padding: const EdgeInsets.only(right:16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(color: color,
            borderRadius: const BorderRadius.all(Radius.circular(500))
            ),
          ),
      const SizedBox(width: 10,),
          Text(txt,
          style: const TextStyle(
            fontSize: 16,
              color: Colors.white
          ),
          )
        ],
      ),
    ),
  );
}
Widget RecentLicences(){
  return SizedBox(

    width: 90.w,
    height: 30.h,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("الاجازات الاخيرة",
        style: TextStyle(
          fontSize: 20
        ),
        ),
        const SizedBox(height: 10,),
        SizedBox( width: 90.w,
    height: 20.h,
          child: ListView(
            
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              RecentLicenceItem(),
              RecentLicenceItem(),
              RecentLicenceItem(),
              RecentLicenceItem(),
              RecentLicenceItem(),
            ],
          ),
        ),
      ],
    )
  );
}
Widget RecentLicenceItem(){
  return Padding(
    padding: const EdgeInsets.only(right:20.0,),
    child: Container(
      width: 50.w,
      height: 5.h,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        
        color: Colors.grey
      ),
    ),
  );
}

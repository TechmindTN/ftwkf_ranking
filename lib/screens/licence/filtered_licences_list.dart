import 'package:flutter/material.dart';
import 'package:mobile_ftwkf_ranking/controllers/licence_controller.dart';
import 'package:mobile_ftwkf_ranking/models/full_licence.dart';
import 'package:mobile_ftwkf_ranking/widgets/global/appbar.dart';
import 'package:mobile_ftwkf_ranking/widgets/licence/licence_widget.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class FilteredLicencesScreen extends StatefulWidget{
  const FilteredLicencesScreen({super.key});

  @override
  State<FilteredLicencesScreen> createState() => _FilteredLicencesScreenState();
}

class _FilteredLicencesScreenState extends State<FilteredLicencesScreen> {
  late LicenceProvider licenceController;
  TextEditingController numControl=TextEditingController();
  final GlobalKey<ScaffoldState> sKey=GlobalKey();
  @override
  void initState() {
    
    licenceController=Provider.of<LicenceProvider>(context,listen: false);
    licenceController.currentPage=0;
    // licenceController.getLicences();
    // licenceController.getParameters();
    // licenceController.initSelected();
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<LicenceProvider>(
      builder: (context,licenceController,child) {
        return Directionality(
                textDirection: TextDirection.rtl,

          child: Scaffold(
            key: sKey,
            appBar: MyAppBar("الاجازات المصفاة", context, false, licenceController, false,sKey,4,true),
            // appBar: AppBar(
            //   title: Text('Licences Filtree'),
            //   actions: [
            //     //  IconButton(onPressed: (){
            //     //   licenceController.showFilterDialog(context,numControl);
            //     //   // licenceController.showSearchDialog(context,numControl);
            //     // }, icon: Icon(Icons.filter_alt_sharp)),
            //     // IconButton(onPressed: (){
            //     //   licenceController.showSearchDialog(context,numControl);
            //     // }, icon: Icon(Icons.search)),
        
            //   ],
            // ),
            backgroundColor: const Color(0xfffafafa),
            body: (licenceController.fullLicences.isNotEmpty)?Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            // SizedBox(height: 2.h),
            // Text('aaaaaa'),
            //       Text('aaaaaa'),
            //       Text('aaaaaa'),
            //       Text('aaaaaa'),
            NotificationListener<ScrollNotification>(

              onNotification: (ScrollNotification scrollInfo){
                    // print(scrollInfo.metrics.pixels);
                    // scrollInfo.metrics.
                    if (scrollInfo.metrics.pixels ==
        scrollInfo.metrics.maxScrollExtent) {
          if(scrollInfo.metrics.axisDirection==AxisDirection.down){
          if(licenceController.lockScroll==false){
            licenceController.currentPage++;
            licenceController.filterNextLicences(context);
            licenceController.lockScroll=true;
          }
          }

    }
    return true;
                  },
              child: ListView(
                shrinkWrap: true,
                children: [
                //  Text('aaaa'),
                //  Text('aaaa'),
                //  Text('aaaa'),
                //  Text('aaaa'),
                //  Text('aaaa'), 
              for(FullLicence fullLicence in licenceController.fullLicences)
              Center(child: LicenceItem(fullLicence,licenceController,context)),
              ]
              ),
            ),
            ],
              ):SizedBox(
            height: 80.h,
            child: const Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text('قائمة السجلات فارغة الرجاء تعديل معايير التصفية'),),
            ],
            ),
              ),
            //  floatingActionButton: FloatingActionButton(onPressed: () {
            //   Navigator.push(context, MaterialPageRoute(builder: ((context) => SelectRoleScreen())));
            // },
            // child: Icon(Icons.add),
            // ),
            ),
        );
      }
    );

  }
}
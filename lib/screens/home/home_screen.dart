import 'package:flutter/material.dart';
import 'package:mobile_ftwkf_ranking/widgets/global/appbar.dart';
import 'package:mobile_ftwkf_ranking/widgets/home/home_widgets.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/licence_controller.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late LicenceProvider licenceController;
  @override
  void initState() {
    licenceController=Provider.of<LicenceProvider>(context,listen: false);
    // licenceController.login(context,login,);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
            textDirection: TextDirection.rtl,

      child: Consumer<LicenceProvider>(
        builder: (context,licenceController,child) {
          return Scaffold(
            backgroundColor: const Color(0xfffafafa),
            drawer: MyDrawer(licenceController,context),
            body: CustomScrollView(
              slivers: [
                MySliverAppBar(licenceController.currentUser.username,context,true,licenceController,false,false),
                // HomeCorps
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(height: 3.h,),
                      imageWidget(),
                      SeasonWidget(),
                      // StatItems(licenceController.stats,context,licenceController),
                      // MyChart(licenceController.stats,),
                      // RecentLicences()
                    ],
                  ),
                )
    
              ],
              // child: Container(child: Center(
              //   child: Text("Home Screen"),
              // )),
            ),
            // bottomNavigationBar: const BottomBarScreen(currentIndex: 2),
          );
        }
      ),
    );

  }
}
// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:mobile_ftwkf_ranking/screens/home/home_screen.dart';
import 'package:mobile_ftwkf_ranking/screens/licence/licence_list_screen.dart';
import 'package:mobile_ftwkf_ranking/screens/parameters/parameters_screen.dart';
import 'package:mobile_ftwkf_ranking/screens/profile/profile_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomBarScreen extends StatefulWidget{
  final int currentIndex;

  const BottomBarScreen({super.key, required this.currentIndex});
  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState(currentIndex);
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  final int currentIndex;
  late PersistentTabController _controller;

  _BottomBarScreenState(this.currentIndex);
  
List<Widget> _buildScreens() => [
        const ParametersScreen(),
        
        const ProfileScreen(
         
        ),
        const LicenceListScreen(
        
        ),
       
      ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
        
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.settings),
          title: "الاعدادات",
          activeColorPrimary: Colors.teal,
          inactiveColorPrimary: Colors.grey,
          // routeAndNavigatorSettings: const RouteAndNavigatorSettings(

          //   // initialRoute: "/",
          //   // routes: {
          //   //   "/first": (final context) =>  LicenceListScreen(),
          //   //   "/second": (final context) =>  SelectRoleScreen(),
          //   // },
          // ),
        ),
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.home),
            title: "الشاشة الرئيسية",
            activeColorPrimary: Colors.blue,
            inactiveColorPrimary: Colors.grey,
            inactiveColorSecondary: Colors.purple),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.list_alt),
          title: "الاجازات",
          activeColorPrimary: Colors.blueAccent,
          inactiveColorPrimary: Colors.grey,
          // routeAndNavigatorSettings: const RouteAndNavigatorSettings(
         
          // ),
        ),
      
      ];


@override
  void initState() {
    _controller = PersistentTabController(initialIndex: currentIndex);
    // 1);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
            textDirection: TextDirection.rtl,

      child: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: Colors.white, // Default is Colors.white.
          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
      ),
    );

  }
}
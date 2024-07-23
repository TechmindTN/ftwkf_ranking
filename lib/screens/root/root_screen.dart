import 'package:flutter/material.dart';
import 'package:mobile_ftwkf_ranking/screens/home/bottom_bar.dart';

class RootScreen extends StatelessWidget{
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomBarScreen(currentIndex: 1),
    );
  }
}
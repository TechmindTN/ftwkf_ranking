import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class StatCell extends StatelessWidget{
  final String txt;
  final bool isColored;

  const StatCell({super.key, required this.txt,  this.isColored=false});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: (isColored==true)?Colors.grey:Colors.white,
        border: Border.all(
          color: Colors.black,
          width: 1
        )
      ),
      width: 9.w,
      height: 3.h,
      child: Center(child: Text(txt)),);
    // TODO: implement build
    throw UnimplementedError();
  }

}


class CompareCell extends StatelessWidget{
  final String txt;
  final bool isColored;

  const CompareCell({super.key, required this.txt,  this.isColored=false});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: (isColored==true)?Colors.grey:Colors.white,
        border: Border.all(
          color: Colors.black,
          width: 1
        )
      ),
      width: 11.w,
      height: (isColored==true)?3.h:6.h,
      child: Center(child: Text(txt)),);
    // TODO: implement build
    throw UnimplementedError();
  }

}


class CompareCellImage extends StatelessWidget{
  final String txt;
  final bool isColored;

  const CompareCellImage({super.key, required this.txt,  this.isColored=false});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: (isColored==true)?Colors.grey:Colors.white,
        border: Border.all(
          color: Colors.black,
          width: 1
        )
      ),
      width: 11.w,
      height: (isColored==true)?3.h:6.h,
      child: Center(child: Image.network(txt)),);
    // TODO: implement build
    throw UnimplementedError();
  }

}


class PrimaryCompareCell extends StatelessWidget{
  final String txt;
  final bool isColored;

  const PrimaryCompareCell({super.key, required this.txt,  this.isColored=false});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: (isColored==true)?Colors.red:Colors.green,
        border: Border.all(
          color: Colors.black,
          width: 1
        )
      ),
      width: 11.w,
      height: 6.h,
      child: Center(child: Text(txt)),);
    // TODO: implement build
    throw UnimplementedError();
  }

}
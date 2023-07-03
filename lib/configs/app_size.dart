import 'package:flutter/material.dart';

class AppSize{
  static double Maxheight=double.maxFinite;
  static double Maxwidth=double.maxFinite;
  static double height(BuildContext context){
    return MediaQuery.of(context).size.height;
  }
  static double width(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
  static Widget SpaceHeight(int h){
    return SizedBox(height: h.toDouble(),);
  }
  static Widget SpaceWidth(int w){
    return SizedBox(width: w.toDouble(),);
  }
  static double fem(BuildContext context){
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return fem;
  }
  static double ffem(BuildContext context){
    double ffem = fem(context) * 0.97;
    return ffem;
  }

  static EdgeInsets paddingScreen=const EdgeInsets.only(left: 20,right: 20);

  //Text Size
  static TextTheme theme(BuildContext context){
    return Theme.of(context).textTheme;
  }
}
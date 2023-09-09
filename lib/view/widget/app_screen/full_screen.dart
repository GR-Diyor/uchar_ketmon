import 'package:flutter/material.dart';
import 'package:uchar_ketmon/configs/app_color.dart';
import 'package:uchar_ketmon/configs/app_size.dart';


Widget fullScreen(BuildContext context,Widget child)=>Scaffold(
  resizeToAvoidBottomInset: false,
  extendBodyBehindAppBar: true,
  backgroundColor: AppColor.primary,
  body: SizedBox(
    height: AppSize.height(context),
    width: AppSize.width(context),
    child: child,
  ),
);





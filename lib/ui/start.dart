import 'package:flutter/material.dart';
import 'package:uchar_ketmon/configs/app_color.dart';
import 'package:uchar_ketmon/ui/home.dart';
import 'package:uchar_ketmon/view/widget/app_screen/full_screen.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);
  static const String id = "Start";

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return fullScreen(context, Center(child: MaterialButton(
      color: AppColor.blue,
      onPressed: (){
        Navigator.pushNamed(context, Home.id);
      },
      child:  Text("Start",style: TextStyle(color: AppColor.primary,fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize)),
    ),));
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:uchar_ketmon/configs/app_color.dart';
import 'package:uchar_ketmon/ui/home.dart';
import 'package:uchar_ketmon/view/widget/app_screen/full_screen.dart';
import 'package:uchar_ketmon/configs/app_size.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);
  static const String id = "Start";

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {

  Color button = Colors.green;
  int counter = 1;
  late Timer timer;

  changeColor() {
    timer = Timer.periodic(
        const Duration(seconds: 1), (Timer timer) {
      print(timer.tick);
      setState(() {
        if (timer.tick % 2 == 0) {
          button = Colors.blueAccent;
        } else {
          button = Colors.green;
        }
      });
    });
  }

  @override
  void initState() {
    changeColor();
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   changeColor();
  //   super.didChangeDependencies();
  // }
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  about(BuildContext context) {
    showModalBottomSheet(context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 0.0,
        isDismissible: true,
        isScrollControlled: false,

        builder: (BuildContext context) =>
        Container(
        height: (MediaQuery.of(context).size.height - 50),
    decoration: const BoxDecoration(
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(16), topRight: Radius.circular(16)),
    color: Color(0xFFFBFAFF),
    ),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
    const SizedBox(height: 16),
    Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
    const SizedBox(width: 16),
    GestureDetector(
    child: Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12.0),
    color: Colors.white,
    boxShadow: const [
    BoxShadow(
    color: Color(0x145A5A5A),
    blurRadius: 20.0,
    spreadRadius: 3.0,
    offset: Offset(
    2.0, 3.0), // shadow direction: bottom right
    )
    ]),
    child: Icon(Icons.cancel,color: button,size: 30,),
    ),
    onTap: () => Navigator.pop(context),
    ),

        ]),

      // info


      Card(
          elevation: 0,
          borderOnForeground: true,
          margin: const EdgeInsets.only(left: 16.0,right: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Ilova Nizomiddinov Diyorbek tomonidan qo'llab quvvatlanadi", style: TextStyle(color: AppColor.textPrimary, fontSize: Theme
                    .of(context)
                    .textTheme
                    .bodyLarge!
                    .fontSize)),
              ]
          )
      ),
    ]),
  ),);
  }

  @override
  Widget build(BuildContext context) {
    return fullScreen(context, Stack(
      children: [
        Lottie.asset("assets/lotties/home2.json",
            animate: true,
            reverse: false,
            repeat: true,
            options: LottieOptions(enableMergePaths: true),
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
            height: AppSize.height(context),
            width: AppSize.width(context)),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Start button
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, Home.id);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 1000),
                  height: 50,
                  width: 140,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: button,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text("Boshlash",
                      style: TextStyle(color: AppColor.primary, fontSize: Theme
                          .of(context)
                          .textTheme
                          .bodyMedium!
                          .fontSize)),
                ),
              ),
              //gap
              const SizedBox(height: 15,),

              //options button

              GestureDetector(
                onTap: ()=>about(context),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 1000),
                  height: 50,
                  width: 140,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: button,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text("Sozlamalar",
                      style: TextStyle(color: AppColor.primary, fontSize: Theme
                          .of(context)
                          .textTheme
                          .bodyMedium!
                          .fontSize)),
                ),
              ),

              //gap
              const SizedBox(height: 15,),

              //about

              GestureDetector(
                onTap: () => about(context),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 1000),
                  height: 50,
                  width: 140,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: button,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text("Dastur haqida",
                      style: TextStyle(color: AppColor.primary, fontSize: Theme
                          .of(context)
                          .textTheme
                          .bodyMedium!
                          .fontSize),),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

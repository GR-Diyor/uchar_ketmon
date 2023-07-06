import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uchar_ketmon/configs/app_color.dart';
import 'package:uchar_ketmon/ui/start.dart';
import 'package:uchar_ketmon/utills/prefs.dart';
import 'package:uchar_ketmon/view/widget/app_screen/full_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const String id = "Home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState()  {
    // highscore = int.tryParse(DB().getData().toString())!;
    super.initState();
  }
  static double yAxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = yAxis;
  bool gamehasStarted = false;
 static double barrierX = 0;
  double barrierY = barrierX+2;
  int score = 0;
  int highscore = 0;
  int counter =0;

  jump() {
    setState(() {
      time = 0;
      initialHeight = yAxis;
    });
  }
  _showdialog(){
    showCupertinoDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        backgroundColor: AppColor.brown,
        title: Text("GAME OVER",style: TextStyle(color: AppColor.primary),),
        content: Text("Score: $score",style: TextStyle(color: AppColor.primary),),
        actions: [
          TextButton(onPressed: (){
            setState(() {
              if(score>highscore){
                highscore =score;
                // DB().setData(highscore);
              }
              gamehasStarted = false;
            });
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, Start.id);
          }, child: Text("Play again",style: TextStyle(color: AppColor.primary),)),
        ],
      );
    });
  }
  start() {
    gamehasStarted = true;
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      counter++;
      time += 0.05;
      height = -4.9 * time * time + 2.8 * time;

      setState(() {
        if(barrierX<-2){
          barrierX+=3.5;
        }else{
          barrierX-=0.05;
        }
      });
      setState(() {
        if(barrierY<-2){
          barrierY+=3.5;
        }else{
          barrierY-=0.05;
        }
      });
      setState(() {
        yAxis = initialHeight - height;
      });
      if (yAxis > 1) {
        setState(() {
          score=counter;
          _showdialog();
          timer.cancel();
          gamehasStarted = false;
        });
      }
    });
  }

  Widget Barier({required double x,required double y,required double h}){
    return AnimatedContainer(
      alignment: Alignment(x,y),
      duration: const Duration(milliseconds: 0),
      child: Container(
        height: h,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (gamehasStarted) {
          jump();
        } else {
          start();
        }
      },
      child: fullScreen(
          context,
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    AnimatedContainer(
                      color: AppColor.blue,
                      alignment: Alignment(0, yAxis),
                      duration: const Duration(milliseconds: 0),
                      child: const FlutterLogo(
                        size: 40,
                      ),
                    ),

                    Container(
                      alignment: const Alignment(0,-0.2),
                      child:  gamehasStarted?Text("",style: TextStyle(fontSize: 20,color: AppColor.green.withOpacity(0.6)),): Text(score==0?"Tab to play":"",style: TextStyle(color: AppColor.primary),),
                    ),
                    Barier(x: barrierX , y: 1.1,h:200),
                    Barier(x: barrierY , y: -1.1,h:150),
                    Barier(x: barrierX , y: 1.1,h:250),
                    Barier(x: barrierY , y: -1.1,h: 100),
                  ],
                ),
              ),
              Container(
                color: AppColor.green,
                height: 15,
              ),
              Expanded(
                  child: Container(
                color: AppColor.brown,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            Text("Score",style: TextStyle(fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize),),
                            Text("$counter")
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            Text("Best",style: TextStyle(fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize)),
                            Text("$highscore")
                          ],
                        )
                      ],
                    ),
              ))
            ],
          )),
    );
  }
}

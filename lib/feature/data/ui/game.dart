import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:uchar_ketmon/feature/data/cubit/game_cubit.dart';
import 'package:uchar_ketmon/feature/data/cubit/game_state.dart';

import '../../../core/configs/app_color.dart';
import '../../../core/configs/app_size.dart';
import '../../../core/utills/prefs.dart';
import '../widget/app_screen/full_screen.dart';
import 'home.dart';


class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);
  static const String id = "Home";

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _myAnimation;
  Timer? Globaltime;

  @override
  void initState() {

    super.initState();
    setState(() {
      highscore = DB().getData();
    });
    print("Score database : ${DB().getData()}");
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _myAnimation = Tween<double>(begin: 90, end: 120)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceIn));
    _controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _controller.repeat();
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  static double yAxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = yAxis;
  bool gamehasStarted = false;
  static double barrierX = 2;
  double barrierY = barrierX + 2;
  int score = 0;
  int highscore = 0;
  int counter = 0;

  jump() {
    setState(() {
      time = 0;
      initialHeight = yAxis;
    });
  }

  _showdialog() {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 15.0,sigmaX: 15.0),
              child: AlertDialog(
                backgroundColor: AppColor.primary.withOpacity(0.1),
                alignment: Alignment.center,
                title: Text(
                  "O'yin tugadi",
                  style: TextStyle(color: AppColor.primary,fontSize: AppSize.theme(context).titleMedium!.fontSize),
                  textAlign: TextAlign.center,
                ),
                content: Text(
                  "Natija: $score",
                  style: TextStyle(color: AppColor.primary,fontSize: AppSize.theme(context).bodySmall!.fontSize),
                  textAlign: TextAlign.center,
                ),
                actions: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          if (score > highscore) {
                            highscore = score;
                            DB().setData(highscore);
                          }
                          gamehasStarted = false;
                          yAxis=0;
                          barrierX=2;
                        });
                       // Navigator.pop(context,const Start());
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>const Home()));
                      },
                      child: Text(
                        "chiqish",
                        style: TextStyle(color: AppColor.primary,fontSize: AppSize.theme(context).bodyMedium!.fontSize),
                      )),
                ],
              ),
            ),
          );
        });
  }

  start() {
    gamehasStarted = true;
   Globaltime= Timer.periodic(const Duration(milliseconds: 70), (timer) {
      counter++;
      time += 0.04;
      height = -4.9 * time * time + 2.5 * time;

      setState(() {
        if (barrierX < -2) {
          barrierX += 3.5;
        } else {
          barrierX -= 0.05;
        }
      });
      setState(() {
        if (barrierY < -2) {
          barrierY += 3.5;
        } else {
          barrierY -= 0.05;
        }
      });
      setState(() {
        yAxis = initialHeight - height;
      });
      if (yAxis > 1.0 || yAxis<-1.1) {
        setState(() {
          yAxis=1.0;
          timer.cancel();
          gamehasStarted = false;
          score = counter;
          Future.delayed(const Duration(milliseconds: 400),(){  _showdialog();});
        });
      }
      if((barrierX<=0.1&&barrierX>=-0.1&&yAxis>0.2)||(barrierY<=0.1&&barrierY>=-0.1&&yAxis<-0.2)){
        setState(() {
        //  yAxis=1.0;
          timer.cancel();
          gamehasStarted = false;
          score = counter;
           Future.delayed(const Duration(milliseconds: 300),(){  _showdialog();});
        });
      }
    });
  }

  Widget Barier({required double x, required double y, required double h}) {
    return AnimatedContainer(
      alignment: Alignment(x, y),
      duration: const Duration(milliseconds: 0),
      child: Container(
        height: h,
        width: 60,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>GameCubit(),
      child: BlocBuilder<GameCubit,GameState>(
        builder: (BuildContext context,GameState state) {
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
                Stack(
                  children: [
                    Lottie.asset("assets/lotties/home.json",
                        animate: true,
                        reverse: false,
                        repeat: true,
                        options: LottieOptions(enableMergePaths: true),
                        fit: BoxFit.fill,
                        filterQuality: FilterQuality.high,
                        height: AppSize.height(context),
                        width: AppSize.width(context)),
                    Column(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Stack(
                            children: [
                              AnimatedContainer(
                                color: AppColor.transparent,
                                alignment: Alignment(0, yAxis),
                                duration: const Duration(milliseconds: 0),
                                child: Image.asset(
                                  "assets/images/logo2.png",
                                  height: 40,
                                  width: 40,
                                ),
                              ),

                              Barier(x: barrierX, y: 1.1, h: 250),
                              Barier(x: barrierY, y: -1.1, h: 250),
                              // Barier(x: barrierX , y: 1.1,h:250),
                              // Barier(x: barrierY , y: -1.1,h: 100),
                              Container(
                                alignment: const Alignment(0, 0.2),
                                child: gamehasStarted
                                    ? Text(
                                        "",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: AppColor.green.withOpacity(0.6)),
                                      )
                                    : counter == 0
                                        ? AnimatedBuilder(
                                            animation: _myAnimation,
                                            builder: (ctx, ch) => SizedBox(
                                              width: _myAnimation.value,
                                              height: _myAnimation.value,
                                              child: Image.asset(
                                                  "assets/images/touch.png"),
                                            ),
                                          )
                                        : const SizedBox.shrink(),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: AppColor.green,
                          height: 15,
                        ),
                        Expanded(
                            // flex: 2,
                            child: Container(
                          color: AppColor.brown,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Score",
                                    style: TextStyle(color: AppColor.primary,
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .fontSize),
                                  ),
                                  Text("$counter", style: TextStyle(color: AppColor.primary,
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .fontSize),)
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Best",
                                      style: TextStyle(color: AppColor.primary,
                                          fontSize: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .fontSize)),
                                  Text("$highscore", style: TextStyle(color: AppColor.primary,
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .fontSize),)
                                ],
                              )
                            ],
                          ),
                        ))
                      ],
                    ),
                  ],
                )),
          );
        }
      ),
    );
  }
}

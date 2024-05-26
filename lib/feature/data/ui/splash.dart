import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:uchar_ketmon/core/configs/app_string.dart';
import 'package:uchar_ketmon/feature/data/cubit/splash_state.dart';


import '../../../core/configs/app_color.dart';
import '../cubit/splash_cubit.dart';
import '../widget/app_screen/full_screen.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  static String id="Splash";

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  var splashCubit = SplashCubit();
@override
  void initState() {
  splashCubit = BlocProvider.of(context);
  splashCubit.splashTime();
    //splashTime();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> splashCubit,
      child: BlocBuilder<SplashCubit,SplashState>(
        builder: (BuildContext context,SplashState state) {
          if(state is SplashLoaded){

            splashCubit.navigatePage(context);
          }

          return fullScreen(context,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                width: double.maxFinite,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        ClipPath(
                          clipper: WaveClipperTwo(flip: true,reverse: true),
                          child: Container(
                            height: 100,
                            width: double.maxFinite,
                            color: AppColor.blue,
                          ),
                        ),
                        ClipPath(
                          clipper: WaveClipperTwo(),
                          child: Container(
                            height: 100,
                            width: double.maxFinite,
                            color: AppColor.blue,
                          ),
                        )
                      ],
                    ),

                    Container(
                      height: 200,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: ClipPath(
                        clipper: OctagonalClipper(),
                        child: Center(
                          child: Text("Uchar ketmon",style: TextStyle(
                            color: AppColor.primary,
                            fontSize: 30,
                            fontFamily: AppString.fontRegular,
                          ),),
                        ),
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
          );
        }
      ),
    );
  }
}

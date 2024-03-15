import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uchar_ketmon/feature/data/cubit/splash_state.dart';


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
          const Center(
            child: Text("Super ketmon",style: TextStyle(
              color: Colors.cyanAccent,
              fontSize: 30,
            ),),
          ),
          );
        }
      ),
    );
  }
}

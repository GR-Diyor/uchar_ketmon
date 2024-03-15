import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uchar_ketmon/feature/data/cubit/splash_state.dart';

import '../ui/home.dart';

class SplashCubit extends Cubit<SplashState>{
  SplashCubit(): super(SplashInit());




  void splashTime(){
    emit(SplashLoading());
    Future.delayed(const Duration(milliseconds: 1300),(){
      emit(SplashLoaded());

    });
  }
   void navigatePage(BuildContext context){
     SchedulerBinding.instance.addPostFrameCallback((_) {
       Navigator.pushReplacementNamed(context, Home.id);
     });
   }
}
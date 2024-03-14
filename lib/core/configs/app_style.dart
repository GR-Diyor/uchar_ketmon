import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import '../utills/prefs.dart';
import 'app_color.dart';


class AppStyle{

  static Future<void>init()async {
    WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
     DB.box = await Hive.openBox('myBox');
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    fullScreen();
  }
  static Future<void>fullScreen()async{
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky, overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);
  }
  static Future<void>manualScreen()async{
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);
  }

  //AppBar

  static SystemUiOverlayStyle defaultUIOverlay = SystemUiOverlayStyle.light;


  //style of bottombar and statusbar
  static SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: AppColor.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemStatusBarContrastEnforced: false,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: AppColor.transparent,
    systemNavigationBarDividerColor: AppColor.transparent,
    systemNavigationBarContrastEnforced: false,
  );

}
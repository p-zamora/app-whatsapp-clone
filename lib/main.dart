import 'dart:io';
import 'dart:ui';

import 'package:app_clone_whatsapp/views/pages/camera_page.dart';
import 'package:app_clone_whatsapp/views/pages/home_page.dart';
import 'package:app_clone_whatsapp/views/theme/pallete.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
/*   WidgetsFlutterBinding.ensureInitialized();
  await dependency.init();
  runApp(const MyApp()); */

  try {
    DartPluginRegistrant.ensureInitialized();
    WidgetsFlutterBinding.ensureInitialized();
    if(Platform.isAndroid){
      cameras = await availableCameras();
      if (kDebugMode) {
        print(cameras[0]);
      }
    }    
  } on CameraException catch (e) {
    if (kDebugMode) {
      print('Error in fetching the cameras: $e');
    }
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'OpenSans',
          primaryColor: primaryColor,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: secundaryColor),
          scaffoldBackgroundColor: white,
          appBarTheme: const AppBarTheme(
              backgroundColor: secundaryColor,
              iconTheme: IconThemeData(
                color: white,
              ))),
      home: const HomePage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_manage/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Money Manage',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}




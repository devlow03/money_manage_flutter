import 'package:flutter/material.dart';
import 'screens/trasaction/trasaction_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Manage',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}




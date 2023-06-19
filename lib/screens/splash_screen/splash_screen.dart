import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:money_manage/index_screen.dart';
import 'package:money_manage/screens/start/start_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? id;
  late Box userBox;
  
  String? userName;

  @override

  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () async {
      userBox = Hive.box('users');
      userName = userBox.get('name');

      if (userName != null) {
        return Get.offAll(IndexScreen());
      }
      return Get.offAll( const StartScreen());
    });
  }



  load() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Lottie.asset("assets/money.json"),
              const SizedBox(
                height: 140,
              ),
              const Center(
                child: Text(
                  'Giải pháp đơn giản cho\nngân sách của bạn.',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.5),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Center(
                child: Text(
                  'Truy cập và phân phối thu nhập một cách\nchính xác....',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 90),
              //   child: ElevatedButton(
              //     onPressed: () async {

              //     },
              //     style: ElevatedButton.styleFrom(primary: Colors.black),
              //     child: const Padding(
              //       padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              //       child: Text(
              //         'Bắt đầu',
              //         style: TextStyle(fontSize: 16, letterSpacing: 1),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 30,
              // ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_manage/screens/home/home_screen.dart';
import 'package:lottie/lottie.dart';

import '../../index_screen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: ListView(
        children: [
          Column(

            
            children: [
            const SizedBox(height: 5,),
            Lottie.asset("assets/money.json"),
            

            const SizedBox(height: 140,),
            const Center(
              child: Text('Giải pháp đơn giản cho\nngân sách của bạn.',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.5
              ),
              ),
            ),

            const SizedBox(height: 20,),
            const Center(
              child: Text('Truy cập và phân phối thu nhập một cách\nchính xác....',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                letterSpacing: 1
              ),
              ),
            ),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90),
              child: ElevatedButton(
                onPressed: (){
                  Get.offAll( IndexScreen());
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black
                ), 
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical:12,horizontal: 20),
                  child: Text('Bắt đầu',style: TextStyle(fontSize: 16,letterSpacing: 1),
                  
                  ),

                ),
                
                
                ),
            ),
            SizedBox(height: 30,),

            


              
            ],
          ),
        ],
      ),
    );
  }
}
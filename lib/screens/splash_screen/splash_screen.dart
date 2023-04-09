import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_manage/screens/home/home_screen.dart';

import '../../index_screen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        const SizedBox(height: 5,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.5),
          child: Image.asset("assets/splash_screen.png",
          
          fit: BoxFit.cover,),
        ),

        const SizedBox(height: 140,),
        const Center(
          child: Text('Simple solution for\nyour budget.',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5
          ),
          ),
        ),

        const SizedBox(height: 20,),
        const Center(
          child: Text('Counter and distribute the income\ncorrectly....',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 1
          ),
          ),
        ),
        const SizedBox(height: 20,),
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
              padding: EdgeInsets.symmetric(vertical:12),
              child: Text('Continue',style: TextStyle(fontSize: 16,letterSpacing: 1),
              
              ),

            ),
            
            
            ),
        )

        


          
        ],
      ),
    );
  }
}
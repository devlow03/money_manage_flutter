import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:money_manage/logic/Trasaction.dart';
import 'package:money_manage/screens/start/start_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScren extends StatefulWidget {
  const ProfileScren({Key? key}) : super(key: key);
  
  @override
  State<ProfileScren> createState() => _ProfileScrenState();
}

class _ProfileScrenState extends State<ProfileScren> {
  late Box userbox;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:TextButton(
          child: Text('Xóa tất cả dữ liệu'),
          onPressed: (){
             Trasaction.instance.deleteAll().then((value){
              Get.offAll(StartScreen());
              print("xóa thành công");
             });
          },
        )
      )

    );
  }
}
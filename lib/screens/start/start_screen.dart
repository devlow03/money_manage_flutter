import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:money_manage/boxes.dart';
import 'package:money_manage/index_screen.dart';
import 'package:money_manage/logic/Trasaction.dart';
import 'package:money_manage/screens/add_trasaction/add_screen.dart';
import 'package:money_manage/screens/splash_screen/splash_screen.dart';
import 'package:money_manage/screens/start/list_user.dart';

import 'package:shared_preferences/shared_preferences.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  TextEditingController nameControl = TextEditingController();
  // TextEditingController passControl = TextEditingController();
  TextEditingController budgetControl = TextEditingController();
  late Box userBox;
  String? price;

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SvgPicture.asset(
                    'assets/setup.svg',
                    height: MediaQuery.of(context).size.height * .3,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  const Text(
                    "Thông Tin Của Bạn",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .9,
                    child: Form(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nameControl,
                            onSaved: (value) {},
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              filled: true,
                              fillColor: Colors.grey.shade100,
                              hintText: 'Tên của bạn',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                              ),
                            ),
                          ),
                          
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: budgetControl,
                            onChanged: ((newValue) {
                              try {
                                if (budgetControl.text != null) {
                                  setState(() {
                                    price = NumberFormat.simpleCurrency(
                                            locale: 'vi')
                                        .format(double.parse(
                                            budgetControl.text.toString()));
                                  });
                                }
                              } catch (e) {
                                setState(() {
                                  price = null;
                                });
                                print(e);
                              }
                            }),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.money),
                              filled: true,
                              fillColor: Colors.grey.shade100,
                              hintText: 'Ngân sách hiện có',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Visibility(
                            visible: price!=null,
                            replacement: Center(),
                            child: Container(
                              // width: MediaQuery.of(context).size.width * 0.95,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey.shade300),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Center(
                                  child: 
                                    Text(
                                          'Ngân sách: ${price.toString()}',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 1.5),
                                        )
                                      
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 90),
                            child: ElevatedButton(
                              onPressed: () async {
                               setState(() {
                                  userBox = Hive.box('info');
                                userBox.putAll({
                                  'name': nameControl.text,
                                  'budget': budgetControl.text
                                }).then((value) {
                                  Get.offAll(IndexScreen());
                                  Get.to(AddScreen());
                                  Get.offAll(SplashScreen());  
                                   Get.offAll(IndexScreen());                              });
                               });
                                //      userData.instance.addUser(nameControl.text, double.parse(budgetControl.text)).then((value){
                                //   print("tạo user thành công");
                                //   Get.to(ListUser());

                                //  });
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.black),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 20),
                                child: Text(
                                  'Tiếp tục',
                                  style:
                                      TextStyle(fontSize: 16, letterSpacing: 1),
                                ),
                              ),
                            ),
                          ),
                        
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

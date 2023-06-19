import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:money_manage/index_screen.dart';
import 'package:money_manage/logic/Trasaction.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddScreen extends StatefulWidget {
  final String? id;
  const AddScreen({Key? key, this.id}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final items = [
    'Chọn danh mục',
    'Đồ ăn',
    'Nước uống',
    'Xăng dầu',
    'Quần áo',
    'Dụng cụ cá nhân',
    'Cho thuê',
    'Được tặng',
    'Tiền lương',
    'Trúng thưởng',
    'Khác'
  ];
  TextEditingController priceControl = TextEditingController();
  TextEditingController desControl = TextEditingController();
  late Box userBox;
  String? category;
  
  double? budget;
  @override
  void initState() {
    super.initState();
    getUser();
  }

  getUser() async {
    setState(() {
      userBox = Hive.box('users');
    
    budget = userBox.get('budget');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffC0DBEA),
      appBar: AppBar(
        // elevation: 0,
        backgroundColor: const Color(0xffC0DBEA),
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: const Text(
          "Tạo mới",
          style: TextStyle(color: Colors.black, letterSpacing: 1),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            //  width: double.infinity,
            // height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/background.jpg"),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "NGÂN SÁCH HIỆN TẠI",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        NumberFormat.simpleCurrency(locale: 'vi')
                            .format(double.parse(budget.toString())),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent),
                        child: Column(
                          children: [
                            DropdownButtonFormField<String>(
                              dropdownColor: Colors.white,
                              focusColor: Colors.grey.shade300,
                              decoration: InputDecoration(
                                  hintStyle:
                                  const TextStyle(color: Colors.black),
                                  // contentPadding: const EdgeInsets.all(8),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade300,
                                          width: 1)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade300, width: 1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade300, width: 1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                  fillColor: const Color(0xffF5EBEB)),
                              elevation: 1,
                              hint: const Text('Chọn danh mục'),
                              items: items.map((value) {
                                return DropdownMenuItem<String>(
                                    onTap: () {}, child: Text(value),
                                    value: value,
                                );
                              }).toList(),

                              onChanged: (value) {
                                category = value;
                              },
                              
                              menuMaxHeight:
                              MediaQuery.of(context).size.height * .9,
                              isDense: true,
                              // value: cityCode!=null?cityCode:cityChosse,
                              isExpanded: true,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: priceControl,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xffF5EBEB),
                                  hintText: 'Nhập giá tiền',
                                  hintStyle:
                                  const TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade300)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade300)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade300))),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: desControl,
                              maxLines: 6,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xffF5EBEB),
                                  hintText: 'Mô tả chi tiết',
                                  hintStyle:
                                  const TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade300)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade300)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade300))),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                Trasaction.instance.addTrasacsion(
                                  category.toString(),
                                   double.parse(priceControl.text),
                                   'Thu nhập'
                                   ).then((value){
                                    userBox = Hive.box('users');
                                      double cong = double.parse(budget.toString()) + double.parse(priceControl.text.toString());
                                      userBox.put('budget', cong).then((value){
                                       Get.offAll(IndexScreen());
                                        // print(userBox.get('budget'));
                                      });
                                   });
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                child: Text(
                                  "Thu nhập",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  primary: const Color(0xff4F709C)),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                Trasaction.instance.addTrasacsion(
                                  category.toString(),
                                   double.parse(priceControl.text),
                                   'Chi phí'
                                   ).then((value){
                                      userBox = Hive.box('users');
                                      double tru = double.parse(budget.toString()) - double.parse(priceControl.text.toString());
                                      userBox.put('budget', tru).then((value){
                                        Get.offAll(IndexScreen());
                                      });
                                     
                                   });
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                child: Text(
                                  "Chi phí",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 1),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  primary: const Color(0xffD5B4B4)),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

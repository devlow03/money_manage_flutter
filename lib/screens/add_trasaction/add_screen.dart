import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final items = [
    'Chọn danh mục',
    'Đồ ăn',
    'Nước uống',
    'Xăng dầu',
    'Đồ cá nhân'
  ];
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
                  child: Container(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "SỐ DƯ TÀI KHOẢN",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          NumberFormat.simpleCurrency(locale: 'vi')
                              .format(200000000),
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
                                          color: Colors.grey.shade300,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade300,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    fillColor: const Color(0xffF5EBEB)),
                                elevation: 1,
                                hint: const Text('Chọn danh mục'),
                                items: items.map((e) {
                                  return DropdownMenuItem<String>(
                                      value: e, onTap: () {}, child: Text(e));
                                }).toList(),

                                onChanged: (newValue) {
                                  setState(() {});
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
                                maxLines: 6,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color(0xffF5EBEB),
                                    hintText: 'Nhập chi tiết',
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
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {},
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    primary: const Color(0xff4F709C)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {},
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    primary: const Color(0xffD5B4B4)),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

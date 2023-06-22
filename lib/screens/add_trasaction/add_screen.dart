import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
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
    'Mua xe',
    'Vay mượn',
    'Trả nợ',
    'Đi chơi',
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
  String? price;
  double? budget;
  @override
  void initState() {
    super.initState();
    getUser();
  }

  getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      budget = prefs.getDouble('budget');
    });

    // setState(() {
    //   budget = double.parse(userBox.get('budget').toString());
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffC0DBEA),
      // backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade100,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: const Text(
          "Thêm mới",
          style: TextStyle(color: Colors.black, letterSpacing: 1),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
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
                            .format(budget ?? 0),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30)),
                              color: Colors.transparent),
                          child: Column(
                            children: [
                              DropdownButtonFormField<String>(
                                // dropdownColor: Colors.white,
                                // focusColor: Colors.grey.shade100,
                                decoration: InputDecoration(
                                    hintStyle:
                                        const TextStyle(color: Colors.black),
                                    // contentPadding: const EdgeInsets.all(8),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 1)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white),
                                elevation: 1,
                                hint: const Text('Chọn danh mục'),
                                items: items.map((value) {
                                  return DropdownMenuItem<String>(
                                    onTap: () {},
                                    child: Text(value),
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
                                height: 20,
                              ),
                              TextFormField(
                                // inputFormatters: [CurrencyTextInputFormatter(

                                onChanged: ((newValue) {
                                  try {
                                    if (priceControl.text != null) {
                                      setState(() {
                                        price = NumberFormat.simpleCurrency(
                                                locale: 'vi')
                                            .format(double.parse(
                                                priceControl.text.toString()));
                                      });
                                    }
                                  } catch (e) {
                                    setState(() {
                                      price = null;
                                    });
                                  }
                                }),
                                keyboardType: TextInputType.number,
                                controller: priceControl,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Nhập giá tiền',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.black))),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Visibility(
                                visible: price != null,
                                replacement: Center(),
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.95,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white),
                                      child: Center(
                                        child: Text(
                                          'Giá tiền: ${price.toString()}',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 1.5),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                              TextFormField(
                                controller: desControl,
                                maxLines: 4,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Mô tả chi tiết',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.black))),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                
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
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                Trasaction.instance
                                    .addTrasacsion(category.toString(),
                                        priceControl.text, 'Chi phí')
                                    .then((value) {
                                  userBox = Hive.box('info');
                                  double tru = double.parse(budget.toString()) -
                                      double.parse(
                                          priceControl.text.toString());
                                  userBox.put('budget', tru).then((value) {
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
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

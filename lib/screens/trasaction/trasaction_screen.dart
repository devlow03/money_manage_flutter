import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:money_manage/boxes.dart';
import 'package:money_manage/model/negotiate.dart';

class TrasactionScreen extends StatelessWidget {
  const TrasactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color(0xffC0DBEA),
      body: ListView(
        children: [
          const SizedBox(height: 30,),
          Padding(
             padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
            child: Column(
              children: [
                Text(
                  'Lịch sử giao dịch',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30,),
                ValueListenableBuilder<Box<Negotiate>>(
                    valueListenable: Boxes.getNegotiate().listenable(),
                    builder: (context, box, _) {
                      var data = box.values.toList().cast<Negotiate>();
                      return ListView.separated(
                        itemCount: data.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                              width: MediaQuery.of(context).size.width * 0.95,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(data[index].category),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    NumberFormat.simpleCurrency(locale: 'vi')
                                        .format(double.parse(data[index].price)),
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    data[index].type.toString(),
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff767474),
                                    ),
                                  )
                                ],
                              ));
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:money_manage/boxes.dart';
import 'package:money_manage/model/negotiate.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.id}) : super(key: key);
  final String? id;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Box userBox;

  String? userName;
  double? budget;
  String? day;
  String? month;
  String? year;
  @override
  void initState() {
    super.initState();
    getUser();
  }

  getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      userBox = Hive.box('info');
      userName = userBox.get('name');
      budget = double.parse(userBox.get('budget').toString());
      prefs.setDouble('budget', budget ?? 0);
      var dt = DateTime.now();
      day = dt.day.toString();
      month = dt.month.toString();
      year = dt.year.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.shade200,
      backgroundColor: const Color(0xffC0DBEA),

      body: RefreshIndicator(
        onRefresh: () async {},
        child: ListView(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            DateFormat.yMMMMEEEEd().format(DateTime.now()),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                child: Image.asset(
                                  "assets/man.png",
                                  color: Colors.transparent,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  // snapshot.data?.first.name.toString()??'',
                                  userName ?? '',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: 1,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
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
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.47,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color(0xff4F709C),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 40, horizontal: 50),
                          child: Column(
                            children: [
                              const Text(
                                "Thu nhập",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                NumberFormat.simpleCurrency(locale: 'vi')
                                    .format(2000000),
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    // letterSpacing: 1,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.47,
                          padding: const EdgeInsets.symmetric(
                              vertical: 40, horizontal: 50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color(0xffD5B4B4),
                          ),
                          child: Column(
                            children: [
                              const Text(
                                "Chi phí",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                NumberFormat.simpleCurrency(locale: 'vi')
                                    .format(10000),
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: const Text(
                              'Giao dịch gần đây',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ValueListenableBuilder<Box<Negotiate>>(
                              valueListenable:
                                  Boxes.getNegotiate().listenable(),
                              builder: (context, box, _) {
                                var data =
                                    box.values.toList().cast<Negotiate>();
                                return ListView.separated(
                                  itemCount: data.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.95,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 30, horizontal: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(data[index].category),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              NumberFormat.simpleCurrency(
                                                      locale: 'vi')
                                                  .format(double.parse(
                                                      data[index].price)),
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
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const SizedBox(
                                      height: 10,
                                    );
                                  },
                                );
                              })
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:money_manage/screens/add_trasaction/add_screen.dart';
import 'package:money_manage/screens/home/home_screen.dart';
import 'package:money_manage/screens/profile/profile_screen.dart';
import 'package:money_manage/screens/statics/statics_screen.dart';
import 'package:money_manage/screens/trasaction/trasaction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IndexScreen extends StatefulWidget {
 
  int selectedIndex = 0;
  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int currentIndex =0;
   String? id;
   
 
  

  @override
  
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
       id = prefs.getString('id').toString();
    });
  }

  final List<Widget> pages = [
     HomeScreen(),
    const TrasactionScreen(),
    const AddScreen(),
    const StacticScreen(),
    const ProfileScren()
  ];
  
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = currentIndex == 0 ? const HomeScreen():currentIndex == 1 ? const TrasactionScreen(): currentIndex==2?const AddScreen():currentIndex==3?const StacticScreen():const ProfileScren();
    return  Scaffold(
      backgroundColor: const Color(0xffC0DBEA),
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: (){
          
            Get.to(const AddScreen());
          
        },
        backgroundColor: const Color(0xff4F709C),
        child: const Icon(Icons.add)
        
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        
        bottomNavigationBar: BottomAppBar(
          // color: const Color(0xffC0DBEA),
          shape:const CircularNotchedRectangle(),
          notchMargin: 10,
          child: SizedBox(
            height: 60,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 50,
                      onPressed: (){
                        setState(() {
                          currentScreen = const HomeScreen();
                          currentIndex = 0;
                        });
                        
                        
                      },
                      child: Column(
                        
                        children: [
                          const SizedBox(height: 10,),
                          currentIndex==0?Image.asset("assets/home_on.png",
                          height: 30,
                          width: 30,
                          ):Image.asset("assets/home_off.png",
                          height: 30,
                          width: 30,
                          ),
                          const Text('Trang chủ',
                          style: TextStyle(
                            fontWeight: FontWeight.w500
                          ),
                          )
                        ],
                      ),
                      


                    ),

                    MaterialButton(
                      minWidth: 50,
                      onPressed: (){
                        setState(() {
                          currentScreen = const TrasactionScreen();
                          currentIndex = 1;
                        });
                        
                        
                      },
                      child: Column(
                        children: [
                          const SizedBox(height: 10,),
                          currentIndex==1?Image.asset("assets/history_on.png",
                          height: 30,
                          width: 30,
                          ):Image.asset("assets/history_off.png",
                          height: 30,
                          width: 30,
                          ),
                           const Text('Giao dịch',
                          style: TextStyle(
                            fontWeight: FontWeight.w500
                          ),
                          )
                        ],
                      ),
                      


                    ),

                    
                  ],
                ),

                Row(
                  
                  children: [
                    MaterialButton(
                       minWidth: 50,
                      onPressed: (){
                        setState(() {
                          currentScreen = const StacticScreen();
                          currentIndex = 3;
                        });
                        
                        
                      },
                      child: Column(
                        children: [
                          const SizedBox(height: 10,),
                          currentIndex==3?Image.asset("assets/chart_on.png",
                          height: 30,
                          width: 30,
                          ):Image.asset("assets/chart_off.png",
                          height: 30,
                          width: 30,
                          ),
                           const Text('Biểu đồ',
                          style: TextStyle(
                            fontWeight: FontWeight.w500
                          ),
                          )
                        ],
                      ),
                      


                    ),

                    MaterialButton(
                      minWidth: 50,
                      onPressed: (){
                        setState(() {
                          currentScreen = const ProfileScren();
                          currentIndex = 4;
                        });
                        
                        
                      },
                      child: Column(
                        children: [
                          const SizedBox(height: 10,),
                         currentIndex==4?Image.asset("assets/profile_on.png",
                          height: 30,
                          width: 30,
                          ):Image.asset("assets/profile_off.png",
                          height: 30,
                          width: 30,
                          ),
                          const Text('Cá nhân',
                          style: TextStyle(
                            fontWeight: FontWeight.w500
                          ),
                          )
                        ],
                      ),
                      


                    ),

                    
                  ],
                ),
              ],
            ),
          ),
        ),
        
       

      );

    
  }
}
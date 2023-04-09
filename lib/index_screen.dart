import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:money_manage/screens/add_trasaction/add_screen.dart';
import 'package:money_manage/screens/home/home_screen.dart';
import 'package:money_manage/screens/profile/profile_screen.dart';
import 'package:money_manage/screens/statics/statics_screen.dart';
import 'package:money_manage/screens/trasaction/trasaction_screen.dart';

class IndexScreen extends StatefulWidget {

  int selectedIndex = 0;
  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int currentIndex =0;

  @override
  
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final List<Widget> pages = [
    HomeScreen(),
    TrasactionScreen(),
    AddScreen(),
    StacticScreen(),
    ProfileScren()
  ];
  
  final PageStorageBucket bucket = PageStorageBucket();

  Widget build(BuildContext context) {
    Widget currentScreen = currentIndex == 0 ? HomeScreen():currentIndex == 1 ? TrasactionScreen(): currentIndex==2?AddScreen():currentIndex==3?StacticScreen():ProfileScren();
    return  Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: (){
          
            Get.to(AddScreen());
          
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.purple.shade300,
        
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        
        bottomNavigationBar: BottomAppBar(
          shape:CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
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
                          currentScreen = HomeScreen();
                          currentIndex = 0;
                        });
                        
                        
                      },
                      child: Column(
                        children: [
                          Icon(Icons.home,
                          size: 40,
                          color: currentIndex==0?Colors.purple.shade300:Colors.black,
                          ),
                          Text('Home',
                          style: TextStyle(
                            color: currentIndex==0?Colors.purple.shade300:Colors.black
                          ),
                          )
                        ],
                      ),
                      


                    ),

                    MaterialButton(
                      minWidth: 50,
                      onPressed: (){
                        setState(() {
                          currentScreen = TrasactionScreen();
                          currentIndex = 1;
                        });
                        
                        
                      },
                      child: Column(
                        children: [
                          Icon(Icons.change_circle,
                          size: 40,
                          color: currentIndex==1?Colors.purple.shade300:Colors.black,
                          ),
                          Text('Trasaction',
                          style: TextStyle(
                            color: currentIndex==1?Colors.purple.shade300:Colors.black
                          ),
                          )
                        ],
                      ),
                      


                    ),

                    
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 50,
                      onPressed: (){
                        setState(() {
                          currentScreen = StacticScreen();
                          currentIndex = 3;
                        });
                        
                        
                      },
                      child: Column(
                        children: [
                          Icon(Icons.pie_chart,
                          size: 40,
                          color: currentIndex==3?Colors.purple.shade300:Colors.black,
                          ),
                          Text('Statics',
                          style: TextStyle(
                            color: currentIndex==3?Colors.purple.shade300:Colors.black
                          ),
                          )
                        ],
                      ),
                      


                    ),

                    MaterialButton(
                      minWidth: 50,
                      onPressed: (){
                        setState(() {
                          currentScreen = ProfileScren();
                          currentIndex = 4;
                        });
                        
                        
                      },
                      child: Column(
                        children: [
                          Icon(Icons.person,
                          size: 40,
                          color: currentIndex==4?Colors.purple.shade300:Colors.black,
                          ),
                          Text('Profile',
                          style: TextStyle(
                            color: currentIndex==4?Colors.purple.shade300:Colors.black
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
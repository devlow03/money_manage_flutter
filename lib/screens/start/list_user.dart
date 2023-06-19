// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:hive/hive.dart';
// import 'package:money_manage/boxes.dart';
// import 'package:money_manage/model/user.dart';

// class ListUser extends StatefulWidget {
//   const ListUser({Key? key}) : super(key: key);
  
//   @override
//   State<ListUser> createState() => _ListUserState();
// }

// class _ListUserState extends State<ListUser> {
   
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ValueListenableBuilder<Box<User>>(
//         valueListenable: Boxes.getUser().listenable(),
//         builder: (context,box,_){
//           var data = box.values.toList().cast<User>();
//           return ListView.separated(
//             itemCount: box.length,
//             itemBuilder: (context,index){
//               return Card(
//                 child: Column(
//                   children: [
//                     Text(data[index].name.toString()),
//                     Text(data[index].budget.toString()),
//                   ],
//                 ),
//               );
//             }, separatorBuilder: (BuildContext context, int index) { 
//               return SizedBox(height: 10,);
//              },
//           );
//         },
//       ),

//     );
//   }
// }
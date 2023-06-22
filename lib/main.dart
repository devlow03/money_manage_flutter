import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_manage/model/info_user.dart';
import 'package:money_manage/model/negotiate.dart';
import 'package:money_manage/screens/splash_screen/splash_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var directory = await path.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  await Hive.initFlutter('manage');

  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox('info');
  // await Hive.box('info').clear();
    

  Hive.registerAdapter(NegotiateAdapter());

  await Hive.openBox<Negotiate>('negotiate');
  // await Hive.box('info').clear();
  //   await Hive.box<Negotiate>('negotiate').clear();
  

  // Hive.registerAdapter(UserAdapter());
  runApp(
    const MyApp(), // Wrap your app
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      //  useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      title: 'Money Manage',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

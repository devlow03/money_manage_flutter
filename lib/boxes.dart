import 'package:hive/hive.dart';
import 'package:money_manage/model/negotiate.dart';



class Boxes {
  // static Box<TrasactionModel> getTrasaction() => Hive.box<TrasactionModel>('trasaction');
   static Box<Negotiate> getNegotiate() => Hive.box<Negotiate>('negotiate');
}

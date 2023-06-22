import 'package:hive/hive.dart';
import 'package:money_manage/boxes.dart';
import 'package:money_manage/model/negotiate.dart';


class Trasaction{
    static final instance = Trasaction._init();
    Trasaction._init();
   Future addTrasacsion(String category, String price, String type)async{
        final trasaction = Negotiate(category: category, price: price, type: type);
        final box = Boxes.getNegotiate();
        box.add(trasaction);
  }
  Future deleteAll()async{
    await Hive.box('info').clear();
    await Hive.box<Negotiate>('negotiate').clear();
  }
}
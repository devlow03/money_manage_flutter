import 'package:money_manage/boxes.dart';
import 'package:money_manage/model/trasaction.dart';
import 'package:money_manage/model/user.dart';

class Trasaction{
    static final instance = Trasaction._init();
    Trasaction._init();
   Future addTrasacsion(String category, double price, String type)async{
        final trasaction = TrasactionModel(category: category, price: price, type: type);
        final box = Boxes.getTrasaction();
        box.add(trasaction);
  }
}
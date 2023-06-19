import 'package:hive/hive.dart';
import 'package:money_manage/model/trasaction.dart';
import 'package:money_manage/model/user.dart';


class Boxes {
  static Box<TrasactionModel> getTrasaction() => Hive.box<TrasactionModel>('trasaction');
}

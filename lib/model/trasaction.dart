import 'package:hive/hive.dart';

part 'trasaction.g.dart';

@HiveType(typeId: 0)
class TrasactionModel extends HiveObject{
  @HiveField(0)
  late String category;

  @HiveField(1)
  late double price;

  @HiveField(2)
  late String type;
  
  TrasactionModel({
    required this.category,
    required this.price,
    required this.type
  });
}
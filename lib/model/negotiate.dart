import 'package:hive/hive.dart';

part 'negotiate.g.dart';

@HiveType(typeId: 1)
class Negotiate extends HiveObject{
  @HiveField(0)
  late String category;

  @HiveField(1)
  late String price;

  @HiveField(2)
  late String type;
  
  Negotiate({
    required this.category,
    required this.price,
    required this.type
  });
}

import 'package:hive/hive.dart';
 part 'info_user.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject{
  @HiveField(0)
  late String name;

  @HiveField(1)
  late double budget;

  UserModel({required this.name, required this.budget});

}
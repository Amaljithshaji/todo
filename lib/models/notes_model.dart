import 'package:hive/hive.dart';

part 'notes_model.g.dart';
@HiveType(typeId: 1)
class MyModel extends HiveObject{
  @HiveField(0)
  final String tiltlname;
  @HiveField(1)
  final String desc;
  // @HiveField(2)
  // final String date;
  MyModel({
    required this.tiltlname,
    required this.desc,
    // required this.date
  });
}
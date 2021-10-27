import 'package:hive/hive.dart';

 part 'hive_favarite.g.dart';

@HiveType(typeId: 0)
class DataModel{
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String website;
  @HiveField(2)
  final String icon;
  @HiveField(3)
  final String catname;
  @HiveField(4)
  final String rating;
  @HiveField(5)
  final String description;
  @HiveField(6)
  final String id;

  DataModel({ required this.name, required this.website, required this.icon, required this.catname, required this.rating, required this.description ,required this.id, });

}
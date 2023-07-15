import 'package:isar/isar.dart';

part 'people.g.dart';

@collection
class People {
  late Id id;
  late String name;
  late String gender;
  late int starshipsQuantity;
  late List<int> films;
  late bool favorite;
}

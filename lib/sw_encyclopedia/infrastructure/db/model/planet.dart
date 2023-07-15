import 'package:isar/isar.dart';

part 'planet.g.dart';

@collection
class Planet{
  late Id id;
  late String name;
  late String diameter;
  late String population;
  late List<int> films;
  late bool favorite;
}

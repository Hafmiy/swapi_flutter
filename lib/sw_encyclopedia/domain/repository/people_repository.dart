import 'package:swapi/sw_encyclopedia/domain/entity/entity.dart';

abstract class PeopleRepository{
  Stream<List<People>> search(String query);
  Future<List<People>> getAll();
  Future<void> setFavorite(People people);
  Future<void> removeFromFavorite(int id);
}

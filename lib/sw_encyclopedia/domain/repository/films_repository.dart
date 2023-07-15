import 'package:swapi/sw_encyclopedia/domain/entity/entity.dart';

abstract class FilmsRepository{
  Future<List<Film>> getByIds(Set<int> ids);
}

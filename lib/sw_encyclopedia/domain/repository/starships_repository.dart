import 'package:swapi/sw_encyclopedia/domain/entity/entity.dart';

abstract class StarshipsRepository{
 Stream<List<Starship>> search(String query);
 Future<List<Starship>> getAll();
 Future<void> setFavorite(Starship starship);
 Future<void> removeFromFavorite(int id);
}

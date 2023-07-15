import 'package:swapi/sw_encyclopedia/domain/entity/entity.dart' as entity;
import 'package:swapi/sw_encyclopedia/infrastructure/api/model/model.dart' as swapi;
import 'package:swapi/sw_encyclopedia/infrastructure/db/model/db.dart' as db;

extension StarshipDbMapper on db.Starship {
  entity.Starship toEntity(){
    return entity.Starship(
      id: id,
      name: name,
      model: model,
      manufacturer: manufacturer,
      passengers: passengers,
      films: films,
      favorite: favorite,
    );
  }
}

extension StarshipRemoteMapper on swapi.Starship {
  db.Starship toDb(int id){
    return db.Starship()
      ..id = id
      ..name = name
      ..model = model
      ..manufacturer = manufacturer
      ..passengers = passengers
      ..films = films.map((e) => int.parse(Uri.parse(e).pathSegments[2])).toList()
      ..favorite = false;
  }

  entity.Starship toEntity(){
    return entity.Starship(
      id: id,
      name: name,
      model: model,
      manufacturer: manufacturer,
      passengers: passengers,
      films: films.map((e) => int.parse(Uri.parse(e).pathSegments[2])).toList(),
      favorite: false,
    );
  }
}

extension StarshipEntityMapper on entity.Starship {
  db.Starship toDb() {
    return db.Starship()
      ..id = id
      ..name = name
      ..model = model
      ..manufacturer = manufacturer
      ..passengers = passengers
      ..films = films
      ..favorite = favorite;
  }
}

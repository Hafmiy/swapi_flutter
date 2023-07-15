import 'package:swapi/sw_encyclopedia/domain/entity/entity.dart' as entity;
import 'package:swapi/sw_encyclopedia/infrastructure/api/model/model.dart' as swapi;
import 'package:swapi/sw_encyclopedia/infrastructure/db/model/db.dart' as db;

extension PlanetDbMapper on db.Planet {
  entity.Planet toEntity(){
    return entity.Planet(
      id: id,
      name: name,
      diameter: diameter,
      population: population,
      films: films,
      favorite: favorite,
    );
  }
}

extension PlanetRemoteMapper on swapi.Planet {
  db.Planet toDb(){
    return db.Planet()
      ..id = id
      ..diameter = diameter
      ..films = films.map((e) => int.parse(Uri.parse(e).pathSegments[2])).toList()
      ..population = population
      ..favorite = false;
  }

  entity.Planet toEntity(){
    return entity.Planet(
      id: id,
      name: name,
      diameter: diameter,
      population: population,
      films: films.map((e) => int.parse(Uri.parse(e).pathSegments[2])).toList(),
      favorite: false,
    );
  }
}

extension PlanetEntityMapper on entity.Planet {
  db.Planet toDb(){
    return db.Planet()
      ..id = id
      ..name = name
      ..diameter = diameter
      ..films = films
      ..population = population
      ..favorite = favorite;
  }
}

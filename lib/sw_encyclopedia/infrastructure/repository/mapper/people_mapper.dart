import 'package:swapi/sw_encyclopedia/domain/entity/entity.dart' as entity;
import 'package:swapi/sw_encyclopedia/infrastructure/api/model/model.dart' as swapi;
import 'package:swapi/sw_encyclopedia/infrastructure/db/model/db.dart' as db;

extension PeopleDbMapper on db.People {
  entity.People toEntity(){
    return entity.People(
      id: id,
      name: name,
      gender: gender,
      starshipsQuantity: starshipsQuantity,
      films: films,
      favorite: favorite,
    );
  }
}

extension PeopleRemoteMapper on swapi.People {
  db.People toDb(){
    return db.People()
      ..id = id
      ..name = name
      ..gender = gender
      ..films = films.map((e) => int.parse(Uri.parse(e).pathSegments[2])).toList()
      ..starshipsQuantity = starships.length
      ..favorite = false;
  }

  entity.People toEntity(){
    return entity.People(
      id: id,
      name: name,
      gender: gender,
      starshipsQuantity: starships.length,
      films: films.map((e) => int.parse(Uri.parse(e).pathSegments[2])).toList(),
      favorite: false,
    );
  }
}

extension PeopleEntityMapper on entity.People {
  db.People toDb(){
    return db.People()
      ..id = id
      ..name = name
      ..gender = gender
      ..starshipsQuantity = starshipsQuantity
      ..films = films
      ..favorite = favorite;
  }
}

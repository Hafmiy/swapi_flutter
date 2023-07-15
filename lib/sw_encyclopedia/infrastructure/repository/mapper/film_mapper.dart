import 'package:swapi/sw_encyclopedia/domain/entity/entity.dart' as entity;
import 'package:swapi/sw_encyclopedia/infrastructure/api/model/model.dart' as swapi;
import 'package:swapi/sw_encyclopedia/infrastructure/db/model/db.dart' as db;

extension FilmDbMapper on db.Film {
  entity.Film toEntity(){
    return entity.Film(
      id: id,
      title: title,
      director: director,
      producer: producer,
    );
  }
}

extension FilmRemoteMapper on swapi.Film {
  db.Film toDb(){
    return db.Film()
    ..id = id
    ..title = title
    ..producer = producer
    ..director = director;
  }

  entity.Film toEntity(){
    return entity.Film(
      id: id,
      title: title,
      director: director,
      producer: producer,
    );
  }
}

extension FilmEntityMapper on entity.Film {
  db.Film toDb(){
    return db.Film()
      ..id = id
      ..title = title
      ..producer = producer
      ..director = director;
  }
}

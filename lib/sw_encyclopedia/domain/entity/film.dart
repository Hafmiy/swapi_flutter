import 'package:freezed_annotation/freezed_annotation.dart';

part 'film.freezed.dart';

@freezed
class Film with _$Film {
  factory Film({
    required int id,
    required String title,
    required String director,
    required String producer,
  }) = _Film;
}

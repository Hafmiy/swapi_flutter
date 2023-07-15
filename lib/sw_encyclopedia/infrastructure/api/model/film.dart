import 'package:freezed_annotation/freezed_annotation.dart';

part 'film.freezed.dart';
part 'film.g.dart';

@freezed
class Film with _$Film {
  const factory Film({
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'director') required String director,
    @JsonKey(name: 'producer') required String producer,
    @JsonKey(name: 'url') required String url,
  }) = _Film;

  const Film._();

  int get id => int.parse(Uri.parse(url).pathSegments[2]);

  factory Film.fromJson(Map<String, dynamic> json) => _$FilmFromJson(json);
}

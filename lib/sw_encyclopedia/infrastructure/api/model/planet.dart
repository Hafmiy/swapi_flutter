import 'package:freezed_annotation/freezed_annotation.dart';

part 'planet.freezed.dart';
part 'planet.g.dart';

@freezed
class Planet with _$Planet {
  const factory Planet({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'diameter') required String diameter,
    @JsonKey(name: 'population') required String population,
    @JsonKey(name: 'films', defaultValue: []) required List<String> films,
    @JsonKey(name: 'url') required String url,
  }) = _Planet;

  const Planet._();

  int get id => int.parse(Uri.parse(url).pathSegments[2]);

  factory Planet.fromJson(Map<String, dynamic> json) => _$PlanetFromJson(json);
}

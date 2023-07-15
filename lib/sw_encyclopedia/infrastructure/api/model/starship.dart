import 'package:freezed_annotation/freezed_annotation.dart';

part 'starship.freezed.dart';
part 'starship.g.dart';

@freezed
class Starship with _$Starship {
  const factory Starship({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'model') required String model,
    @JsonKey(name: 'manufacturer') required String manufacturer,
    @JsonKey(name: 'passengers') required String passengers,
    @JsonKey(name: 'films', defaultValue: []) required List<String> films,
    @JsonKey(name: 'url') required String url,
  }) = _Starship;

  const Starship._();

  int get id => int.parse(Uri.parse(url).pathSegments[2]);

  factory Starship.fromJson(Map<String, dynamic> json) => _$StarshipFromJson(json);
}

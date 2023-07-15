import 'package:freezed_annotation/freezed_annotation.dart';

part 'starship.freezed.dart';

@freezed
class Starship with _$Starship {
  factory Starship({
    required int id,
    required String name,
    required String model,
    required String manufacturer,
    required String passengers,
    required List<int> films,
    required bool favorite,
  }) = _Starship;

  const Starship._();

  bool fitSearch(String query) => name.toLowerCase().contains(query.toLowerCase());
}

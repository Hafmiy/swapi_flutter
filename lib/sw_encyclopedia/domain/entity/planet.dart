import 'package:freezed_annotation/freezed_annotation.dart';

part 'planet.freezed.dart';

@freezed
class Planet with _$Planet {
  factory Planet({
    required int id,
    required String name,
    required String diameter,
    required String population,
    required List<int> films,
    required bool favorite,
  }) = _Planet;

  const Planet._();

  bool fitSearch(String query) => name.toLowerCase().contains(query.toLowerCase());
}

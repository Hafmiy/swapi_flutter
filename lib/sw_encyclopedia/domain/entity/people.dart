import 'package:freezed_annotation/freezed_annotation.dart';

part 'people.freezed.dart';

@freezed
class People with _$People {
  factory People({
    required int id,
    required String name,
    required String gender,
    required int starshipsQuantity,
    required List<int> films,
    required bool favorite,
  }) = _People;

  const People._();

  bool fitSearch(String query) => name.toLowerCase().contains(query.toLowerCase());
}

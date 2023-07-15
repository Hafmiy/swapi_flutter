import 'package:freezed_annotation/freezed_annotation.dart';

part 'people.freezed.dart';
part 'people.g.dart';

@freezed
class People with _$People {
  const factory People({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'gender') required String gender,
    @JsonKey(name: 'films', defaultValue: []) required List<String> films,
    @JsonKey(name: 'starships', defaultValue: []) required List<String> starships,
    @JsonKey(name: 'url') required String url,
  }) = _People;

  const People._();

  int get id => int.parse(Uri.parse(url).pathSegments[2]);

  factory People.fromJson(Map<String, dynamic> json) => _$PeopleFromJson(json);
}

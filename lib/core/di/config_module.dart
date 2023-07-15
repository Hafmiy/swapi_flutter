import 'package:injectable/injectable.dart';


const apiUrlKey = "defaultUrl";

@module
abstract class ConfigsModule {

  @singleton
  @Named(apiUrlKey)
  String get apiUrl => 'https://swapi.dev/api';
}

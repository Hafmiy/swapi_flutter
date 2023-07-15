import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:swapi/core/di/di.config.dart';

final getIt = GetIt.instance;

const envKey = "env";

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future configureDependencies() async => getIt.init();

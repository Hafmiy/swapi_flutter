
import 'dart:ui';

import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<Brightness>{
  ThemeCubit():super(_getBrightness());

  static Brightness _getBrightness() =>
      SchedulerBinding.instance.platformDispatcher.platformBrightness;

  void setBrightness(Brightness brightness) {
    emit(brightness);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swapi/core/application/cubit/theme_cubit.dart';

class ApplicationThemeBuilder extends StatelessWidget {
  final BlocWidgetBuilder<Brightness> builder;
  const ApplicationThemeBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, Brightness>(builder: builder),
    );
  }
}

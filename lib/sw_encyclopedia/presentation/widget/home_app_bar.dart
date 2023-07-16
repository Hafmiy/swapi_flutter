import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swapi/core/application/cubit/theme_cubit.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0.0,
      actions: [
        BlocBuilder<ThemeCubit, Brightness>(
          builder: (_, brightness) {
            final isDark = brightness == Brightness.dark;
            return IconButton(
              icon: Icon(
                isDark? Icons.dark_mode: Icons.light_mode,
              ),
              onPressed: (){
                context.read<ThemeCubit>().setBrightness(
                  isDark? Brightness.light: Brightness.dark,
                );
              },
            );
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

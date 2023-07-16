import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:swapi/core/di/di.dart';
import 'package:swapi/core/preserntation/application_theme_builder.dart';
import 'package:swapi/core/preserntation/themes.dart' as themes;
import 'package:swapi/sw_encyclopedia/presentation/screen/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(SWApiApp());
}

class SWApiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ApplicationThemeBuilder(
      builder: (context, brightness) {
        return MaterialApp(
          title: 'SWAPI Flutter',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: brightness == Brightness.dark?
          themes.darkTheme : themes.lightTheme,
          debugShowCheckedModeBanner: false,
          routes: {
            HomeScreen.routeName: (BuildContext context) => HomeScreen(),
          },
          initialRoute: HomeScreen.routeName,
        );
      },
    );
  }

}

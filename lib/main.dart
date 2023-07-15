import 'package:flutter/material.dart';
import 'package:swapi/core/di/di.dart';
import 'package:swapi/sw_encyclopedia/presentation/screen/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(SWApiApp());
}

class SWApiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Wars API',
      theme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (BuildContext context) => HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }

}

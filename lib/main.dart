import 'package:flutter/material.dart';
import 'package:worldtime/pages/Profile.dart';
import 'package:worldtime/pages/dashboard.dart';
import 'package:worldtime/pages/home.dart';
import 'package:worldtime/pages/choose_location.dart';
import 'package:worldtime/pages/loading.dart';
import 'package:worldtime/pages/vintage_car.dart';
import 'package:worldtime/theme/theme_constants.dart';
import 'package:worldtime/theme/theme_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:worldtime/widget_tree.dart';
import 'appFooter.dart';
import 'crude_pages/sign_in.dart';

ThemeManager _themeManager = ThemeManager();

Future main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
  static _MyAppState? of(BuildContext context) => context.findAncestorStateOfType<_MyAppState>();

}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Racer App',
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      themeMode: _themeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => const Loading(),
        '/wetree': (context) => const WidgetTree(),
        '/footer': (context) => const Footer(),
        '/login': (context) => const SignIn(),
        '/home': (context) => const Home(),
        '/location': (context) => const ChooseArea(),
        '/profile': (context) => const Profile(),
        '/dashboard': (context) => const Dashboard(),
        '/vintage': (context) => const Vintage(),
      },
    );
  }
}
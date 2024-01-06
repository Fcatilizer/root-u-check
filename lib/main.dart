import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rootucheck/pages/home.dart';
import 'package:rootucheck/pages/info.dart';
import 'package:rootucheck/pages/log.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge).then(
        (_) => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final _lightscheme = ColorScheme.fromSeed(seedColor: Colors.blue);
  static final _darkscheme =
  ColorScheme.fromSeed(seedColor: Colors.blue, brightness: Brightness.dark);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    return DynamicColorBuilder(
        builder: (ColorScheme? lightColorScheme, ColorScheme? darkColorScheme) {
          return MaterialApp(
            title: 'Root U Check',
            theme: ThemeData(
              colorScheme: lightColorScheme ?? _lightscheme,
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              colorScheme: darkColorScheme ?? _darkscheme,
              useMaterial3: true,
            ),
            initialRoute: "/",
            routes: {
              '/': (context) => const Home(),
              '/info': (context) => const Info(),
              '/log': (context) => const Log(),
            },
          );
        });
  }
}
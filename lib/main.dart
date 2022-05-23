import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

import 'shell.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const SpotifyClone());

  doWhenWindowReady(() {
    const initialSize = Size(800, 800);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.show();
  });
}

class SpotifyClone extends StatelessWidget {
  const SpotifyClone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Spotify UI',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        scaffoldBackgroundColor: const Color(0xFF121212),
        backgroundColor: const Color(0xFF121212),
        primaryColor: Colors.black,
        iconTheme: const IconThemeData().copyWith(color: Colors.white),
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          headline2: const TextStyle(
            color: Colors.white,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            fontSize: 12.0,
            color: Colors.grey[300],
            fontWeight: FontWeight.w500,
            letterSpacing: 2.0,
          ),
          bodyText1: TextStyle(
            color: Colors.grey[300],
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.0,
          ),
          bodyText2: TextStyle(
            color: Colors.grey[300],
            letterSpacing: 1.0,
          ),
        ),
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all(const Color(0xFF4C4D51)),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF1DB954),
          brightness: Brightness.dark,
        ),
      ),
      home: const Shell(),
    );
  }
}

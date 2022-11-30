import 'package:flutter/material.dart';
import 'package:music_player/music_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          accentColor: Colors.grey.withOpacity(0.1),
        )
      ),
      home: MusicScreen(),
    );
  }
}


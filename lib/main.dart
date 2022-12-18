import 'package:flutter/material.dart';
import 'package:music_player/_drawer_test_page.dart';
import 'package:music_player/components/custom_drawer.dart';
import 'package:music_player/components/custom_drawer_new.dart';
import 'package:music_player/music_screen.dart';
import 'package:music_player/pages/song_page.dart';
import 'package:get/get.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          accentColor: Colors.grey.withOpacity(0.1),
        ),
      ),
      home: CustomDrawerNew(),
    );
  }
}


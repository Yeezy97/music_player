import 'package:flutter/material.dart';
import 'package:music_player/constants.dart';
import 'package:music_player/pages/custom_drawer_page/drawer_and_songs_stack.dart';
import 'package:get/get.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: lightTheme,
        darkTheme: darkTheme,
        home:  const DrawerAndSongsListStack(),
      );

  }
}


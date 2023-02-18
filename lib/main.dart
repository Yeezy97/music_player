import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/constants.dart';
import 'package:music_player/controllers/settings_controller.dart';
import 'package:music_player/pages/custom_drawer_page/drawer_and_songs_stack.dart';
import 'package:get/get.dart';
import 'package:music_player/controllers/audio_query_controller.dart';
import 'controllers/theme_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());
    SettingsController settingsController = Get.put(SettingsController());
    OnAudioQueryController audioQueryController = Get.put(
        OnAudioQueryController());
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: lightTheme,
        darkTheme: darkTheme,
        // theme: ThemeData(
        //   iconTheme: IconThemeData(
        //     color: settingsController.isLightMode ? Colors.black : Colors.white,
        //   ),
        //   textTheme: GoogleFonts.sourceSansProTextTheme(
        //     settingsController.isLightMode ? Typography.blackHelsinki : Typography.whiteHelsinki,
        //   ).copyWith(
        //     displaySmall: TextStyle(
        //       color: settingsController.isLightMode ? Colors.black : Colors.white,
        //       fontSize: 10,
        //     )
        //   ),
        //   // brightness: settingsController.isLightMode
        //   //     ? Brightness.dark
        //   //     : Brightness.light,
        //
        //   colorScheme: ColorScheme.fromSwatch(
        //     accentColor: Colors.grey.withOpacity(0.1),
        //   ),
        //   primaryColor: settingsController.isLightMode
        //       ? Colors.white
        //       : const Color(0xFF181818),
        //   secondaryHeaderColor: settingsController.isLightMode ? Colors.black : Colors.white,
        //   primaryColorLight: settingsController.isLightMode ? const Color(
        //       0xffF5F5F5) : Colors.black,
        // ),
        home: DrawerAndSongsListStack(),
      );

  }
}


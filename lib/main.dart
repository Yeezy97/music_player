import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/components/custom_drawer.dart';
import 'package:get/get.dart';
import 'package:music_player/controllers/audio_query_controller.dart';

OnAudioQueryController audioQueryController = Get.put(OnAudioQueryController());

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
        textTheme: GoogleFonts.sourceSansProTextTheme(),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: Colors.grey.withOpacity(0.1),
        ),
      ),
      home: CustomDrawer(),
    );
  }
}


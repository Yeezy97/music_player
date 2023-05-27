import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:music_player/pages/custom_drawer_page/drawer_and_songs_stack.dart';
import 'package:music_player/controllers/audio_query_controller.dart';
import 'package:music_player/pages/song_page/song_page_widgets/music_slider.dart';
import 'song_page_widgets/back_artwork_container.dart';
import 'song_page_widgets/current_song_info.dart';
import 'song_page_widgets/front_artwork_container.dart';
import 'song_page_widgets/playback_buttons.dart';
import 'song_page_widgets/song_time_and_position.dart';

class SongPage extends StatelessWidget {
  const SongPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OnAudioQueryController audioQueryController = Get.put(
        OnAudioQueryController());

    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Theme
                    .of(context)
                    .cardColor,
                Theme
                    .of(context)
                    .primaryColorLight,

              ]),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GetBuilder<OnAudioQueryController>(builder: (_) {
                return Stack(
                  children: [
                    BackArtworkContainer(
                        size: size, audioQueryController: audioQueryController),
                    FrontArtworkContainer(
                        size: size, audioQueryController: audioQueryController),
                    Positioned(
                      top: 20,
                      left: 20,
                      child: IconButton(
                          color: Colors.white70,
                          onPressed: () {
                            Get.to(const DrawerAndSongsListStack());
                          },
                          icon: const Icon(FontAwesomeIcons.arrowLeft)),
                    ),
                  ],
                );
              }),
              GetBuilder<OnAudioQueryController>(builder: (_) {
                return CurrentSongInfo(
                    size: size, audioQueryController: audioQueryController);
              }),
              MusicSlider(audioQueryController: audioQueryController),
              SongTimeAndPosition(audioQueryController: audioQueryController),
              PlaybackButtons(
                  size: size, audioQueryController: audioQueryController)
            ],
          ),
        ),
      ),
    );
  }
}




import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:music_player/components/custom_drawer.dart';
import 'package:music_player/controllers/audio_query_controller.dart';
import 'package:music_player/controllers/song_button_controller.dart';
import 'package:music_player/pages/all_songs_page/all_songs_page_widgets/artwork_widget.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongPage extends StatelessWidget {
  const SongPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OnAudioQueryController audioQueryController = Get.put(OnAudioQueryController());
    SongButtonControllerImp buttonController = Get.put(SongButtonControllerImp());

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.black,
                Color(0xFF181818),
              ]),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white.withOpacity(0.7),
                              Colors.white.withOpacity(0.6),
                              Colors.white.withOpacity(0.5),
                              Colors.transparent,
                            ]).createShader(bounds);
                      },
                      child: Container(
                        width: size.width,
                        height: size.height * 0.5,
                        child: ArtWorkWidget(
                          artworkSize: 400,audioQueryController: audioQueryController, index: audioQueryController.currentIndex,
                        ),
                        // child: QueryArtworkWidget(
                        //   id: audioQueryController.songs != null ? audioQueryController.songs[audioQueryController.currentIndex].id :null!,
                        //   type: ArtworkType.AUDIO,
                        //   artworkFit: BoxFit.cover,
                        //   artworkHeight: size.height * 0.5,
                        //   artworkWidth: size.width,
                        //   size: 1000,
                        //   artworkQuality: FilterQuality.high,
                        //   artworkBorder: BorderRadius.circular(5),
                        //   nullArtworkWidget: Icon(Icons.music_note, color: Colors.white,size: 200,),
                        // ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 80,
                    right: 80,
                    bottom: 80,
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: size.width * 0.6,
                        maxHeight: size.width * 0.6,
                      ),
                      decoration:  BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(5, 5),
                            color: Colors.black,
                            blurRadius: 15,
                          ),
                        ],
                        borderRadius:  BorderRadius.circular(15),
                       ),
                      // width: size.width * 0.6,
                      // height: size.width * 0.6,

                      //alignment: Alignment.bottomCenter,
                      child: ArtWorkWidget(

                        artworkSize: 500,
                        audioQueryController: audioQueryController,
                        index: audioQueryController.currentIndex,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: IconButton(
                        color: Colors.white70,
                        onPressed: () {
                          Get.to(CustomDrawer());
                        },
                        icon: Icon(FontAwesomeIcons.arrowLeft)),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity,
                height: size.height * 0.15,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        audioQueryController.currentSongArtist,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        audioQueryController.currentSongTitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              Obx(() {
                return Slider(
                    activeColor: Color(0xFFEC4426),
                    inactiveColor: Color(0xFFD9CFCE),
                    autofocus: true,
                    thumbColor: Colors.white,
                    min: 0,
                    max:
                    audioQueryController.songDuration.value.inSeconds.toDouble(),
                    value:
                    audioQueryController.songPosition.value.inSeconds.toDouble(),
                    onChanged: (value) async {
                      final position = Duration(seconds: value.toInt());
                      await audioQueryController.justAudioPlayer.seek(position);
                      //await audioController.audioPlayer.resume();
                    });
              }),
              Obx(() {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        audioQueryController
                            .formatTime(audioQueryController.songPosition.value),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        audioQueryController.formatTime(
                            audioQueryController.songDuration.value -
                                audioQueryController.songPosition.value),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                );
              }),
              Container(
                width: double.infinity,
                height: size.height * 0.15,
                child: Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          iconSize: 20,
                          color: Colors.white,
                          icon: const Icon(FontAwesomeIcons.repeat)),
                      IconButton(
                          onPressed: () {},
                          color: Colors.white,
                          icon: const Icon(FontAwesomeIcons.backwardStep)),
                      // IconButton(
                      //   iconSize: 35,
                      //   color: Colors.white,
                      //   onPressed: () async {
                      //     audioController.isPlaying.value =
                      //         !audioController.isPlaying.value;
                      //     if (audioController.isPlaying.value == false) {
                      //       await audioController.audioPlayer.pause();
                      //     } else {
                      //       var path = AssetSource("music/ilira.mp3");
                      //       await audioController.audioPlayer.play(path);
                      //     }
                      //     //buttonController.play();
                      //   },
                      //   icon: Icon(
                      //     audioController.isPlaying.value == false
                      //         ? FontAwesomeIcons.circlePlay
                      //         : FontAwesomeIcons.circlePause,
                      //     //buttonController.isPlaying ? FontAwesomeIcons.circlePause : FontAwesomeIcons.circlePlay
                      //   ),
                      // ),
                      GestureDetector(
                        onTap: () async {
                          audioQueryController.isPlaying.value =
                          !audioQueryController.isPlaying.value;
                          if (audioQueryController.isPlaying.value == false) {
                            await audioQueryController.justAudioPlayer.pause();
                          } else {
                            //var path = AssetSource("music/ilira.mp3");
                            await audioQueryController.justAudioPlayer.play();
                          }
                          //buttonController.play();
                        },
                        child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            padding: const EdgeInsets.all(8),
                            height: 47,
                            width: 47,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 8,
                                    color: audioQueryController.isPlaying.value
                                        ? const Color(0xFFDC5F00)
                                        : Colors.black,
                                  ),
                                ]),
                            child: Icon(
                              audioQueryController.isPlaying.value
                                  ? FontAwesomeIcons.pause
                                  : FontAwesomeIcons.play,
                              color: const Color(0xFFDC5F00),
                              size: 18,
                            ),
                          ),
                      ),
                      IconButton(
                          onPressed: () {},
                          color: Colors.white,
                          icon: const Icon(FontAwesomeIcons.forwardStep)),
                      IconButton(
                          iconSize: 20,
                          onPressed: () {},
                          color: Colors.white,
                          icon: const Icon(FontAwesomeIcons.shuffle)),
                    ],
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

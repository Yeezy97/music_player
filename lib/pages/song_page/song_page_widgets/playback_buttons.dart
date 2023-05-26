import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:music_player/components/play_and_pause_button.dart';
import 'package:music_player/controllers/audio_query_controller.dart';

class PlaybackButtons extends StatelessWidget {
  const PlaybackButtons({
    Key? key,
    required this.size,
    required this.audioQueryController,
  }) : super(key: key);

  final Size size;
  final OnAudioQueryController audioQueryController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height * 0.15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {},
              iconSize: 18,
              icon: const Icon(FontAwesomeIcons.repeat)),
          IconButton(
              onPressed: () {
                audioQueryController.justAudioPlayer.seekToPrevious();
              },
              icon: const Icon(FontAwesomeIcons.backwardStep)),
          Obx(() {
            return GestureDetector(
              onTap: () async {
                audioQueryController.isPlaying.value =
                !audioQueryController.isPlaying.value;
                if (audioQueryController.isPlaying.value == false) {
                  await audioQueryController.justAudioPlayer.pause();
                } else {
                  await audioQueryController.justAudioPlayer.play();
                }
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
                        blurRadius: 6,
                        color: audioQueryController.isPlaying.value
                            ? Theme
                            .of(context)
                            .secondaryHeaderColor
                            : Colors.black45,
                      ),
                    ]),
                child: Icon(
                  audioQueryController.isPlaying.value
                      ? FontAwesomeIcons.pause
                      : FontAwesomeIcons.play,
                  color: Theme
                      .of(context)
                      .secondaryHeaderColor,
                  size: 18,
                ),
              ),
            );
          }),
          //PlayAndPauseButton(audioQueryController: audioQueryController),
          IconButton(
              onPressed: () {
                audioQueryController.justAudioPlayer.seekToNext();
              },
              //color: Theme.of(context).secondaryHeaderColor,
              icon: const Icon(FontAwesomeIcons.forwardStep)),
          GetBuilder<OnAudioQueryController>(builder: (_) {
            return IconButton(
                iconSize: 20,
                color: audioQueryController.isShuffling ? Theme.of(context).secondaryHeaderColor : null, /// verify functionality of button colors
                onPressed: () {
                  audioQueryController.isShuffling =
                  !audioQueryController.isShuffling;
                  audioQueryController.justAudioPlayer.setShuffleModeEnabled(
                      audioQueryController.isShuffling);
                  //audioQueryController.justAudioPlayer.shuffleModeEnabled;
                  print(audioQueryController.isShuffling);
                  print(
                      audioQueryController.justAudioPlayer.shuffleModeEnabled);
                  audioQueryController.update();
                },
                //color: Theme.of(context).secondaryHeaderColor,
                icon: Icon(FontAwesomeIcons.shuffle));
          }),
        ],
      ),
    );
  }
}

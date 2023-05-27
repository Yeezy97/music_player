import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/controllers/audio_query_controller.dart';
import '../../../constants.dart';


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
    Widget repeatIcons() {
      audioQueryController.selectedRepeatOption = RepeatOptions.values[audioQueryController.enumIndex];
      switch (audioQueryController.selectedRepeatOption) {
        case RepeatOptions.repeatOff :
          return const Icon(Icons.repeat);
        case RepeatOptions.repeatAll :
          return Icon(Icons.repeat,color: Theme.of(context).secondaryHeaderColor);
        case RepeatOptions.repeatOne :
          return Icon(Icons.repeat_one, color: Theme.of(context).secondaryHeaderColor,);
        default:
          return const Icon(Icons.repeat);
      }
    }


    //RepeatOptions selectedOption = RepeatOptions.values[i];
    return Container(
      width: double.infinity,
      height: size.height * 0.15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetBuilder<OnAudioQueryController>(builder: (_) {
            return IconButton(
              onPressed: () {
                if (audioQueryController.enumIndex < RepeatOptions.values.length - 1) {
                  audioQueryController.enumIndex++;
                } else {
                  audioQueryController.enumIndex = 0;
                }
                audioQueryController.selectedRepeatOption = RepeatOptions.values[audioQueryController.enumIndex];
                switch (audioQueryController.selectedRepeatOption) {
                  case RepeatOptions.repeatOff:
                    audioQueryController.justAudioPlayer.setLoopMode(
                        LoopMode.off);
                    break;
                  case RepeatOptions.repeatAll:
                    audioQueryController.justAudioPlayer.setLoopMode(
                        LoopMode.all);
                    break;
                  case RepeatOptions.repeatOne:
                    audioQueryController.justAudioPlayer.setLoopMode(
                        LoopMode.one);
                    break;
                  default:
                    audioQueryController.justAudioPlayer.setLoopMode(
                        LoopMode.off);
                }
                audioQueryController.update();
              },
              iconSize: 18,
              icon: repeatIcons(),
            );
          }),
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
          IconButton(
              onPressed: () {
                audioQueryController.justAudioPlayer.seekToNext();
              },
              icon: const Icon(FontAwesomeIcons.forwardStep)),
          GetBuilder<OnAudioQueryController>(builder: (_) {
            return IconButton(
                iconSize: 20,
                color: audioQueryController.isShuffling ? Theme
                    .of(context)
                    .secondaryHeaderColor : null,

                /// verify functionality of button colors
                onPressed: () {
                  audioQueryController.isShuffling =
                  !audioQueryController.isShuffling;
                  audioQueryController.justAudioPlayer.setShuffleModeEnabled(
                      audioQueryController.isShuffling);
                  audioQueryController.update();
                },
                icon: const Icon(FontAwesomeIcons.shuffle));
          }),
        ],
      ),
    );
  }
}

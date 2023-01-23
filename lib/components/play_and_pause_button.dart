import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:music_player/controllers/audio_query_controller.dart';

class PlayAndPauseButton extends StatelessWidget {
  const PlayAndPauseButton({
    Key? key,
    required this.audioQueryController,
  }) : super(key: key);

  final OnAudioQueryController audioQueryController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (audioQueryController.isPlaying.value == true) {
          await audioQueryController.justAudioPlayer.pause();
        } else {
          await audioQueryController.justAudioPlayer.play();
          audioQueryController.isPlaying.value =
          !audioQueryController.isPlaying.value;
        }
      },
      child: Obx(() {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(8),
          height: 47,
          width: 47,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
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
        );
      }),
    );
  }
}


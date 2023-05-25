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
    return Obx(() {
      return GestureDetector(
        onTap: ()  {
          if (audioQueryController.isPlaying.value == true) {
             audioQueryController.justAudioPlayer.pause();
          } else {
             audioQueryController.justAudioPlayer.play();
          }
          audioQueryController.isPlaying.value = !audioQueryController.isPlaying.value; /// fix this shit
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
                      ? Theme.of(context).secondaryHeaderColor
                  //Color(0xFFDC5F00)
                      : Colors.black45,
                ),
              ]),
          child: Icon(
            // audioQueryController.isPlaying.value
            audioQueryController.isPlaying.value
                ? FontAwesomeIcons.pause
                : FontAwesomeIcons.play,
            color: Theme.of(context).secondaryHeaderColor,
            //Color(0xFFDC5F00),
            size: 18,
          ),
        ),
      );
    });
  }
}



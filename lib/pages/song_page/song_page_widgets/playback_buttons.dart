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
            GestureDetector(
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
            //PlayAndPauseButton(audioQueryController: audioQueryController),
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
    );
  }
}

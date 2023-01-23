import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/audio_query_controller.dart';

class MusicSlider extends StatelessWidget {
  const MusicSlider({
    Key? key,
    required this.audioQueryController,
  }) : super(key: key);

  final OnAudioQueryController audioQueryController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
    });
  }
}
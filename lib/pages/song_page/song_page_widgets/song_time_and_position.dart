import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/audio_query_controller.dart';

class SongTimeAndPosition extends StatelessWidget {
  const SongTimeAndPosition({
    Key? key,
    required this.audioQueryController,
  }) : super(key: key);

  final OnAudioQueryController audioQueryController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              audioQueryController
                  .formatTime(audioQueryController.songPosition.value),
              style:  TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 12,
              ),
            ),
            Text(
              audioQueryController.formatTime(
                  audioQueryController.songDuration.value -
                      audioQueryController.songPosition.value),
              style:  TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      );
    });
  }
}


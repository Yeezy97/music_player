import 'package:flutter/material.dart';

import '../../../controllers/audio_query_controller.dart';

class CurrentSongInfo extends StatelessWidget {
  const CurrentSongInfo({
    Key? key,
    required this.size,
    required this.audioQueryController,
  }) : super(key: key);

  final Size size;
  final OnAudioQueryController audioQueryController;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}




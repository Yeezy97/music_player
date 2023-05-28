import 'package:flutter/material.dart';
import 'package:music_player/controllers/audio_query_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';

class ArtWorkWidget extends StatelessWidget {
  const ArtWorkWidget({
    Key? key,
    required this.audioQueryController,required this.index, required this.artworkSize
  }) : super(key: key);

  final int artworkSize;
  final int index;
  final OnAudioQueryController audioQueryController;

  @override
  Widget build(BuildContext context) {
    return QueryArtworkWidget(
      keepOldArtwork: true,
      id: audioQueryController.songs[index]
          .id,
      type: ArtworkType.AUDIO,
      artworkFit: BoxFit.fill,
      size: artworkSize,
      artworkBorder: BorderRadius.zero,
      nullArtworkWidget: Container(
        decoration:  const BoxDecoration(
          image: DecorationImage(
              opacity: 0.9,
              image: AssetImage("assets/images/background_logo.png",),
              fit: BoxFit.fill),
        ),
      ),
      // const Icon(
      //   Icons.music_note_outlined,
      //   color: Colors.white, size: 50,),
    );
  }
}
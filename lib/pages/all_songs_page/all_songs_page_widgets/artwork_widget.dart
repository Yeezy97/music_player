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
      artworkBorder: BorderRadius
          .circular(15),
      nullArtworkWidget: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              opacity: 0.4,
              image: AssetImage("assets/images/music_note_background4.png",),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      // const Icon(
      //   Icons.music_note_outlined,
      //   color: Colors.white, size: 50,),
    );
  }
}
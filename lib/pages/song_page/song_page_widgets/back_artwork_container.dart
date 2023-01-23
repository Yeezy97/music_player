import 'package:flutter/material.dart';

import '../../../controllers/audio_query_controller.dart';
import '../../all_songs_page/all_songs_page_widgets/artwork_widget.dart';

class BackArtworkContainer extends StatelessWidget {
  const BackArtworkContainer({
    Key? key,
    required this.size,
    required this.audioQueryController,
  }) : super(key: key);

  final Size size;
  final OnAudioQueryController audioQueryController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white.withOpacity(0.7),
                Colors.white.withOpacity(0.6),
                Colors.white.withOpacity(0.5),
                Colors.transparent,
              ]).createShader(bounds);
        },
        child: Container(
          width: size.width,
          height: size.height * 0.5,
          child: ArtWorkWidget(
            artworkSize: 400,audioQueryController: audioQueryController, index: audioQueryController.currentIndex,
          ),
          // child: QueryArtworkWidget(
          //   id: audioQueryController.songs != null ? audioQueryController.songs[audioQueryController.currentIndex].id :null!,
          //   type: ArtworkType.AUDIO,
          //   artworkFit: BoxFit.cover,
          //   artworkHeight: size.height * 0.5,
          //   artworkWidth: size.width,
          //   size: 1000,
          //   artworkQuality: FilterQuality.high,
          //   artworkBorder: BorderRadius.circular(5),
          //   nullArtworkWidget: Icon(Icons.music_note, color: Colors.white,size: 200,),
          // ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

import '../../../controllers/audio_query_controller.dart';
import '../../all_songs_page/all_songs_page_widgets/artwork_widget.dart';

class FrontArtworkContainer extends StatelessWidget {
  const FrontArtworkContainer({
    Key? key,
    required this.size,
    required this.audioQueryController,
  }) : super(key: key);

  final Size size;
  final OnAudioQueryController audioQueryController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 80,
      left: 80,
      right: 80,
      bottom: 80,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: size.width * 0.6,
          maxHeight: size.width * 0.6,
        ),
        decoration:  BoxDecoration(
          boxShadow:  [
            const BoxShadow(
              offset: Offset(5, 5),
              color: Colors.black,
              blurRadius: 15,
            ),
          ],
          borderRadius:  BorderRadius.circular(15),
        ),
        // width: size.width * 0.6,
        // height: size.width * 0.6,

        //alignment: Alignment.bottomCenter,
        child: ArtWorkWidget(
          artworkSize: 500,
          audioQueryController: audioQueryController,
          index: audioQueryController.currentIndex,
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/controllers/audio_query_controller.dart';
import 'package:music_player/pages/all_songs_page/all_songs_page_widgets/artwork_widget.dart';
import 'package:music_player/pages/song_page/song_page.dart';

class SongInfoContainer extends StatelessWidget {
  const SongInfoContainer({
    Key? key,
    required this.size,
    required this.audioQueryController,
  }) : super(key: key);

  final Size size;
  final OnAudioQueryController audioQueryController;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: GestureDetector(
        onTap: () {
          Get.to(() => const SongPage());
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
              vertical: 4, horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).cardColor,
            // gradient: const LinearGradient(
            //     begin: Alignment.centerLeft,
            //     end: Alignment.centerRight,
            //     colors:  [
            //       Color(0xFF181818),
            //       Colors.black
            //     ]),
          ),
          height: 60,
          width: size.width * 0.48,
          child: Row(
            children: [
              Container(
                //margin: EdgeInsets.all(4),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(3, 2),
                        blurRadius: 5,
                        color: Colors.black54)
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GetBuilder<OnAudioQueryController>(builder: (logic) {
                  return ArtWorkWidget(audioQueryController: audioQueryController, index: audioQueryController.currentIndex, artworkSize: 200);
                }),
              ), // song thumbnail
              const SizedBox(
                width: 7,
              ),
              Container(
                padding: const EdgeInsets.all(3.0),
                constraints: BoxConstraints(
                  maxWidth: size.width * 0.29,
                  maxHeight: 50,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GetBuilder<OnAudioQueryController>(
                        builder: (logic) {
                          return Text(
                            audioQueryController.currentSongTitle,
                            style: TextStyle(
                              //color: Color(0xFFDC5F00),
                              color: Theme.of(context).primaryColor,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          );
                        }),
                    GetBuilder<OnAudioQueryController>(
                        builder: (logic) {
                          return Text(
                            audioQueryController
                                .currentSongArtist,
                            style: TextStyle(
                              // color: Color(0xFFDC5F00),
                              color: Theme.of(context).primaryColor,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          );
                        }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:music_player/controllers/audio_query_controller.dart';
import 'package:music_player/pages/all_songs_page/all_songs_page_widgets/artwork_widget.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../controllers/selected_index_controller.dart';

class AllSongsListView extends StatelessWidget {
  const AllSongsListView({
    Key? key,
    required this.audioQueryController,
    required this.size,
    required this.selectedIndexController,
  }) : super(key: key);

  final OnAudioQueryController audioQueryController;
  final Size size;
  final SelectedIndexController selectedIndexController;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SongModel>>(
        future: audioQueryController.onAudioQuery.querySongs(
          sortType: null,
          orderType: OrderType.ASC_OR_SMALLER,
          uriType: UriType.EXTERNAL,
          ignoreCase: true,
        ),
        builder: (context, item) {
          // loading content indicator
          if (item.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (item.data!.isEmpty) {
            return const Center(
              child: Text(" No Songs Found"),
            );
          }
          //audioQueryController.songs.clear();
          audioQueryController.songs = item.data!;
          return ListView.builder(
            itemCount: audioQueryController.songs.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    margin: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54),
                      //color: Colors.transparent,
                    ),
                    child: GetBuilder<OnAudioQueryController>(
                        builder: (_) {
                          return ListTile(
                            leading: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(0),
                                  constraints: const BoxConstraints(
                                    maxHeight: 50,
                                    maxWidth: 50,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(
                                        15),
                                  ),
                                  child: ArtWorkWidget(
                                    artworkSize: 200,
                                    audioQueryController:
                                    audioQueryController,
                                    index: index,
                                  ),
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Container(
                                  constraints: BoxConstraints(
                                      minWidth: size.width * 0.5,
                                      maxWidth: size.width * 0.6),
                                  padding: const EdgeInsets.all(5),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        audioQueryController
                                            .songs[index].title,
                                        style:  TextStyle(
                                          color: selectedIndexController.selectedIndex ==
                                              index ? const Color(0xFFDC5F00) : Colors.white,
                                          fontSize: 15,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        audioQueryController
                                            .songs[index].artist!,
                                        style:  TextStyle(
                                            color: selectedIndexController.selectedIndex ==
                                                index ? const Color(0xFFDC5F00) : Colors.white,
                                            fontSize: 10),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                FontAwesomeIcons.ellipsisVertical,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            tileColor:
                            selectedIndexController.selectedIndex ==
                                index
                                ? Color(0xFFCC3609)
                                : Colors.black87.withOpacity(0.8),
                            onTap: () async {
                              selectedIndexController.updateIndex(
                                  index);
                              await audioQueryController.justAudioPlayer
                                  .setAudioSource(
                                audioQueryController.createPlayList(
                                    audioQueryController.songs),
                                initialIndex: index,
                              );
                              await audioQueryController.justAudioPlayer
                                  .play();
                              audioQueryController.isPlaying.value =
                              !audioQueryController.isPlaying.value;
                            },
                          );
                        }),
                  ),
                ],
              );
            },
          );
        });
  }
}

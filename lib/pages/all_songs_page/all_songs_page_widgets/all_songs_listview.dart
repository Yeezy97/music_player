import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:music_player/controllers/audio_query_controller.dart';
import 'package:music_player/pages/all_songs_page/all_songs_page_widgets/artwork_widget.dart';
import 'package:on_audio_query/on_audio_query.dart';

class AllSongsListView extends StatelessWidget {
  AllSongsListView({
    Key? key,
    required this.size,
  }) : super(key: key);
  final Size size;
  final ScrollController _firstController = ScrollController();

  @override
  Widget build(BuildContext context) {
    OnAudioQueryController audioQueryController =
        Get.put(OnAudioQueryController());

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

              /// don't forget permission alternatives (allow/deny)
            );
          }
          //audioQueryController.songs.clear();
          audioQueryController.songs = item.data!;
          //selectedIndexController.selectedIndex.value = audioQueryController.currentIndex;
          return Scrollbar(
            controller: _firstController,
            thickness: 3,

            child: ListView.builder(
              itemCount: audioQueryController.songs.length,
              itemBuilder: (context, index) {
                //audioQueryController.currentIndex = index;
                final song = audioQueryController.songs[index];

                return Column(
                  children: [
                    Container(
                      child: GetBuilder<OnAudioQueryController>(builder: (_) {
                        return ListTile(
                          leading: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container( /// ARTWORK WIDGET
                                constraints: const BoxConstraints(
                                  maxHeight: 50,
                                  maxWidth: 50,
                                ),
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                ),
                                child: ArtWorkWidget(
                                  artworkSize: 200,
                                  audioQueryController: audioQueryController,
                                  index: index,
                                ),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Row(
                                children: [
                                  Container(
                                    constraints: BoxConstraints(
                                        minWidth: size.width * 0.57,
                                        maxWidth: size.width * 0.57),
                                    padding: const EdgeInsets.all(3),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          audioQueryController
                                              .songs[index].title,
                                          style: TextStyle(
                                            color: audioQueryController
                                                        .currentIndex ==
                                                    index
                                                ? Theme.of(context).secondaryHeaderColor
                                            //const Color(0xFFDC5F00)
                                                : Theme.of(context)
                                                    .primaryColor,
                                            fontSize: 15,
                                            fontWeight: audioQueryController.currentIndex == index
                                                ? FontWeight.w600
                                                : FontWeight.w500,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          audioQueryController
                                              .songs[index].artist!,
                                          style: TextStyle(
                                            color: audioQueryController
                                                        .currentIndex ==
                                                    index
                                                ? Theme.of(context).secondaryHeaderColor
                                            //const Color(0xFFDC5F00)
                                                : Theme.of(context)
                                                    .primaryColor,
                                            fontSize: 11,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(1),
                                    width: 31,
                                    height: 31,
                                    child: IconButton(
                                        onPressed: () {
                                          audioQueryController
                                              .toggleFavorite(song);
                                        },
                                        icon: audioQueryController
                                                .isFavoriteSong(song)
                                            ? Icon(
                                                Icons.favorite,
                                                color: Theme.of(context).secondaryHeaderColor,
                                          size: 16,
                                              )
                                            : Icon(
                                                Icons.favorite_border,
                                                color: Theme.of(context).primaryColor,
                                          size: 16,
                                              ),
                                      splashRadius: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          trailing: Container(
                            margin: const EdgeInsets.all(1),
                            width: 31,
                            height: 31,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                FontAwesomeIcons.ellipsisVertical,
                                color: Theme.of(context).primaryColor,
                                size: 18,
                              ),
                              splashRadius: 15,
                              padding: const EdgeInsets.all(0),

                            ),
                          ),
                          tileColor: audioQueryController.currentIndex == index
                              ? Theme.of(context).primaryColor.withOpacity(0.15)
                          //Color(0xFFFFFFFF).withOpacity(0.2)
                              : Theme.of(context).primaryColorLight,
                          onTap: () async {
                            // selectedIndexController.updateIndex(
                            //     index);
                            await audioQueryController.justAudioPlayer
                                .setAudioSource(
                              audioQueryController
                                  .createPlayList(audioQueryController.songs),
                              initialIndex: index,
                            );
                            if (audioQueryController.isPlaying.value == false) {
                              audioQueryController.justAudioPlayer.play();
                              audioQueryController.isPlaying.value =
                                  !audioQueryController.isPlaying.value;
                            }
                          },
                        );
                      }),
                    ),
                  ],
                );
              },
            ),
          );
        });
  }
}

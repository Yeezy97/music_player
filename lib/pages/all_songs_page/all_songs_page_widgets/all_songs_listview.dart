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

    return FutureBuilder<List<SongModel>>( /// Load each song from Storage into songs list
        future: audioQueryController.importSongs(),
        builder: (context, AsyncSnapshot item) {
          // loading content indicator
          if (item.data == null) {
            return  const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (item.data!.isEmpty) {
            return  const Center(
              child: Text(" No Songs Found"),

              /// don't forget permission alternatives (allow/deny)
            );
          }
          //audioQueryController.songs.clear();
          audioQueryController.songs = item.data!;
          audioQueryController.searchedSongs = audioQueryController.songs;
          print(audioQueryController.songs.length);
          print("test songs list length is : ${audioQueryController.testSongs.length}");

          return Scrollbar(
            controller: _firstController,
            thickness: 3,
            child: ListView.builder( /// Songs Playlist Builder
              itemCount: audioQueryController.searchedSongs.length ,
              itemBuilder: (context, index) {
                final song = audioQueryController.searchedSongs[index];

                return Column(
                  children: [
                    Container(
                      child: GetBuilder<OnAudioQueryController>(builder: (_) {
                        return ListTile(
                          leading: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container( /// ARTWORK WIDGET
                                constraints:  const BoxConstraints(
                                  maxHeight: 50,
                                  maxWidth: 50,
                                ),
                                decoration:  const BoxDecoration(
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
                                    padding:  const EdgeInsets.all(3),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text( /// SONG TITLE WIDGET
                                          audioQueryController
                                              .searchedSongs[index].title,
                                          style: TextStyle(
                                            color: audioQueryController
                                                        .currentIndex ==
                                                    index
                                                ? Theme.of(context).secondaryHeaderColor
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
                                        Text( /// ARTIST NAME WIDGET
                                          audioQueryController
                                              .searchedSongs[index].artist!,
                                          style: TextStyle(
                                            color: audioQueryController
                                                        .currentIndex ==
                                                    index
                                                ? Theme.of(context).secondaryHeaderColor
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
                                  Container( /// FAVORITE BUTTON
                                    margin:  const EdgeInsets.all(1),
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
                          trailing: Container( /// SONG PARAMETERS BUTTON
                            margin:  const EdgeInsets.all(1),
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
                              padding:  const EdgeInsets.all(0),

                            ),
                          ),
                          tileColor: audioQueryController.currentIndex == index /// TILE COLOR CONDITIONS
                              ? Theme.of(context).primaryColor.withOpacity(0.15)
                              : Theme.of(context).primaryColorLight,
                          onTap: () async {
                            await audioQueryController.justAudioPlayer /// PLAY SONG FROM STORAGE ON TAP
                                .setAudioSource(
                              audioQueryController
                                  .createPlayList(audioQueryController.searchedSongs),
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

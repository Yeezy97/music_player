import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/controllers/audio_query_controller.dart';
import 'package:music_player/controllers/selected_index_controller.dart';
import 'package:music_player/pages/settings_page.dart';
import 'package:music_player/pages/song_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../controllers/drawer_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'all_songs_page_widgets/artwork_widget.dart';

class AllSongsPage extends StatelessWidget {
  const AllSongsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SelectedIndexController selectedIndexController =
    Get.put(SelectedIndexController());
    OnAudioQueryController audioQueryController =
    Get.put(OnAudioQueryController());
    Size size = MediaQuery
        .of(context)
        .size;
    DrawerControllerImp drawerControllerImp = Get.put(DrawerControllerImp());

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: MaterialButton(
            shape: const CircleBorder(),
            //color: Color(0xFFE0DCCE),
            color: const Color(0xFF010101),
            minWidth: 35,
            enableFeedback: false,
            padding: const EdgeInsets.all(3),
            height: 10,
            elevation: 8,
            onPressed: () {
              drawerControllerImp.toggle();
            },
            child: const Icon(
              Icons.menu,
              size: 22,
              color: Color(0xFFDC5F00),
            ),
          ),
        ),
        title: const Text(
          "All Songs",
          style: TextStyle(
            color: Color(0xFFDC5F00),
          ),
        ),
        elevation: 0,
        backgroundColor: const Color(0xFF181818),
        actions: [
          GestureDetector(
            // search button
            child: Container(
              margin: const EdgeInsets.only(right: 5),
              color: Colors.transparent,
              width: 40,
              height: 40,
              child: const Icon(Icons.search),
            ),
            onTap: () {},
          ),
          GestureDetector(
            // settings button
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              color: Colors.transparent,
              width: 40,
              height: 40,
              child: const Icon(Icons.settings),
            ),
            onTap: () {
              Get.to(() => const SettingsPage());
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
              image: const DecorationImage(
                  opacity: 0.1,
                  image: AssetImage("assets/images/music_note_background4.png"),
                  fit: BoxFit.cover),
            ),
            child: FutureBuilder<List<SongModel>>(
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
                }),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              decoration: const BoxDecoration(
                  color: Color(0xFF181818),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10))),
              height: 70,
              width: size.width * 0.39,
              child: Row(
                children: [
                  Padding(
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
                          gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.black,
                                Color(0xFF181818),
                              ]),
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
                                      offset: Offset(5, 5),
                                      blurRadius: 5,
                                      color: Colors.black45)
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
                                          style: const TextStyle(
                                            color: Color(0xFFDC5F00),
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
                                          style: const TextStyle(
                                            color: Color(0xFFDC5F00),
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
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FontAwesomeIcons.backwardStep,
                        color: Colors.white,
                        size: 18,
                      )),
                  GestureDetector(
                    onTap: () async {
                      if (audioQueryController.isPlaying.value == true) {
                        await audioQueryController.justAudioPlayer.pause();
                      } else {
                        await audioQueryController.justAudioPlayer.play();
                        audioQueryController.isPlaying.value =
                        !audioQueryController.isPlaying.value;
                      }
                    },
                    child: Obx(() {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.all(8),
                        height: 47,
                        width: 47,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                color: audioQueryController.isPlaying.value
                                    ? const Color(0xFFDC5F00)
                                    : Colors.black,
                              ),
                            ]),
                        child: Icon(
                          audioQueryController.isPlaying.value
                              ? FontAwesomeIcons.pause
                              : FontAwesomeIcons.play,
                          color: const Color(0xFFDC5F00),
                          size: 18,
                        ),
                      );
                    }),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FontAwesomeIcons.forwardStep,
                        color: Colors.white,
                        size: 18,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/constants.dart';
import 'package:music_player/controllers/audio_controller.dart';
import 'package:music_player/controllers/audio_query_controller.dart';
import 'package:music_player/pages/settings_page.dart';
import 'package:music_player/pages/song_page.dart';
import 'package:music_player/songs_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../controllers/drawer_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';

class AllSongsPage extends StatelessWidget {
  const AllSongsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //OnAudioQuery onAudioQuery = OnAudioQuery();
    OnAudioQueryController audioQueryController = Get.put(
        OnAudioQueryController());
    Size size = MediaQuery
        .of(context)
        .size;
    DrawerControllerImp drawerControllerImp = Get.put(DrawerControllerImp());
    AudioController audioController = Get.put(AudioController());
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: MaterialButton(
            shape: CircleBorder(),
            //color: Color(0xFFE0DCCE),
            color: Color(0xFF010101),
            minWidth: 35,
            enableFeedback: false,
            padding: EdgeInsets.all(3),
            height: 10,
            elevation: 8,
            //TODO: drawer on tap function here
            onPressed: () {
              drawerControllerImp.toggle();
            },

            child: Icon(
              Icons.menu,
              size: 22,
              color: Color(0xFFDC5F00),
            ),
          ),
        ),
        title: Text(
          "All Songs",
          style: TextStyle(
            color: Color(0xFFDC5F00),
          ),
        ),
        elevation: 0,
        backgroundColor: Color(0xFF181818),
        actions: [
          GestureDetector(
            // search button
            child: Container(
              margin: EdgeInsets.only(right: 5),
              color: Colors.transparent,
              width: 40,
              height: 40,
              child: Icon(Icons.search),
            ),
            onTap: () {},
          ),
          GestureDetector(
            // settings button
            child: Container(
              margin: EdgeInsets.only(right: 20),
              color: Colors.transparent,
              width: 40,
              height: 40,
              child: Icon(Icons.settings),
            ),
            onTap: () {
              Get.to(() => SettingsPage());
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black45.withOpacity(0.5),
              image: DecorationImage(
                  opacity: 0.4,
                  image: AssetImage("assets/images/background3.jpg"),
                  fit: BoxFit.fill),
            ),
            //color: Colors.white70,
            //color: Color(0xFF282A3A),
            child: GetBuilder<OnAudioQueryController>(builder: (audioQueryController) {
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
                      return const Center(child: CircularProgressIndicator(),);
                    }
                    if (item.data!.isEmpty) {
                      return const Center(child: Text(" No Songs Found"),);
                    }
                    return ListView.builder(
                      itemCount: item.data!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 3),
                              margin: EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black54),
                                  color: Colors.black45.withOpacity(0.8)
                                //color: Colors.transparent
                                //color: Color(0xCC23223A),
                                //color: Color(0xA8210B00),
                                //color: Color(0xFF282A3A)
                                //color: Color(0x916D5E57),
                              ),
                              child: ListTile(
                                leading: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(3),
                                      constraints: const BoxConstraints(
                                        maxHeight: 50,
                                        maxWidth: 50,
                                      ),
                                      child: QueryArtworkWidget(
                                        id: item.data![index].id,
                                        type: ArtworkType.AUDIO,
                                      ),
                                      // child: Image.asset(
                                      //   "assets/images/musicLogo.png",
                                      //   fit: BoxFit.fill,
                                      //   color: Colors.white,
                                      // ),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            item.data![index].title,
                                            style: TextStyle(color: Colors.white,
                                            fontSize: 15,),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            item.data![index].displayName,
                                            style: TextStyle(color: Colors.white, fontSize: 10),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                      ),
                                      constraints: BoxConstraints(
                                        minWidth: size.width * 0.6,
                                        maxWidth: size.width * 0.6
                                      ),
                                      padding: EdgeInsets.all(5),
                                    ),
                                  ],
                                ),
                                trailing: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    FontAwesomeIcons.ellipsisVertical,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                tileColor: Colors.white70.withOpacity(0.9),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
              );
            }),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFF181818),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10))),
              height: 70,
              width: double.infinity,
              child: Row(
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => SongPage());
                      },
                      child: Container(
                        padding:
                        EdgeInsets.symmetric(vertical: 4, horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.black,
                                Color(0xFF181818),
                              ]),
                        ),
                        height: 60,
                        width: size.width * 0.38,
                        child: Row(
                          children: [
                            Container(
                              //margin: EdgeInsets.all(4),
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(5, 5),
                                      blurRadius: 5,
                                      color: Colors.black45)
                                ],
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/weekndlogo1.jpg"),
                                  fit: BoxFit.fill,
                                ),
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ), // song thumbnail
                            SizedBox(
                              width: 8,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Artist",
                                  style: TextStyle(
                                    color: Color(0xFFDC5F00),
                                  ),
                                ),
                                Text(
                                  "Song Name",
                                  style: TextStyle(
                                    color: Color(0xFFDC5F00),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.15,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.backwardStep,
                        color: Colors.white,
                        size: 18,
                      )),
                  GestureDetector(
                    onTap: () async {
                      audioController.isPlaying.value =
                      !audioController.isPlaying.value;
                      if (audioController.isPlaying.value == false) {
                        await audioController.audioPlayer.pause();
                      } else {
                        var path = AssetSource("music/ilira.mp3");
                        await audioController.audioPlayer.play(path);
                      }
                      //buttonController.play();
                    },
                    child: Obx(() {
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        padding: EdgeInsets.all(8),
                        height: 47,
                        width: 47,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 8,
                                color: audioController.isPlaying.value
                                    ? Color(0xFFDC5F00)
                                    : Colors.black,
                              ),
                            ]),
                        child: Icon(
                          audioController.isPlaying.value
                              ? FontAwesomeIcons.pause
                              : FontAwesomeIcons.play,
                          color: Color(0xFFDC5F00),
                          size: 18,
                        ),
                      );
                    }),
                  ),

                  // MaterialButton(
                  //   minWidth: 47,
                  //   enableFeedback: false,
                  //   padding: EdgeInsets.all(8),
                  //   height: 47,
                  //   elevation: 5,
                  //
                  //   onPressed: () {},
                  //   color: Colors.white,
                  //   shape: CircleBorder(),
                  //   child: Icon(
                  //     FontAwesomeIcons.play,
                  //     color: Color(0xFFDC5F00),
                  //     size: 18,
                  //   ),
                  // ),
                  // IconButton(
                  //   color: Colors.white,
                  //     style: IconButton.styleFrom(
                  //       backgroundColor: Colors.white,
                  //       shape: CircleBorder(),
                  //     ),
                  //     onPressed: () {}, icon: Icon(FontAwesomeIcons.play)),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
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

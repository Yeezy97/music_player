import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/components/play_and_pause_button.dart';
import 'package:music_player/controllers/audio_query_controller.dart';
import 'package:music_player/controllers/selected_index_controller.dart';
import 'package:music_player/pages/all_songs_page/all_songs_page_widgets/all_songs_listview.dart';
import 'package:music_player/pages/all_songs_page/all_songs_page_widgets/song_info_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../controllers/drawer_controller.dart';
import 'all_songs_page_widgets/songs_page_appbar.dart';

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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
          child: SongsPageAppBar(drawerControllerImp: drawerControllerImp,)),
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
            child: AllSongsListView(audioQueryController: audioQueryController, size: size, selectedIndexController: selectedIndexController),
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
                  SongInfoContainer(size: size, audioQueryController: audioQueryController),
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
                  PlayAndPauseButton(audioQueryController: audioQueryController),
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


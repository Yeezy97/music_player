import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/components/play_and_pause_button.dart';
import 'package:music_player/controllers/audio_query_controller.dart';
import 'package:music_player/controllers/selected_index_controller.dart';
import 'package:music_player/controllers/theme_controller.dart';
import 'package:music_player/pages/all_songs_page/all_songs_page_widgets/all_songs_listview.dart';
import 'package:music_player/pages/all_songs_page/all_songs_page_widgets/song_info_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../controllers/drawer_controller.dart';
import 'all_songs_page_widgets/songs_page_appbar.dart';

class AllSongsPage extends StatelessWidget {
  const AllSongsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());
    OnAudioQueryController audioQueryController =
    Get.put(OnAudioQueryController());
    Size size = MediaQuery
        .of(context)
        .size;
    DrawerControllerImp drawerControllerImp = Get.put(DrawerControllerImp());
    SelectedIndexController selectedIndexController = Get.put(SelectedIndexController());

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
          child: SongsPageAppBar(drawerControllerImp: drawerControllerImp,)),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              //color: Color(0xffE8E2E2),
              //color: Theme.of(context).primaryColorLight,
              //color: Colors.black.withOpacity(0.9),
              image:  DecorationImage(
                  opacity: themeController.lightMode ? 0.15 : 0.15,
                  image: AssetImage("assets/images/long_background.png"),
                  fit: BoxFit.cover),
            ),
            child: AllSongsListView( size: size,),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              decoration:  BoxDecoration(
                  //color: Color(0xFF181818),
                color: Theme.of(context).cardColor,
                  borderRadius: const BorderRadius.only(
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
                      onPressed: () {
                        audioQueryController.justAudioPlayer.seekToPrevious();
                      },
                      icon:  const Icon(
                        FontAwesomeIcons.backwardStep,
                        //color: Theme.of(context).iconTheme.color,
                        size: 18,
                      )),
                  PlayAndPauseButton(audioQueryController: audioQueryController),
                  IconButton(
                      onPressed: () {
                        audioQueryController.justAudioPlayer.seekToNext();
                        // selectedIndexController.updateIndex(audioQueryController.currentIndex);
                      },
                      icon:  const Icon(
                        FontAwesomeIcons.forwardStep,
                        //color: Theme.of(context).iconTheme.color,
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


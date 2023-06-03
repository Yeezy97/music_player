import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/controllers/audio_query_controller.dart';
import 'package:music_player/controllers/search_controller.dart';

import '../../../controllers/drawer_controller.dart';
import '../../settings_page/settings_page.dart';

class SongsPageAppBar extends StatelessWidget {
  SongsPageAppBar({
    Key? key,
    required this.drawerControllerImp,
  }) : super(key: key);

  final DrawerControllerImp drawerControllerImp;

  // final SearchController searchController = Get.put(
  //     SearchController());
  @override
  Widget build(BuildContext context) {
    OnAudioQueryController audioQueryController =
    Get.put(OnAudioQueryController());


    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: MaterialButton(
          shape: const CircleBorder(),
          splashColor: Colors.transparent,
          //color: Theme.of(context).primaryColor,
          //color: Color(0xFFE0DCCE),
          //color: const Color(0xFF010101),
          minWidth: 35,
          enableFeedback: false,
          padding: const EdgeInsets.all(3),
          height: 10,
          elevation: 8,
          onPressed: () {
            drawerControllerImp.toggle();
          },
          child: Icon(
            Icons.menu,
            size: 22,
            //color: Color(0xFFDC5F00), // orange
            //color: Color(0xFF262A56),
            color: Theme
                .of(context)
                .primaryColor,
          ),
        ),
      ),
      title: Text(
        "All Songs",
        style: TextStyle(
          //color: Color(0xFFDC5F00), // orange
          color: Theme
              .of(context)
              .primaryColor,
        ),
      ),
      elevation: 0,
      backgroundColor: Theme
          .of(context)
          .cardColor,
      actions: [
        // GestureDetector(
        //   // search button
        //   child: Container(
        //     margin:  const EdgeInsets.only(right: 5),
        //     color: Colors.transparent,
        //     width: 40,
        //     height: 40,
        //     child:  Icon(Icons.search, color: Theme.of(context).iconTheme.color,),
        //   ),
        //   onTap: () {},
        // ),
        Center(
          child: Container(
            width: 150,
            height: 30,
            child: TextField(
              controller: audioQueryController.searchController,
              onChanged: (value) {
                audioQueryController.searchSong(value);
                audioQueryController.updateListLength();
                print(audioQueryController.searchedSongs.length);
              },
              decoration: const InputDecoration(
                labelText: 'Search',
                suffixIcon: Icon(Icons.search, color: Colors.blue,),
              ),
            ),
          ),
        ),
        GestureDetector(
          // settings button
          child: Container(
            margin: const EdgeInsets.only(right: 20),
            color: Colors.transparent,
            width: 40,
            height: 40,
            child: Icon(Icons.settings, color: Theme
                .of(context)
                .iconTheme
                .color,),
          ),
          onTap: () {
            Get.to(() => const SettingsPage());
          },
        ),
      ],
    );
  }
}

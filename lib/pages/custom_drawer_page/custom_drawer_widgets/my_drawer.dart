import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/components/play_list_tile.dart';
import 'package:music_player/controllers/drawer_controller.dart';
import 'package:music_player/controllers/settings_controller.dart';
import 'package:music_player/controllers/theme_controller.dart';
import 'package:music_player/pages/settings_page/settings_page.dart';

import 'drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController settingsController = Get.put(SettingsController());
    DrawerControllerImp drawerController = Get.put(DrawerControllerImp());
    ThemeController themeController = Get.put(ThemeController());
    Size size = MediaQuery
        .of(context)
        .size;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white
        //color: Color(0xFFFAF9F6),
        //color: Colors.black,
        //gradient: vividYellowGradientColor,
        // gradient: LinearGradient(
        //     begin: Alignment.centerLeft,
        //     end: Alignment.centerRight,
        //     colors: [
        //       //Color(0xFFFAF9F6),
        //       Color(0x91CBC1BA),
        //       //Colors.black,
        //       //Color(0xFF246EE9), // royal blue
        //       //Color(0xFFFF2400), //  scarlet red
        //       //Color(0xFF0C3365), // dark blue
        //       Colors.white24
        //     ]),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              width: size.width / 2,
              height: size.height / 6,
              child: Text(
                "Music \n  Player",
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 27.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: size.width * 0.6,
              height: size.height * 0.7,
              child: ListView(
                children: [
                  const DrawerTile(
                      tileIcon: Icons.music_note, drawerTileText: "All Songs"),
                  DrawerTile(
                    tileIcon: Icons.play_arrow_outlined,
                    drawerTileText: "Current Song",
                    ontap: () {
                      drawerController.goToMusicScreen();
                    },
                  ),
                  DrawerTile(tileIcon: Icons.favorite, drawerTileText: "Favorites"),
                  ExpansionTile(
                    title: Row(
                      children: [
                        Icon(Icons.playlist_play),
                        SizedBox(width: 10,),
                        Text(
                          "Playlists",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45),
                        ),
                      ],
                    ),
                    children: [
                      PlayListTile(tileText: "Metal"),
                      PlayListTile(tileText: "Pop"),
                      PlayListTile(tileText: "Jazz"),
                    ],
                  ),
                  DrawerTile(
                    ontap: (){
                      Get.to(SettingsPage());
                    },
                      tileIcon: Icons.settings, drawerTileText: "Settings"),
                  DrawerTile(tileIcon: Icons.brush, drawerTileText: "Themes"),
                  GetBuilder<ThemeController>(builder: (_) {
                    return DrawerTile(ontap: () {
                      // settingsController.lightModeSwitch();
                      themeController.changeTheme();
                    },
                      tileIcon: Icons.light_mode,
                      drawerTileText: "Light Mode",
                      trailingWidget: Switch.adaptive(
                          value: themeController.lightMode,
                          onChanged: (_) {
                            themeController.changeTheme();
                          }),);
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
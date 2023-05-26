import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:music_player/components/settings_expansion_tile.dart';
import 'package:music_player/components/settings_list_tile.dart';
import 'package:music_player/constants.dart';
import 'package:music_player/controllers/audio_query_controller.dart';
import 'package:music_player/controllers/settings_controller.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OnAudioQueryController audioQueryController = Get.put(OnAudioQueryController());
    SettingsController settingsController = Get.put(SettingsController());
    return Container(
      decoration: BoxDecoration(
        //gradient: vividYellowGradientColor,
        color: Color(0xFF181818),
      ),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          body: ListView(
            children: [
              SettingsExpansionTile(tileTitle: Text("Audio", style: settingsExpTileTextStyle,),
              tileChildren: [
                SettingsListTile(tileTitle: "Fading on pause/play", tileSubTitle: "Smooth fading on pause or resume playback",
                trailingWidget: GetBuilder<SettingsController>(
                    builder: (settingsController) {
                      return Transform.scale(
                        scale: 1,
                        child: Switch.adaptive(
                          value: settingsController.isFadingOn,
                          onChanged: (bool) {
                            settingsController.fadingSwitch();
                            audioQueryController.justAudioPlayer.setSkipSilenceEnabled(settingsController.isFadingOn);
                          },
                        ),
                      );
                    }),),
                SettingsListTile(tileTitle: "Gapless", tileSubTitle: "Next track starts instantly without a gap", trailingWidget:
                GetBuilder<SettingsController>(
                    builder: (settingsController) {
                      return Transform.scale(
                        scale: 1,
                        child: Switch.adaptive(
                          value: settingsController.isGaplessOn,
                          onChanged: (bool) {
                            settingsController.gaplessSwitch();
                          },
                        ),
                      );
                    }),)
              ],),
              SettingsExpansionTile(tileTitle: Text("Controls",style: settingsExpTileTextStyle,), tileChildren: [
                SettingsListTile(tileTitle: "Resume after call", tileSubTitle: "Resume playing after a call if was playing before",
                trailingWidget: GetBuilder<SettingsController>(
                    builder: (settingsController) {
                      return Transform.scale(
                        scale: 1,
                        child: Switch.adaptive(
                          value: settingsController.isResumeAfterCallOn,
                          onChanged: (bool) {
                            settingsController.resumeAfterCallSwitch();
                          },
                        ),
                      );
                    }),),
              ]),
              SettingsExpansionTile(tileTitle: Text("Themes", style: settingsExpTileTextStyle,), tileChildren: []),
              SettingsExpansionTile(tileTitle: Text("Equalizer", style: settingsExpTileTextStyle,), tileChildren: []),
            ],
          ),
        ),
      ),
    );
  }
}

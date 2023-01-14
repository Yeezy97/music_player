import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

class OnAudioQueryController extends GetxController{
  OnAudioQuery onAudioQuery = OnAudioQuery();
  List<SongModel> songs = [];
  String currentSongTitle = '';
  int currentIndex = 0;
  bool isPlayerViewVisible = false;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    requestStoragePermission();
  }

  void requestStoragePermission() async{
    // only if platform is not web, cuz web has no permissions
    if(!kIsWeb){
      bool permissionStatus = await onAudioQuery.permissionsStatus();
      if(!permissionStatus){
        await onAudioQuery.permissionsRequest();
      }
      update();
    }
  }

}


import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:just_audio/just_audio.dart';

class OnAudioQueryController extends GetxController{
  Rx<bool> isPlaying = false.obs;
  Rx<Duration> songDuration = Duration.zero.obs;
  Rx<Duration> songPosition = Duration.zero.obs;
  AudioPlayer justAudioPlayer = AudioPlayer();
  OnAudioQuery onAudioQuery = OnAudioQuery();
  List<SongModel> songs = [];
  List<SongModel> favoriteSongs = [];
  String currentSongTitle = ' ';
  String currentSongArtist = ' ';
  int currentIndex = 0;
  bool isPlayerViewVisible = false;
  bool isSelectedTile = false;
  bool isFavorite = false;
  //int selectedIndex =0 ;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    createPlayList(songs);
    requestStoragePermission();
    justAudioPlayer.durationStream.listen((newDuration) {
      songDuration.value = newDuration!;
    });
    justAudioPlayer.positionStream.listen((newPosition) {
      songPosition.value = newPosition;
    });

    isPlaying.value = justAudioPlayer.playing; /// dont forget this fuckn shit

    // justAudioPlayer.playingStream.listen((state) {
    //   isPlaying.value  = state ;
    // });
    justAudioPlayer.currentIndexStream.listen((index) { // responsible for playing/pausing selected song
      if(index != null){
        updateCurrentPlayingSongDetails(index);
      }
    });
  }

  bool isFavoriteSong(SongModel song){
    return favoriteSongs.contains(song);
  }

  void toggleFavorite(SongModel song){
    if(isFavoriteSong(song)){
      favoriteSongs.remove(song);
    }else {
      favoriteSongs.add(song);
    }
    update();
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
  String formatTime(Duration duration){
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return[
      if(duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  void updateCurrentPlayingSongDetails (int index){
    if(songs.isNotEmpty){
      currentSongTitle = songs[index].title;
      currentSongArtist = songs[index].artist!;
      currentIndex = index;
    }
    update();
  }
  ConcatenatingAudioSource createPlayList(List<SongModel> songs) {
    List<AudioSource> sources = [];
    for (var song in songs){
      sources.add(AudioSource.uri(Uri.parse(song.uri!)));
    }
    return ConcatenatingAudioSource(children: sources);
  }
}

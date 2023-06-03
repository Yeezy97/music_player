import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:just_audio/just_audio.dart';
import '../constants.dart';

class OnAudioQueryController extends GetxController{
  late TextEditingController searchController;
  Rx<bool> isPlaying = false.obs;
  Rx<Duration> songDuration = Duration.zero.obs;
  Rx<Duration> songPosition = Duration.zero.obs;
  AudioPlayer justAudioPlayer = AudioPlayer();
  OnAudioQuery onAudioQuery = OnAudioQuery();
  late List<SongModel> songs = [];
  late List<SongModel> searchedSongs = songs; /// remove this when done
  List<SongModel> favoriteSongs = [];
  String currentSongTitle = ' ';
  String currentSongArtist = ' ';
  int currentIndex = 0;
  bool isPlayerViewVisible = false;
  bool isSelectedTile = false;
  bool isFavorite = false;
  bool isShuffling = false;
  var selectedRepeatOption = RepeatOptions.values.first;
  int enumIndex = 0;
  late int searchedSongsListLength;
  List<SongModel> testSongs = [];


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    updateListLength();
    importSongs();

    searchController = TextEditingController();
    enumIndex == 0 ? justAudioPlayer.setLoopMode(LoopMode.off) : null;
    createPlayList(songs);
    //searchedSongs = songs;
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
    return ConcatenatingAudioSource(children: sources, useLazyPreparation: true, shuffleOrder: DefaultShuffleOrder(), );
  }
  // This function is called whenever the text field changes

  void searchSong(String enteredKeyword) {
    if(enteredKeyword.isEmpty){
      searchedSongs = songs;
    } else{
      final suggestions = songs.where((song){
        final searchedSongTitle = song.displayName.toLowerCase();
        final input =  enteredKeyword.toLowerCase();
        return searchedSongTitle.contains(input);
      }).toList();
      searchedSongs = suggestions;
    }
    update();
  }
  Future<List<SongModel>> importSongs()async{
     testSongs = await OnAudioQuery().querySongs(
      sortType: null,
      orderType: OrderType.ASC_OR_SMALLER,
      uriType: UriType.EXTERNAL,
      ignoreCase: true,
    );
    return testSongs;
  }

  updateListLength(){
    searchedSongsListLength = songs.length;
    update();
  }


}


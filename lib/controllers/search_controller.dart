// import 'package:get/get.dart';
// import 'package:music_player/controllers/audio_query_controller.dart';
// import 'package:on_audio_query/on_audio_query.dart';
//
// class SearchController extends GetxController{
//   OnAudioQueryController audioQueryController = Get.put(OnAudioQueryController());
//
//   late List<SongModel> searchedSongs = audioQueryController.songs;
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//
//   }
//
//   void searchSong(String enteredKeyword) {
//     if(enteredKeyword.isEmpty){
//       searchedSongs = audioQueryController.songs;
//     } else{
//       final suggestions = audioQueryController.songs.where((song){
//         final searchedSongTitle = song.displayName.toLowerCase();
//         final input =  enteredKeyword.toLowerCase();
//         return searchedSongTitle.contains(input);
//       }).toList();
//       searchedSongs = suggestions;
//     }
//     update();
//   }
//
// }
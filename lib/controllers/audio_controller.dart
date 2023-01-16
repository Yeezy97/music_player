// import 'dart:async';
//
// import 'package:async/async.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:get/get.dart';
//
// class AudioController extends GetxController{
//   final audioPlayer = AudioPlayer();
//   Rx<bool> isPlaying = false.obs;
//   Rx<Duration> songDuration = Duration.zero.obs;
//   Rx<Duration> songPosition = Duration.zero.obs;
//
//
//   @override
//   void onInit() {
//     audioPlayer.onPlayerStateChanged.listen((state) {
//       isPlaying.value = state == PlayerState.playing;
//     });
//     audioPlayer.onDurationChanged.listen((newDuration) {
//       songDuration.value = newDuration;
//     });
//
//     audioPlayer.onPositionChanged.listen((newPosition) {
//       songPosition.value = newPosition;
//     });
//
//     //setAudio();
//     super.onInit();
//   }
//
//   Future setAudio()async{
//     //repeat song when completed
//     audioPlayer.setReleaseMode(ReleaseMode.loop);
//     //load audio from assets
//     final player = AudioCache(prefix: 'assets/music/');
//     final url = await player.load("ilira.mp3");
//     audioPlayer.setSourceUrl(url.path);
//   }
//
//   String formatTime(Duration duration){
//     String twoDigits(int n) => n.toString().padLeft(2, '0');
//     final hours = twoDigits(duration.inHours);
//     final minutes = twoDigits(duration.inMinutes.remainder(60));
//     final seconds = twoDigits(duration.inSeconds.remainder(60));
//     return[
//       if(duration.inHours > 0) hours,
//       minutes,
//       seconds,
//     ].join(':');
//   }
//
// }
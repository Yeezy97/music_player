import 'package:get/get.dart';

abstract class SongButtonController extends GetxController{
  play();
  pause();
  next();
  previous();
  shuffle();
  repeat();
}

class SongButtonControllerImp extends SongButtonController {

  bool isPlaying = true;
  @override
  next() {
    // TODO: implement next
    throw UnimplementedError();
  }

  @override
  pause() {
    // TODO: implement pause
    throw UnimplementedError();
  }

  @override
  play() {
    isPlaying = !isPlaying;
    print(isPlaying);
    update();
  }

  @override
  previous() {
    // TODO: implement previous

  }

  @override
  repeat() {
    // TODO: implement repeat
    throw UnimplementedError();
  }

  @override
  shuffle() {
    // TODO: implement shuffle
    throw UnimplementedError();
  }

}
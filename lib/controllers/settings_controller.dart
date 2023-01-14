import 'package:get/get.dart';

class SettingsController extends GetxController{
   bool isFadingOn = true;
  // bool isSwitchedOn = true;
   bool isGaplessOn = true;
   bool isResumeAfterCallOn = true;


  void fadingSwitch() {
    isFadingOn = !isFadingOn;
    update();
  }
  void gaplessSwitch() {
    isGaplessOn = !isGaplessOn;
    update();
  }
  void resumeAfterCallSwitch() {
    isResumeAfterCallOn = !isResumeAfterCallOn;
    update();
  }




}
import 'package:get/get.dart';

class SettingsController extends GetxController{
   bool isFadingOn = true;
   bool isGaplessOn = true;
   bool isResumeAfterCallOn = true;
   bool isLightMode = false;

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
  void lightModeSwitch(){
    isLightMode = !isLightMode;
    update();
  }
}
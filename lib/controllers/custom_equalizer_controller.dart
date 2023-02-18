import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class CustomEqualizerController extends GetxController{
   CustomEqualizerController({this.maxDecibels, this.minDecibels, this.centerFrequency, this.gain, this.lowerFrequency, this.upperFrequency});
  bool isEnabled = false;
  final double? minDecibels;
  final double? maxDecibels;
  final List<AndroidEqualizerBand> bands = [];
  final double? centerFrequency;
  final double? gain;
  final double? lowerFrequency;
  final double? upperFrequency;

  @override
  void onInit() {
    // TODO: implement onInit
    AndroidEqualizerParameters(minDecibels: minDecibels!, maxDecibels: maxDecibels!, bands: bands);
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


}
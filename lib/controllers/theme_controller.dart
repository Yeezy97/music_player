import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController{

  bool lightMode = false;

  changeTheme() {
    if(lightMode == false) {
      Get.changeThemeMode(ThemeMode.light);
      lightMode = !lightMode;
    }
    else {
      Get.changeThemeMode(ThemeMode.dark);
      lightMode = !lightMode;
    }
    update();
  }
}
import 'package:get/get.dart';

class SelectedIndexController extends GetxController{
  int selectedIndex = 0;
  updateIndex(int newIndex){
    selectedIndex = newIndex;
    update();
  }

}
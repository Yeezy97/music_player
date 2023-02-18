import 'package:get/get.dart';

class SelectedIndexController extends GetxController{
  RxInt selectedIndex = 0.obs;
  updateIndex(int newIndex){
    selectedIndex.value = newIndex;
  }
}
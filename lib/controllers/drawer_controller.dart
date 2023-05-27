import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/song_page/song_page.dart';

abstract class DrawerController extends GetxController{
  open();
  close();
  toggle();
  onDragStart(DragStartDetails details);
  onDragUpdate(DragUpdateDetails details);
  onDragEnd(DragEndDetails details);
  goToMusicScreen();
}

class DrawerControllerImp extends DrawerController with GetSingleTickerProviderStateMixin{
  late AnimationController animationController;
  final int minDragStartEdge = 365;
  final int maxDragStartEdge = 0;
  late bool _canBeDragged;
  final double maxSlide = 225.0;
 @override
 void open() {
   animationController.forward();
 }
  @override
 void close() {
   animationController.reverse();
 }
  @override
 void toggle() => animationController.isDismissed
     ? animationController.forward()
     : animationController.reverse();
  @override
 void onDragStart(DragStartDetails details) {
   bool isDragOpenFromLeft = animationController.isDismissed &&
       details.globalPosition.dx < minDragStartEdge;
   bool isDragCloseFromRight = animationController.isCompleted &&
       details.globalPosition.dx > maxDragStartEdge;
   _canBeDragged = isDragOpenFromLeft || isDragCloseFromRight;
 }
  @override
 void onDragUpdate(DragUpdateDetails details) {
   if (_canBeDragged) {
     //print(details.globalPosition.dx);
     double delta = details.primaryDelta! / maxSlide;
     animationController.value += delta;
   }
 }

 @override
  void onDragEnd(DragEndDetails details) {
   if (animationController.isDismissed || animationController.isCompleted) {
     return;
   }
   if (details.velocity.pixelsPerSecond.dx.abs() >= 365.0) {
     double visualVelocity = details.velocity.pixelsPerSecond.dx /
         Get.size.width;

     animationController.fling(velocity: visualVelocity);
   } else if (animationController.value < 0.5) {
     close();
   } else {
     open();
   }
 }

  @override
  onInit(){
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  goToMusicScreen() {
    Get.to(const SongPage());
    Get.delete<DrawerControllerImp>();
  }
}

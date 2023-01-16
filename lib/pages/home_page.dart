import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/components/custom_drawer.dart';
import 'package:music_player/components/my_drawer.dart';
import 'package:music_player/controllers/drawer_controller.dart';
import 'package:music_player/pages/all_songs_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DrawerControllerImp controller = Get.put(DrawerControllerImp());
    double slide = controller.maxSlide * controller.animationController.value;
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragStart: controller.onDragStart,
        onHorizontalDragUpdate: controller.onDragUpdate,
        onHorizontalDragEnd: controller.onDragEnd,
        child: Stack(
          children: [
            Transform(
                transform: Matrix4.identity()
                  ..translate(slide),
                //..scale(scale),
                alignment: Alignment.centerLeft,
                child: AllSongsPage()),
            MyDrawer(),

          ],
        ),
      ),
    );
  }
}

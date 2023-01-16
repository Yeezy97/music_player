import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/controllers/drawer_controller.dart';
import 'package:music_player/pages/all_songs_page.dart';
import 'package:music_player/components/my_drawer.dart';

class NewCustomDrawer extends StatelessWidget {
  const NewCustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DrawerControllerImp controller = Get.put(DrawerControllerImp());
    return RepaintBoundary(
      child: Scaffold(
        body: GestureDetector(
          onHorizontalDragStart: controller.onDragStart,
          onHorizontalDragUpdate: controller.onDragUpdate,
          onHorizontalDragEnd: controller.onDragEnd,
          //onTap: toggle,
          child: AnimatedBuilder(
            animation: controller.animationController,
            builder: (BuildContext context, _) {
              double slide = controller.maxSlide * controller.animationController.value;
              print("build complete");
              //double scale = 1 - (controller.animationController.value * 0.3);

              return Stack(
                children: [
                  MyDrawer(),
                  Transform(

                      transform: Matrix4.identity()
                        ..translate(slide),
                      //..scale(scale),
                      alignment: Alignment.centerLeft,
                      child: AllSongsPage()),
                ],
              );
            },
          ),
        ),
      ),
    );;
  }
}
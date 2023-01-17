import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/controllers/drawer_controller.dart';
import 'package:music_player/pages/all_songs_page.dart';
import 'package:music_player/components/my_drawer.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

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
            child: AllSongsPage(),
            animation: controller.animationController,
            builder: (BuildContext context, child) {
              double slide = controller.maxSlide * controller.animationController.value;
              print("build complete");
              return Stack(
                children: [
                  MyDrawer(),
                  Transform(
                    transform: Matrix4.identity()
                      ..translate(slide),
                    alignment: Alignment.centerLeft,
                    child: child,),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

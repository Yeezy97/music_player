import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/drawer_controller.dart';
import '../../settings_page.dart';

class SongsPageAppBar extends StatelessWidget {
  const SongsPageAppBar({
    Key? key,
    required this.drawerControllerImp,
  }) : super(key: key);

  final DrawerControllerImp drawerControllerImp;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: MaterialButton(
          shape: const CircleBorder(),
          //color: Color(0xFFE0DCCE),
          color: const Color(0xFF010101),
          minWidth: 35,
          enableFeedback: false,
          padding: const EdgeInsets.all(3),
          height: 10,
          elevation: 8,
          onPressed: () {
            drawerControllerImp.toggle();
          },
          child: const Icon(
            Icons.menu,
            size: 22,
            color: Color(0xFFDC5F00),
          ),
        ),
      ),
      title: const Text(
        "All Songs",
        style: TextStyle(
          color: Color(0xFFDC5F00),
        ),
      ),
      elevation: 0,
      backgroundColor: const Color(0xFF181818),
      actions: [
        GestureDetector(
          // search button
          child: Container(
            margin: const EdgeInsets.only(right: 5),
            color: Colors.transparent,
            width: 40,
            height: 40,
            child: const Icon(Icons.search),
          ),
          onTap: () {},
        ),
        GestureDetector(
          // settings button
          child: Container(
            margin: const EdgeInsets.only(right: 20),
            color: Colors.transparent,
            width: 40,
            height: 40,
            child: const Icon(Icons.settings),
          ),
          onTap: () {
            Get.to(() => const SettingsPage());
          },
        ),
      ],
    );
  }
}

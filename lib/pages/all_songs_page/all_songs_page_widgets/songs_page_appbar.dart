import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/drawer_controller.dart';
import '../../settings_page/settings_page.dart';

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
          splashColor: Colors.transparent,
          //color: Theme.of(context).primaryColor,
          //color: Color(0xFFE0DCCE),
          //color: const Color(0xFF010101),
          minWidth: 35,
          enableFeedback: false,
          padding: const EdgeInsets.all(3),
          height: 10,
          elevation: 8,
          onPressed: () {
            drawerControllerImp.toggle();
          },
          child: Icon(
            Icons.menu,
            size: 22,
            //color: Color(0xFFDC5F00), // orange
            //color: Color(0xFF262A56),
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      title: Text(
        "All Songs",
        style: TextStyle(
          //color: Color(0xFFDC5F00), // orange
          color: Theme.of(context).primaryColor,
        ),
      ),
      elevation: 0,
      backgroundColor: Theme.of(context).cardColor,
      actions: [
        GestureDetector(
          // search button
          child: Container(
            margin: const EdgeInsets.only(right: 5),
            color: Colors.transparent,
            width: 40,
            height: 40,
            child:  Icon(Icons.search, color: Theme.of(context).iconTheme.color,),
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
            child: Icon(Icons.settings, color: Theme.of(context).iconTheme.color,),
          ),
          onTap: () {
            Get.to(() => const SettingsPage());
          },
        ),
      ],
    );
  }
}

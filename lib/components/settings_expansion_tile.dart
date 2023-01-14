import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/settings_controller.dart';

class SettingsExpansionTile extends StatelessWidget {
  SettingsExpansionTile({Key? key, required this.tileTitle, required this.tileChildren}) : super(key: key);

  final Widget tileTitle;
  final List<Widget> tileChildren;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.black38),
          bottom: BorderSide(color: Colors.black38),
        ),
        //gradient: settingsGradientColor,
        //color: Color(0xFF104351),
        //color: Color(0xFF0d3844),
        color: Color(0xFF1A120B),

        //color: Color(0xFF145364),
      ),
      child: ExpansionTile(
        childrenPadding: EdgeInsets.symmetric(horizontal: 10),
        tilePadding: EdgeInsets.symmetric(horizontal: 10),
        textColor: Color(0xFFFD703B),
        iconColor: Color(0xFFFD703B),
        collapsedTextColor: Colors.white,
        collapsedIconColor: Colors.white,
        collapsedBackgroundColor: Color(0xFF3C2A21),

        //backgroundColor: Colors.blueGrey,
        title:tileTitle,
        children: tileChildren,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SettingsExpansionTile extends StatelessWidget {
  const SettingsExpansionTile({Key? key, required this.tileTitle, required this.tileChildren}) : super(key: key);

  final Widget tileTitle;
  final List<Widget> tileChildren;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
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
        childrenPadding: const EdgeInsets.symmetric(horizontal: 10),
        tilePadding: const EdgeInsets.symmetric(horizontal: 10),
        textColor: const Color(0xFFFD703B),
        iconColor: const Color(0xFFFD703B),
        collapsedTextColor: Colors.white,
        collapsedIconColor: Colors.white,
        collapsedBackgroundColor: const Color(0xFF3C2A21),

        //backgroundColor: Colors.blueGrey,
        title:tileTitle,
        children: tileChildren,
      ),
    );
  }
}

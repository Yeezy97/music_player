import 'package:flutter/material.dart';


class SettingsListTile extends StatelessWidget {
  const SettingsListTile({Key? key, required this.tileTitle, required this.tileSubTitle, required this.trailingWidget}) : super(key: key);

  final String tileTitle;
  final String tileSubTitle;
  final Widget trailingWidget;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      subtitle: Text(
        tileSubTitle,
        style: TextStyle(
            fontSize: 13, color: Colors.grey.shade400,
        ),
      ),
      title: Text(
        tileTitle,
        style:  const TextStyle(color: Colors.white),
      ),
      trailing: trailingWidget,
    );
  }
}

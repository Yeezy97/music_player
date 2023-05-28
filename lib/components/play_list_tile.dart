import 'package:flutter/material.dart';

class PlayListTile extends StatelessWidget {
  const PlayListTile({Key? key, required this.tileText}) : super(key: key);

  final String? tileText;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
           const SizedBox(width: 20,),
          Text(
            tileText!,
            style:  const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black45),
          ),],
      ),
    );
  }
}

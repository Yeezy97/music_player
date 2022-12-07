import 'package:flutter/material.dart';

class DrawerMenuButton extends StatelessWidget {
  const DrawerMenuButton({Key? key, this.onpress, this.child}) : super(key: key);

  final Function()? onpress;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      shape: Border(
        top: BorderSide(
          color: Colors.white24,
        ),
        bottom: BorderSide(
          color: Colors.white24,
        )
      ),      height: 50,
      onPressed: onpress,
      child: child!,

    );
  }
}

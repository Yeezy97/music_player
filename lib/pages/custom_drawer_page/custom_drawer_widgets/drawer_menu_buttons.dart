import 'package:flutter/material.dart';

class DrawerMenuButton extends StatelessWidget {
  const DrawerMenuButton({Key? key, this.onpress, this.child}) : super(key: key);

  final Function()? onpress;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Color(0xFFF5F0F6),
      splashColor: Colors.red,
      height: 60,
      minWidth: double.infinity,
      elevation: 5,
      focusColor: Colors.grey.shade700,
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      shape: Border(
        top: BorderSide(
          color: Colors.white24,
        ),
        bottom: BorderSide(
          color: Colors.white24,
        ),
        right: BorderSide(
          color: Colors.white24
        )
      ),
      onPressed: onpress,
      child: child!,

    );
  }
}

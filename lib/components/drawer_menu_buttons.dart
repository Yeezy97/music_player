import 'package:flutter/material.dart';

class DrawerMenuButton extends StatelessWidget {
  const DrawerMenuButton({Key? key, this.onpress, this.child}) : super(key: key);

  final Function()? onpress;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      onPressed: onpress,
      child: child!,

    );
  }
}

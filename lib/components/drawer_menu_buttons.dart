import 'package:flutter/material.dart';

class DrawerMenuButton extends StatelessWidget {
  const DrawerMenuButton({Key? key, this.onpress, this.buttonText}) : super(key: key);

  final Function()? onpress;
  final Widget? buttonText;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpress,
      child: buttonText!,

    );
  }
}

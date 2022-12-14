import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({Key? key,required this.tileIcon,required this.drawerTileText, this.ontap}) : super(key: key);

  final IconData tileIcon;
  final String? drawerTileText;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: ontap,
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(tileIcon),
            SizedBox(width: 10,),
            Text(drawerTileText!,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          ],
        )
    );
  }
}

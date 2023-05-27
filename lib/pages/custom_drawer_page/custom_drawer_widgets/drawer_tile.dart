import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({Key? key,required this.tileIcon,required this.drawerTileText, this.ontap, this.trailingWidget}) : super(key: key);

  final IconData tileIcon;
  final String? drawerTileText;
  final Function()? ontap;
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: ontap,
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(tileIcon),
            const SizedBox(width: 10,),
            Text(drawerTileText!,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45
                  //color: Colors.white,
              ),
            )
          ],
        ),
        trailing: trailingWidget,
    );
  }
}

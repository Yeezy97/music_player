import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_player/components/drawer_tile.dart';
import 'package:music_player/components/play_list_tile.dart';
import 'package:music_player/components/drawer_menu_buttons.dart';
import 'package:music_player/music_screen.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  final int minDragStartEdge = 365;
  final int maxDragStartEdge = 0;
  late bool _canBeDragged;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
  }

  void open() {
    animationController.forward();
  }

  void close() {
    animationController.reverse();
  }

  void toggle() => animationController.isDismissed
      ? animationController.forward()
      : animationController.reverse();

  void _onDragStart(DragStartDetails details) {
    bool isDragOpenFromLeft = animationController.isDismissed &&
        details.globalPosition.dx < minDragStartEdge;
    bool isDragCloseFromRight = animationController.isCompleted &&
        details.globalPosition.dx > maxDragStartEdge;
    _canBeDragged = isDragOpenFromLeft || isDragCloseFromRight;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      print(details.globalPosition.dx);
      double delta = details.primaryDelta! / maxSlide;
      animationController.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    if (animationController.isDismissed || animationController.isCompleted)
      return;
    if (details.velocity.pixelsPerSecond.dx.abs() >= 365.0) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;

      animationController.fling(velocity: visualVelocity);
    } else if (animationController.value < 0.5) {
      close();
    } else {
      open();
    }
  }

  final double maxSlide = 225.0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RepaintBoundary(
      child: Scaffold(
        body: GestureDetector(
          onHorizontalDragStart: _onDragStart,
          onHorizontalDragUpdate: _onDragUpdate,
          onHorizontalDragEnd: _onDragEnd,
          //onTap: toggle,
          child: AnimatedBuilder(
            animation: animationController,
            builder: (BuildContext context, _) {
              double slide = maxSlide * animationController.value;
              double scale = 1 - (animationController.value * 0.3);

              return Stack(
                children: [
                  MyDrawer(),
                  Transform(
                      transform: Matrix4.identity()
                        ..translate(slide)
                        ..scale(scale),
                      alignment: Alignment.centerLeft,
                      child: MusicScreen()),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              Colors.black,
              //Color(0xFF246EE9), // royal blue
              //Color(0xFFFF2400), //  scarlet red
              Color(0xFF0C3365),
              //Colors.white24
            ]),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              width: size.width / 2,
              height: size.height / 6,
              child: Text(
                "Music \n  Player",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 27.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: size.width * 0.6,
              height: size.height * 0.7,
              child: ListView(
                children: [
                  DrawerTile(tileIcon: Icons.music_note, drawerTileText: "All Songs"),
                  DrawerTile(tileIcon: Icons.play_arrow_outlined, drawerTileText:"Current Song"),
                  ExpansionTile(
                    title: Row(
                      children: [
                        Icon(Icons.playlist_play),
                        SizedBox(width: 10,),
                        Text(
                          "Playlists",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    children: [
                      PlayListTile(tileText: "Metal"),
                      PlayListTile(tileText: "Pop"),
                      PlayListTile(tileText: "Jazz"),
                    ],
                  ),
                  DrawerTile(tileIcon: Icons.settings, drawerTileText: "Settings"),
                  DrawerTile(tileIcon: Icons.brush, drawerTileText: "Themes")
                ],
              ),
              // child: Column(
              //   crossAxisAlignment: CrossAxisAlignment.stretch,
              //   children: [
              //     OutlinedButton(
              //       child: Align(
              //         alignment: Alignment.centerLeft,
              //         child: Text(
              //           "All Songs",
              //           style: TextStyle(
              //               fontSize: 15,
              //               fontWeight: FontWeight.bold,
              //               color: Colors.white),
              //         ),
              //       ),
              //       style: OutlinedButton.styleFrom(
              //           padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              //           maximumSize: Size(double.infinity, 50),
              //           minimumSize: Size(double.infinity, 50),
              //         backgroundColor: Color(0xFF6667ab),
              //       ),
              //       onPressed: () {},
              //     ),
              //
              //
              //   ],
              // ),
            )
          ],
        ),
      ),
    );
  }
}

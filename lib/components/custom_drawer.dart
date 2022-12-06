import 'package:flutter/material.dart';
import 'package:music_player/music_screen.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> with SingleTickerProviderStateMixin {

  late AnimationController animationController;
  final int minDragStartEdge = 365;
  final int maxDragStartEdge = 0;
  late bool _canBeDragged;

  @override
  void initState(){
    super.initState();
    animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 250),
    );
  }

  void open(){
    animationController.forward();
  }
  void close(){
    animationController.reverse();
  }

  void toggle() => animationController.isDismissed
      ? animationController.forward()
      : animationController.reverse();

  void _onDragStart(DragStartDetails details){
    bool isDragOpenFromLeft = animationController.isDismissed &&
        details.globalPosition.dx < minDragStartEdge;
    bool isDragCloseFromRight = animationController.isCompleted &&
        details.globalPosition.dx > maxDragStartEdge;
    _canBeDragged = isDragOpenFromLeft || isDragCloseFromRight;
  }
  void _onDragUpdate(DragUpdateDetails details){
    if (_canBeDragged){
      print(details.globalPosition.dx);
      double delta = details.primaryDelta! / maxSlide;
      animationController.value += delta;
    }
  }
  void _onDragEnd (DragEndDetails details){
    if (animationController.isDismissed || animationController.isCompleted)
      return;
    if(details.velocity.pixelsPerSecond.dx.abs() >= 365.0){
      double visualVelocity = details.velocity.pixelsPerSecond.dx / MediaQuery.of(context).size.width;

      animationController.fling(velocity:visualVelocity);
    } else if (animationController.value < 0.5){
      close();
    } else{
      open();
    }
  }

  final double maxSlide = 225.0;
  @override
  Widget build(BuildContext context) {

    var myDrawer = Container(color: Colors.blue);
    var myChild = Container(color: Colors.yellow);
    return GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      //onTap: toggle,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext, _){

          double slide = maxSlide * animationController.value;
          double scale = 1 - (animationController.value * 0.3);

          return Stack(
            children: [
              myDrawer,
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
    );
  }
}


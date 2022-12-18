import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:music_player/components/custom_drawer_new.dart';
import 'dart:ui';

import 'package:music_player/controllers/song_button_controller.dart';

class SongPage extends StatelessWidget {
  const SongPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SongButtonControllerImp buttonController = Get.put(
        SongButtonControllerImp());

    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Container(
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
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              Stack(
                children: [

                  Align(
                    alignment: Alignment.topCenter,
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white.withOpacity(0.7),
                              Colors.white.withOpacity(0.6),
                              Colors.white.withOpacity(0.5),
                              Colors.transparent,
                            ]).createShader(bounds);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/weekndlogo1.jpg"),
                            fit: BoxFit.fill,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 30, horizontal: 50),
                        width: size.width,
                        height: size.height * 0.5,

                      ),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 80,
                    right: 80,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(5, 5),
                            color: Colors.black,
                            blurRadius: 5,
                          ),
                        ],
                        image: DecorationImage(
                            image: AssetImage("assets/images/weekndlogo1.jpg"),
                            fit: BoxFit.fill
                        ),
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white24,
                      ),
                      width: size.width * 0.6,
                      height: size.width * 0.6,

                      alignment: Alignment.bottomCenter,
                      // child: Image.asset("assets/images/weekndlogo1.jpg",
                      // fit: BoxFit.contain,
                      // ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: IconButton(onPressed: (){
                      Get.to(CustomDrawerNew());
                    }, icon: Icon(FontAwesomeIcons.arrowLeft)),
                  ),
                ],

              ),
              Container(
                width: double.infinity,
                height: size.height * 0.15,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("The Weeknd",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),),
                      SizedBox(height: 5,),
                      Text("Save Your Tears",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: size.height * 0.15,
                child: GetBuilder<SongButtonControllerImp>(
                  builder: (buttonController) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {

                            },
                            iconSize: 20,
                            color: Colors.white,
                            icon: Icon(FontAwesomeIcons.repeat)),
                        IconButton(
                            onPressed: () {},
                            color: Colors.white,
                            icon: Icon(FontAwesomeIcons.backwardStep)),
                        IconButton(
                            iconSize: 35,
                            color: Colors.white,
                            onPressed: () {
                              buttonController.play();
                            }, icon: Icon(
                            buttonController.isPlaying ? FontAwesomeIcons.circlePause : FontAwesomeIcons.circlePlay)),
                        IconButton(
                            onPressed: () {},
                            color: Colors.white,
                            icon: Icon(FontAwesomeIcons.forwardStep)),
                        IconButton(
                            iconSize: 20,
                            onPressed: () {},
                            color: Colors.white,
                            icon: Icon(FontAwesomeIcons.shuffle)),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

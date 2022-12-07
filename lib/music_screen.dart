import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_player/components/drawer_menu_buttons.dart';
import 'package:music_player/components/sliding_drawer.dart';
import 'package:music_player/constants.dart';
import 'package:music_player/songs_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("All Songs"),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.settings))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: drawerGradientColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 10,
              offset: Offset(0.3, 0.3)
            )
          ]
        ),
        child: SafeArea(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Divider(
                height: 2,
              ),
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 8),
              //   decoration: BoxDecoration(
              //     // boxShadow: [
              //     //   BoxShadow(
              //     //       offset: Offset(0,3),
              //     //
              //     //   color: Colors.grey.withOpacity(0.3)),
              //     // ],
              //
              //     //borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4))
              //   ),
              //
              //   height: 65,
              //   width: double.infinity,
              //   child: Row(
              //     children: [
              //       Drawer(
              //         width: 60,
              //       ),
              //       Text("All Songs"),
              //
              //     ],
              //   ),
              // ),
              //Divider(color: Colors.black),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: ListView.builder(
                    itemCount: mySongs.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            leading: Text(mySongs[index]),
                          ),
                          Divider(),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Divider(
                height: 3,
              ),
              Container(
                decoration: BoxDecoration(
                    //   boxShadow: [
                    //     BoxShadow(
                    //       offset: Offset(0, -3),
                    //       blurRadius: 10,
                    //       color: Colors.grey.withOpacity(0.5),
                    //     ),
                    //   ],
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(4),
                        topLeft: Radius.circular(4))),
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(FontAwesomeIcons.backwardStep)),
                    IconButton(
                        onPressed: () {}, icon: Icon(FontAwesomeIcons.play)),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(FontAwesomeIcons.forwardStep)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

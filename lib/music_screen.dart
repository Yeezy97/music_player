import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_player/components/custom_drawer.dart';
import 'package:music_player/components/drawer_menu_buttons.dart';
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
        leading: IconButton(
          icon: Icon(Icons.menu),
          //TODO: drawer on tap function here
          onPressed: (){},
        ),
        title: Text("All Songs"),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.settings))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(gradient: drawerGradientColor, boxShadow: [
          BoxShadow(
              color: Colors.black54, blurRadius: 10, offset: Offset(0.3, 0.3))
        ]),
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
                  color: Colors.white70,
                  child: ListView.builder(
                    itemCount: mySongs.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 3, vertical: 3),
                            margin: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black54),
                                color: Colors.white),
                            child: ListTile(
                              leading: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(3),
                                    constraints: const BoxConstraints(
                                      maxHeight: 50,
                                      maxWidth: 50,
                                    ),
                                    child: Image.asset(
                                      "assets/images/musicLogo.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(mySongs[index]),
                                ],
                              ),
                              trailing: IconButton(
                                onPressed: (){},
                                icon: Icon(FontAwesomeIcons.ellipsisVertical,
                                color: Colors.black87),
                              ),
                            ),
                          ),
                          Divider(
                            height: 0,
                          ),
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
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10))),
                height: 70,
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

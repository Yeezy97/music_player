import 'package:flutter/material.dart';
import 'package:music_player/songs_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    color: Colors.grey,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0,5),
                    blurRadius: 10,
                    color: Colors.grey.withOpacity(0.5)),
                  ],

                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4))
                ),

                height: 80,
                width: double.infinity,
                child: Row(
                  children: [
                    Text("All Songs"),

                  ],
                ),
              ),
              Expanded(
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
                  },),
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, -5),
                      blurRadius: 10,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ],
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(topRight:Radius.circular(4), topLeft: Radius.circular(4))
                ),
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.backwardStep)),
                    IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.play)),
                    IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.forwardStep)),
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


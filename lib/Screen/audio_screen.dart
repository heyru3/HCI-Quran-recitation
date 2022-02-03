import 'package:flutter/material.dart';
import 'package:hci/Data/audio_data.dart';
import 'package:hci/Data/data.dart';

import '../Data/color.dart';
import '../Models/custom_clipper.dart';

class AudioScreen extends StatefulWidget {
  int index;
  AudioScreen({Key? key, required this.index}) : super(key: key);

  @override
  _AudioScreenState createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ClipPath(
                clipper: ImageClipper(),
                child: Hero(
                  tag: pElements[widget.index].imageUrl,
                  child: Image(
                    height: MediaQuery.of(context).size.height / 3,
                    width: double.infinity,
                    image: AssetImage(pElements[widget.index].imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 50,
                left: 20,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: defaultColor,
                  ),
                  iconSize: 30,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        offset: Offset(0, 2),
                        blurRadius: 6,
                      )
                    ],
                  ),
                  child: ClipOval(
                    child: Image(
                      height: 120,
                      width: 120,
                      image: AssetImage(pElements[widget.index].imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: audioFile.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          height: 70,
                          decoration: BoxDecoration(
                              color: defaultColor,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 6,
                                    offset: Offset(0, 1))
                              ]),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.play_circle_outline),
                          iconSize: 50,
                        )
                      ],
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}

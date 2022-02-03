import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Data/color.dart';
import '../../Models/element.dart';
import '../../Screen/audio_screen.dart';

class AllContent extends StatelessWidget {
  final PageController pageController;
  final String title;
  final List<PElement> pelements;
  const AllContent(
      {Key? key,
      required this.pageController,
      required this.pelements,
      required this.title})
      : super(key: key);
  _buildContent(BuildContext context, int index) {
    PElement pelement = pelements[index];
    return AnimatedBuilder(
      animation: pageController,
      builder: (BuildContext context, Widget? widget) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = (pageController.page! - index);
          value = (1 - (value.abs() * 0.25)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) *
                MediaQuery.of(context).size.height /
                2,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => AudioScreen(
                        index: index,
                      )));
        },
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 2))
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Hero(
                  tag: pelement.imageUrl,
                  child: Image(
                    image: AssetImage(pelement.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              child: Container(
                height: 110,
                decoration: const BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: [
                      Icon(pelements[index].icon),
                      Text(
                        pelements[index].title,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.montserrat(
                            color: defaultTextColor,
                            fontSize: 24,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 13, bottom: 10, top: 10),
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.montserrat(
                color: defaultTextColor,
                fontSize: 24,
                letterSpacing: 2,
                fontWeight: FontWeight.w300),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: pageController,
            itemCount: pelements.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildContent(context, index);
            },
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hci/Data/color.dart';

import '../../Data/data.dart';

class Recent extends StatelessWidget {
  const Recent({Key? key}) : super(key: key);
  Widget _buildRecent(BuildContext context, int index) {
    return Container(
      margin: const EdgeInsets.only(left: 0, right: 10, top: 2, bottom: 2),
      width: MediaQuery.of(context).size.width / 1.2,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1, color: Colors.grey.shade200),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                spreadRadius: 1,
                offset: Offset(0, 2),
                blurStyle: BlurStyle.inner),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
              width: 120,
              height: 200,
              image: AssetImage(pElements[index].imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: [
              Icon(pElements[index].icon),
              Text(
                pElements[index].title,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.montserrat(
                    color: defaultTextColor,
                    fontSize: 24,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
          Container(
              margin: const EdgeInsets.only(right: 5, top: 40),
              width: 48,
              decoration: BoxDecoration(
                color: defaultColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.reply),
                iconSize: 30,
                color: Colors.white,
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 13.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10.0, bottom: 10),
            child: Text(
              'Recent',
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.montserrat(
                  color: defaultTextColor,
                  fontSize: 24,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w300),
            ),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height / 5.5,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildRecent(context, index);
                  }))
        ],
      ),
    );
  }
}

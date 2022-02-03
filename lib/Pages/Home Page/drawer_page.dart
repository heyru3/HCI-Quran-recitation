import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hci/Data/color.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image(
                height: MediaQuery.of(context).size.height / 2.5,
                image: const AssetImage('assets/images/image1.jpg'),
                fit: BoxFit.cover,
              ),
              Positioned(
                left: 30,
                bottom: 5,
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
                  child: const ClipOval(
                    child: Image(
                      height: 60,
                      width: 60,
                      image: AssetImage('assets/images/headset2.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              IconButton(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                onPressed: () {},
                icon: const Icon(Icons.home_outlined),
                iconSize: 30,
                color: defaultColor,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                'Home',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 24,
                  letterSpacing: 1.2,
                ),
              )
            ],
          ),
          Row(
            children: [
              IconButton(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                onPressed: () {},
                icon: const Icon(Icons.format_paint_outlined),
                iconSize: 30,
                color: defaultColor,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                'Theme',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 24,
                  letterSpacing: 1.2,
                ),
              )
            ],
          ),
          Row(
            children: [
              IconButton(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                onPressed: () {},
                icon: const Icon(Icons.settings_outlined),
                iconSize: 30,
                color: defaultColor,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                'Settings',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 24,
                  letterSpacing: 1.2,
                ),
              )
            ],
          ),
          const Spacer(),
          Row(
            children: [
              IconButton(
                padding: const EdgeInsets.only(
                  left: 15,
                ),
                onPressed: () {},
                icon: const Icon(Icons.logout_outlined),
                iconSize: 30,
                color: defaultColor,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                'Exit',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 24,
                  letterSpacing: 1.2,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

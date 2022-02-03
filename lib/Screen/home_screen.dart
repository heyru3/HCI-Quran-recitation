import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hci/Data/color.dart';
import 'package:hci/Pages/Home%20Page/all_content_page.dart';
import 'package:hci/Pages/Home%20Page/drawer_page.dart';
import 'package:hci/Pages/Home%20Page/recent_page.dart';
import 'package:hci/Pages/Home%20Page/theme.dart';

import '../Data/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  //final Color dColor;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    setState(() {
      defaultColor = (ModalRoute.of(context)?.settings.arguments) as Color;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // final Object? bColor = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: defaultColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Quran Audio App',
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 24,
              letterSpacing: 2,
              fontWeight: FontWeight.w300),
        ),
        actions: [
          GestureDetector(
              onTap: () {
                themeData(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 7, top: 15),
                child: Column(
                  children: [
                    Container(
                      height: 15,
                      width: 25,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              offset: Offset(0, 2),
                              blurRadius: 6)
                        ],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        color: defaultColor,
                      ),
                    ),
                    Container(
                      height: 15,
                      width: 25,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
      drawer: const CustomDrawer(),
      body: ListView(
        children: [
          const Recent(),
          Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: AllContent(
              pageController: _pageController,
              title: 'All Content',
              pelements: pElements,
            ),
          ),
        ],
      ),
    );
  }
}

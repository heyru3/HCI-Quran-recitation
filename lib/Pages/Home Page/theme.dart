import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hci/Data/color.dart';
import 'package:hci/Models/generateTheme.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Future<bool?> themeData(BuildContext context) {
  return Alert(
    style: AlertStyle(
      titleStyle: GoogleFonts.montserrat(
          color: Colors.black87,
          fontSize: 24,
          letterSpacing: 2,
          fontWeight: FontWeight.w300),
      overlayColor: Colors.white70,
      backgroundColor: Colors.grey[200],
      animationType: AnimationType.fromLeft,
      animationDuration: const Duration(milliseconds: 400),
      alertBorder: Border(
        top:
            BorderSide(color: defaultColor, width: 3, style: BorderStyle.solid),
        bottom: BorderSide(color: defaultColor, width: 3),
      ),
    ),
    context: context,
    title: 'Choose Theme Color',
    alertAnimation: fadeAlertAnimation,
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        generateTheme(context, colorCollection['collection_1']![0],
            colorCollection['collection_1']![1]),
        generateTheme(context, colorCollection['collection_2']![0],
            colorCollection['collection_1']![1]),
        generateTheme(context, colorCollection['collection_3']![0],
            colorCollection['collection_1']![1]),
        generateTheme(context, colorCollection['collection_4']![0],
            colorCollection['collection_1']![1]),
      ],
    ),
  ).show();
}

Widget fadeAlertAnimation(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return Align(
    child: FadeTransition(
      opacity: animation,
      child: child,
    ),
  );
}

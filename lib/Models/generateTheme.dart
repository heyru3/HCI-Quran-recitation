import 'package:flutter/material.dart';

Widget generateTheme(BuildContext context, Color color_1, Color color_2) {
  return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/home',
          arguments: color_1,
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 7, top: 15),
        child: Column(
          children: [
            Container(
              height: 30,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: color_1,
              ),
            ),
            Container(
              height: 30,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                color: color_2,
              ),
            ),
          ],
        ),
      ));
}

import 'dart:ui';
import 'package:flutter/material.dart';
import '../utils/constanst.dart';

Widget moreInfo({
  required String wind,
  required String humidity,
  required String feelsLike,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Container(
        width: w,
        height: h / 12,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white, width: 2.9)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Ветер,м/с", style: kMoreInfoFont),
                Text("Влажность,%", style: kMoreInfoFont),
                Text("Ощущения,°C", style: kMoreInfoFont),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(wind, style: kMoreInfoFont),
                Text(humidity, style: kMoreInfoFont),
                Text(feelsLike, style: kMoreInfoFont),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//
import '../utils/constanst.dart';

Widget currentWeather({
  required VoidCallback onPressed,
  required String? temp,
  required String? location,
  required String? country,
  required String? status,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Container(
          width: w,
          decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white, width: 1.9)),
             child: Container(
               padding: EdgeInsets.symmetric(vertical: 150,horizontal: 62),
                 child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("${temp}°", style: kTempFont),
                            Row(
                              children: [
                                Text("$location, $country", style: kTitleFont),
                                SizedBox(width: 10,),
                                IconButton(
                                    onPressed: onPressed,
                                    icon: Icon(
                                      CupertinoIcons.refresh,
                                      color: Colors.white,
                                      size: 30,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                Text("$status",style: kTitleFont,),
                                SizedBox(width: 10,),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
      )
  );
              }

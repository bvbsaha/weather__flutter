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
  return Container(
    width: w,
    child: Container(
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
  );
}

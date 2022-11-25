import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class artisInfoWidget extends StatefulWidget {
  const artisInfoWidget({super.key});

  @override
  State<artisInfoWidget> createState() => _artisInfoWidgetState();
}

class _artisInfoWidgetState extends State<artisInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72.w,
      height: 13.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Billie Eilish",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text("2 Album, 67 Track"),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis adipiscing vestibulum orci enim, nascetur vitae",
            style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
          )
        ],
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class songInfoWidget extends StatefulWidget {
  const songInfoWidget(
      {super.key,
      required this.songImage,
      required this.songName,
      required this.artistName});
  final String songImage;
  final String songName;
  final String artistName;

  @override
  State<songInfoWidget> createState() => _songInfoWidgetState();
}

class _songInfoWidgetState extends State<songInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 100.w,
          height: 60.h,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    widget.songImage,
                  ),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(30)),
        ),
        Positioned(
          bottom: 10,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.songName,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                widget.artistName,
                style: TextStyle(color: Colors.grey, fontSize: 17),
              ),
            ],
          ),
        ),
        Positioned(
            bottom: 10,
            right: 10,
            child: IconButton(
                onPressed: () {}, icon: Icon(Icons.favorite_outline)))
      ],
    );
  }
}

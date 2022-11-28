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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100.w,
          height: 60.h,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    widget.songImage,
                  ),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(30)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 75.w,
                    height: 5.h,
                    child: Text(
                      widget.songName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Text(
                    widget.artistName,
                    style: TextStyle(color: Colors.blueGrey, fontSize: 17.sp),
                  ),
                ],
              ),
              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline))
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class nowPlayTopWidget extends StatefulWidget {
  const nowPlayTopWidget({super.key});

  @override
  State<nowPlayTopWidget> createState() => _nowPlayTopWidgetState();
}

class _nowPlayTopWidgetState extends State<nowPlayTopWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_arrow_left_outlined,
            size: 26.sp,
          ),
        ),
        Text(
          "Now Playing",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Icon(
          Icons.more_vert,
          size: 24.sp,
        )
      ],
    );
  }
}

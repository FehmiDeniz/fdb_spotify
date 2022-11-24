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
      children: [
        Container(
          width: 10.w,
          height: 10.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.withOpacity(0.5),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.keyboard_arrow_left_outlined,
              size: 20,
            ),
          ),
        ),
        Text(
          "Now Playing",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Icon(Icons.more_vert)
      ],
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class songInfoWidget extends StatefulWidget {
  const songInfoWidget({super.key});

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
                    "assets/im_songer_pic2.png",
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
                "Bad Guy",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "Billie Eilish",
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

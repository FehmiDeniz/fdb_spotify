import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class artistBannerWidget extends StatefulWidget {
  const artistBannerWidget({super.key});

  @override
  State<artistBannerWidget> createState() => _artistBannerWidgetState();
}

class _artistBannerWidgetState extends State<artistBannerWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 100.w,
          height: 30.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
              image: DecorationImage(
                  image: AssetImage("assets/im_songer_bg.png"), //songer Image
                  fit: BoxFit.fill)),
        ),
        Positioned(
          left: 20,
          top: 30,
          child: Container(
            width: 10.w,
            height: 10.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.withOpacity(0.2),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.keyboard_arrow_left_outlined,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
            top: 35,
            right: 30,
            child: Icon(
              Icons.more_vert,
              size: 30,
              color: Colors.white,
            ))
      ],
    );
  }
}

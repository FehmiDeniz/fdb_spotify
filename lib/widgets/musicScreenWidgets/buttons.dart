import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class buttonsWidget extends StatefulWidget {
  const buttonsWidget({super.key});

  @override
  State<buttonsWidget> createState() => _buttonsWidgetState();
}

class _buttonsWidgetState extends State<buttonsWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset("assets/btn_repeat.png"),
        Image.asset("assets/btn_previous.png"),
        Container(
          width: 18.w,
          height: 18.w,
          decoration:
              BoxDecoration(color: Color(0xff42C83C), shape: BoxShape.circle),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.play_arrow,
              size: 40,
              color: Colors.white,
            ),
          ),
        ),
        Image.asset("assets/btn_next.png"),
        Image.asset("assets/btn_shuffle.png"),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class songWidget extends StatefulWidget {
  const songWidget({super.key});

  @override
  State<songWidget> createState() => _songWidgetState();
}

class _songWidgetState extends State<songWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 30.w,
              height: 18.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage("assets/im_songer_pic.png"),
                      fit: BoxFit.contain)),
            ),
            Container(
              margin: EdgeInsets.only(left: 6),
              child: Text(
                "Song Name",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 6),
              child: Text(
                "Songer",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
      Positioned(
          bottom: 40, right: 10, child: Image.asset("assets/ic_play.png"))
    ]);
  }
}

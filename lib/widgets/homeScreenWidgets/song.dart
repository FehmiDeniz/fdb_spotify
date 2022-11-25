import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class songWidget extends StatefulWidget {
  final String songImage;
  final String songName;
  final String songer;
  const songWidget(
      {super.key,
      required this.songImage,
      required this.songName,
      required this.songer});

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
                      image: NetworkImage(widget.songImage),
                      fit: BoxFit.contain)),
            ),
            Container(
              width: 25.w,
              margin: EdgeInsets.only(left: 6),
              child: Text(
                widget.songName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: 25.w,
              margin: EdgeInsets.only(left: 6),
              child: Text(
                widget.songer,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
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

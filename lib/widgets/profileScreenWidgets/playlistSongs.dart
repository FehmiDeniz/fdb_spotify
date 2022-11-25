import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class playlistSongWidget extends StatefulWidget {
  const playlistSongWidget({super.key});

  @override
  State<playlistSongWidget> createState() => _playlistSongWidgetState();
}

class _playlistSongWidgetState extends State<playlistSongWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 13.w,
            height: 13.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image:
                    DecorationImage(image: AssetImage("assets/im_song.png"))),
          ),
          SizedBox(
            width: 5.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dont Smile At Me",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text("Billie Eilish")
            ],
          ),
          Spacer(),
          Icon(Icons.more_horiz)
        ],
      ),
    );
  }
}

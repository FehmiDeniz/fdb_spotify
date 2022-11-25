import 'package:fdb_spotify/widgets/artistProfile/artist_songs.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class artistAlbumsWidget extends StatefulWidget {
  const artistAlbumsWidget({super.key});

  @override
  State<artistAlbumsWidget> createState() => _artistAlbumsWidgetState();
}

class _artistAlbumsWidgetState extends State<artistAlbumsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 35.w,
          height: 15.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
              image: AssetImage("assets/im_album_image.png"),
            ),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Text(
          "Album Name",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

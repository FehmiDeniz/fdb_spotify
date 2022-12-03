import 'package:fdb_spotify/screens/music_screen.dart';
import 'package:fdb_spotify/service/playlist_service.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class playlistTracksViewWidget extends StatefulWidget {
  final String songImage;
  final String songName;
  final String songer;
  const playlistTracksViewWidget(
      {super.key,
      required this.songImage,
      required this.songName,
      required this.songer});

  @override
  State<playlistTracksViewWidget> createState() =>
      _playlistTracksViewWidgetState();
}

class _playlistTracksViewWidgetState extends State<playlistTracksViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1.h),
      padding: EdgeInsets.all(10),
      width: 88.w,
      height: 11.h,
      decoration: BoxDecoration(
          color: Colors.blueGrey, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 20.w,
            height: 20.w,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(widget.songImage))),
          ),
          SizedBox(
            width: 3.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.songer,
                style: TextStyle(color: Colors.white, fontSize: 19.sp),
              ),
              SizedBox(
                width: 55.w,
                child: Text(
                  widget.songName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white, fontSize: 18.sp),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'dart:ui';

import 'package:fdb_spotify/screens/playlist_tracks_screen.dart';
import 'package:fdb_spotify/widgets/profileScreenWidgets/playlistSongs.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoriePlaylistWidget extends StatefulWidget {
  final String playlistImage;
  final String playlistDescription;
  final String playlistName;
  final String playlistID;
  const CategoriePlaylistWidget(
      {super.key,
      required this.playlistImage,
      required this.playlistDescription,
      required this.playlistName,
      required this.playlistID});

  @override
  State<CategoriePlaylistWidget> createState() =>
      _CategoriePlaylistWidgetState();
}

class _CategoriePlaylistWidgetState extends State<CategoriePlaylistWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2.h),
      width: 90.w,
      height: 16.h,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(5.w)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlaylistTracksScreen(
                      playlistID: widget.playlistID,
                      playlistName: widget.playlistName,
                    ),
                  ));
            },
            child: Container(
              margin: EdgeInsets.only(left: 3.w),
              width: 30.w,
              height: 14.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.playlistImage),
                      fit: BoxFit.cover)),
            ),
          ),
          SizedBox(
            width: 7.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 50.w,
                height: 7.h,
                child: Text(
                  widget.playlistDescription,
                  style: playistTextStyle(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                width: 50.w,
                child: Text(
                  widget.playlistName,
                  style: playistTextStyle(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  TextStyle playistTextStyle() {
    return TextStyle(
        color: Colors.black, fontSize: 17.sp, fontWeight: FontWeight.bold);
  }
}

// image | description | name

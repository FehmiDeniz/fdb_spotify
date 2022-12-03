import 'package:fdb_spotify/screens/playlist_tracks_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class playlistSongWidget extends StatefulWidget {
  final String playlistName;
  final String playlistImage;
  final String id;
  final String playlistOwner;
  const playlistSongWidget(
      {super.key,
      required this.playlistName,
      required this.playlistImage,
      required this.playlistOwner,
      required this.id});

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
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlaylistTracksScreen(
                        playlistID: widget.id,
                        playlistName: widget.playlistName),
                  ));
            },
            child: Container(
              width: 15.w,
              height: 15.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(widget.playlistImage))),
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 30.h,
                child: Text(
                  widget.playlistName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Text(widget.playlistOwner)
            ],
          ),
          Spacer(),
          Icon(Icons.more_horiz)
        ],
      ),
    );
  }
}

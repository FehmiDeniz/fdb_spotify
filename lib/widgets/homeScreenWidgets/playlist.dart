import 'package:fdb_spotify/screens/artist_profile_screen.dart';
import 'package:fdb_spotify/screens/music_screen.dart';
import 'package:fdb_spotify/service/artist_album_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class playlistWidget extends StatefulWidget {
  final String songName;
  final String artistName;
  final String id;
  const playlistWidget(
      {super.key,
      required this.songName,
      required this.artistName,
      required this.id});

  @override
  State<playlistWidget> createState() => _playlistWidgetState();
}

class _playlistWidgetState extends State<playlistWidget> {
  String get id => "4aawyAB9vmqN3uQ7FjRGTy";

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                getArtistAlbumService(id);
                print(widget.id);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => musicScreen(),
                    ));
              },
              child: Image.asset("assets/ic_play.png")),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.artistName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                width: 32.h,
                child: Text(
                  widget.songName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
          const Spacer(),
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite))
        ],
      ),
    );
  }
}

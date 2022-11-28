import 'package:fdb_spotify/screens/artist_profile_screen.dart';
import 'package:fdb_spotify/screens/music_screen.dart';
import 'package:fdb_spotify/service/artist_album_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../providers/artist_album_provider.dart';

class playlistWidget extends StatefulWidget {
  final String songName;
  final String artistName;
  final String id;
  final int root;
  const playlistWidget(
      {super.key,
      required this.songName,
      required this.artistName,
      required this.id,
      required this.root});

  @override
  State<playlistWidget> createState() => _playlistWidgetState();
}

class _playlistWidgetState extends State<playlistWidget> {
  String id = "0TnOYISbd1XYRBk9myaseg";
  ArtistAlbumProvider? artistData;
  @override
  void initState() {
    artistData = Provider.of<ArtistAlbumProvider>(context, listen: false);
    artistData!.getArtistAlbumData(widget.id);

    super.initState();
  }

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
                print("sa${widget.id}");
                getArtistAlbumService(widget.id);
                artistData!.getArtistAlbumData(widget.id);
                print(widget.root);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => musicScreen(
                        root: widget.root,
                      ),
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

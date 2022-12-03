import 'package:fdb_spotify/models/playlist_tracks_model.dart';
import 'package:fdb_spotify/providers/playlist_tracks_provider.dart';
import 'package:fdb_spotify/widgets/playlistTracksScreenWidgets/playlistTracks.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PlaylistTracksScreen extends StatefulWidget {
  final String playlistID;
  final String playlistName;
  const PlaylistTracksScreen(
      {super.key, required this.playlistID, required this.playlistName});

  @override
  State<PlaylistTracksScreen> createState() => _PlaylistTracksScreenState();
}

class _PlaylistTracksScreenState extends State<PlaylistTracksScreen> {
  @override
  void initState() {
    Provider.of<PlaylistTracksProvider>(context, listen: false)
        .getPlaylistTracksData(widget.playlistID);
    print(widget.playlistID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
        child: SizedBox(
            width: 100.w,
            height: 100.h,
            child: Consumer(
              builder: (context, PlaylistTracksProvider value, child) {
                return value.isPlaylistTracksLoaded == false
                    ? Container()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.playlistName,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Container(
                            width: double.infinity,
                            height: 85.h,
                            child: ListView.builder(
                                itemCount:
                                    value.playlistTracksData!.items!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return playlistTracksViewWidget(
                                    songImage: value
                                        .playlistTracksData!
                                        .items![index]
                                        .track!
                                        .album!
                                        .images![0]
                                        .url!,
                                    songName: value.playlistTracksData!
                                        .items![index].track!.name!,
                                    songer: value.playlistTracksData!
                                        .items![index].track!.artists![0].name!,
                                  );
                                }),
                          )
                        ],
                      );
              },
            )),
      ),
    );
  }
}

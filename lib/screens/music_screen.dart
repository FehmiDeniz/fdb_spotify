import 'package:fdb_spotify/models/playlist_model.dart';
import 'package:fdb_spotify/providers/artist_album_provider.dart';
import 'package:fdb_spotify/providers/playlist_provider.dart';
import 'package:fdb_spotify/service/artist_album_service.dart';
import 'package:fdb_spotify/widgets/musicScreenWidgets/buttons.dart';
import 'package:fdb_spotify/widgets/musicScreenWidgets/nowPlayingTop.dart';
import 'package:fdb_spotify/widgets/musicScreenWidgets/songInfo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class musicScreen extends StatefulWidget {
  final int root;
  const musicScreen({super.key, required this.root});

  @override
  State<musicScreen> createState() => _musicScreenState();
}

class _musicScreenState extends State<musicScreen> {
  double _value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        child: SizedBox(
            width: 100.w,
            height: 100.h,
            child: Consumer(
              builder: (context, ArtistAlbumProvider value, child) {
                return value.isArtistAlbumLoaded == false
                    ? Container()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const nowPlayTopWidget(),
                          SizedBox(
                            height: 2.h,
                          ),
                          songInfoWidget(
                            artistName: value.artistAlbumData!
                                .items![widget.root].artists![0].name!,
                            songImage: value.artistAlbumData!
                                .items![widget.root].images![0].url!,
                            songName: value
                                .artistAlbumData!.items![widget.root].name!,
                          ),
                          SizedBox(
                            child: SizedBox(
                              height: 4.h,
                              child: Slider(
                                activeColor: Color(0xff1ED760),
                                inactiveColor: Color(0xffD9D9D9),
                                min: 0.0,
                                max: 100.0,
                                value: _value,
                                onChanged: (value) {
                                  setState(() {
                                    _value = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          Consumer(
                            builder: (context, PlaylistProvider value, child) {
                              return value.isPlaylistDataLoaded == false
                                  ? Container()
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(left: 20),
                                          child: Text(
                                            "0.00",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.sp),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: 18),
                                          child: Text(
                                            (calculateMS(value
                                                .playlistData!
                                                .tracks![widget.root]
                                                .durationMs!)),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.sp),
                                          ),
                                        ),
                                      ],
                                    );
                            },
                          ),
                          const buttonsWidget()
                        ],
                      );
              },
            )),
      ),
    );
  }
}

String calculateMS(int ms) {
  int min;
  int seconds;
  String songtime;
  min = (ms / 1000 / 60).floor();
  seconds = ((ms / 1000) % 60).floor();
  songtime = "$min:$seconds";

  return songtime;
}

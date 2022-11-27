import 'package:fdb_spotify/models/playlist_model.dart';
import 'package:fdb_spotify/providers/playlist_provider.dart';
import 'package:fdb_spotify/providers/releases_provider.dart';
import 'package:fdb_spotify/service/releases_service.dart';
import 'package:fdb_spotify/widgets/homeScreenWidgets/banner.dart';
import 'package:fdb_spotify/widgets/homeScreenWidgets/playlist.dart';
import 'package:fdb_spotify/widgets/homeScreenWidgets/searchTop.dart';
import 'package:fdb_spotify/widgets/homeScreenWidgets/album.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  ReleasesProvider? releasesData;
  PlaylistProvider? playlistData;

  @override
  void initState() {
    Provider.of<ReleasesProvider>(context, listen: false).getReleasesData();
    playlistData = Provider.of<PlaylistProvider>(context, listen: false);
    playlistData!.getPlaylistData(id);

    super.initState();
  }

  List<String> menuTexts = [
    "News",
    "Video",
    "Artist",
    "Podcast"
  ]; //news video artist podcast
  String id = "0TnOYISbd1XYRBk9myaseg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                width: 100.w,
                height: 100.h,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: const searchWidget(),
                    ),

                    const bannerWidget(),
                    //News-Video-Artist-Podcast
                    SizedBox(
                      width: double.infinity,
                      height: 6.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text(
                              menuTexts[index],
                              style: TextStyle(fontSize: 18),
                            ),
                          );
                        },
                      ),
                    ),
                    Consumer(
                      builder: (context, ReleasesProvider value, child) {
                        return SizedBox(
                            width: double.infinity,
                            height: 25.h,
                            child: value.isReleasesDataLoaded == false
                                ? Container()
                                : ListView.builder(
                                    itemCount: value
                                        .releasesData!.albums!.items!.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          id = value.releasesData!.albums!
                                              .items![index].artists![0].id
                                              .toString();
                                          // print("ID: "+id);
                                          playlistData!.getPlaylistData(id);
                                          // Provider.of<PlaylistProvider>(context,
                                          //         listen: false)
                                          //     .getPlaylistData(id);
                                          // print(id);
                                        },
                                        child: AlbumWidget(
                                          albumImage:
                                              '${value.releasesData!.albums!.items![index].images![0].url}',
                                          albumName:
                                              '${value.releasesData!.albums!.items![index].artists![0].name}',
                                          songer:
                                              '${value.releasesData!.albums!.items![index].name}',
                                        ),
                                      );
                                    }));
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Playlist",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "See More",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Consumer(
                      builder: (context, PlaylistProvider value, child) {
                        return SizedBox(
                            width: double.infinity,
                            height: 35.h,
                            child: value.isPlaylistDataLoaded == false
                                ? Container()
                                : ListView.builder(
                                    shrinkWrap: false,
                                    itemCount: 10,
                                    itemBuilder: (context, index) {
                                      return playlistWidget(
                                        artistName: value
                                            .playlistData!
                                            .tracks![index]
                                            .album!
                                            .artists![0]
                                            .name
                                            .toString(),
                                        id: '',
                                        songName: value
                                            .playlistData!.tracks![index].name
                                            .toString(),
                                      );
                                    }));
                      },
                    )
                  ],
                ),
              ),
              //billie image
              Positioned(
                left: 47,
                top: 17,
                child: Image.asset(
                  "assets/im_billie.png",
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:fdb_spotify/provider/releases_provider.dart';
import 'package:fdb_spotify/service/releases_service.dart';
import 'package:fdb_spotify/widgets/homeScreenWidgets/banner.dart';
import 'package:fdb_spotify/widgets/homeScreenWidgets/playlist.dart';
import 'package:fdb_spotify/widgets/homeScreenWidgets/searchTop.dart';
import 'package:fdb_spotify/widgets/homeScreenWidgets/song.dart';
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

  @override
  void initState() {
    Provider.of<ReleasesProvider>(context, listen: false).getReleasesData();
    super.initState();
  }

  List<String> menuTexts = [
    "News",
    "Video",
    "Artist",
    "Podcast"
  ]; //news video artist podcast
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
                                      return songWidget(
                                        songImage:
                                            '${value.releasesData!.albums!.items![index].images![0].url}',
                                        songName:
                                            '${value.releasesData!.albums!.items![index].artists![0].name}',
                                        songer:
                                            '${value.releasesData!.albums!.items![index].name}',
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
                    Container(
                        width: double.infinity,
                        height: 35.h,
                        child: ListView.builder(
                            shrinkWrap: false,
                            padding: EdgeInsets.only(top: 8),
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return playlistWidget();
                            }))
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

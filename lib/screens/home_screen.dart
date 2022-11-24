import 'package:fdb_spotify/widgets/homeScreenWidgets/banner.dart';
import 'package:fdb_spotify/widgets/homeScreenWidgets/playlist.dart';
import 'package:fdb_spotify/widgets/homeScreenWidgets/searchTop.dart';
import 'package:fdb_spotify/widgets/homeScreenWidgets/song.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  List<String> menuTexts = [
    "News",
    "Video",
    "Artist",
    "Podcast"
  ]; //news video artist podcast
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
                    Container(
                        width: double.infinity,
                        height: 25.h,
                        child: ListView.builder(
                            itemCount: 3,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return songWidget();
                            })),
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

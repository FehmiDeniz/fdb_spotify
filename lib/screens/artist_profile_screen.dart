import 'package:fdb_spotify/widgets/artistProfileScreenWidgets/artist_songs.dart';
import 'package:fdb_spotify/widgets/artistProfileScreenWidgets/artist_banner.dart';
import 'package:fdb_spotify/widgets/artistProfileScreenWidgets/artist_info.dart';
import 'package:fdb_spotify/widgets/artistProfileScreenWidgets/artist_albums.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class artistProfileScreen extends StatefulWidget {
  const artistProfileScreen({super.key});

  @override
  State<artistProfileScreen> createState() => _artistProfileScreenState();
}

//ses yok mu A:SDAS:DAD
class _artistProfileScreenState extends State<artistProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              artistBannerWidget(),
              const Center(child: artisInfoWidget()),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Albums",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 20.h,
                      child: ListView.builder(
                        padding: EdgeInsets.only(top: 15),
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return const artistAlbumsWidget();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Songs",
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "See More",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 23.h,
                      child: ListView.builder(
                        padding: EdgeInsets.only(top: 15),
                        itemCount: 3,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return artistSongsWidget();
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

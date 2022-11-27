import 'package:fdb_spotify/providers/releases_provider.dart';
import 'package:fdb_spotify/service/playlist_service.dart';
import 'package:fdb_spotify/service/releases_service.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AlbumWidget extends StatefulWidget {
  final String albumImage;
  final String albumName;
  final String songer;

  const AlbumWidget({
    super.key,
    required this.albumImage,
    required this.albumName,
    required this.songer,
  });

  @override
  State<AlbumWidget> createState() => _AlbumWidget();
}

class _AlbumWidget extends State<AlbumWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 30.w,
              height: 18.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(widget.albumImage),
                      fit: BoxFit.contain)),
            ),
            Container(
              width: 25.w,
              margin: EdgeInsets.only(left: 6),
              child: Text(
                widget.albumName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: 25.w,
              margin: EdgeInsets.only(left: 6),
              child: Text(
                widget.songer,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
      Positioned(
          bottom: 40, right: 10, child: Image.asset("assets/ic_play.png"))
    ]);
  }
}

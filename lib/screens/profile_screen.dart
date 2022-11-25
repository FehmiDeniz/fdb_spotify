import 'package:fdb_spotify/widgets/profileScreenWidgets/playlistSongs.dart';
import 'package:fdb_spotify/widgets/profileScreenWidgets/profileTop.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Stack(
          children: [
            SizedBox(
              width: 100.w,
              height: 100.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40))),
                    child: profileTopWidget(),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 23),
                    child: Text(
                      "PUBLIC PLAYLIST",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 53.h,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: 9,
                      itemBuilder: (context, index) {
                        return const playlistSongWidget();
                      },
                    ),
                  )
                ],
              ),
            ),
            Positioned(child: Image.asset("assets/im_backEffect.png"))
          ],
        ),
      ),
    );
  }
}

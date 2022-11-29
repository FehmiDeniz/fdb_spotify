import 'package:fdb_spotify/providers/playlist_provider.dart';
import 'package:fdb_spotify/providers/profile_playlist_provider.dart';
import 'package:fdb_spotify/providers/users_provider.dart';
import 'package:fdb_spotify/widgets/profileScreenWidgets/playlistSongs.dart';
import 'package:fdb_spotify/widgets/profileScreenWidgets/profileTop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  void initState() {
    Provider.of<ProfilePlaylistProvider>(context, listen: false)
        .getProfilePlaylistData();

    Provider.of<UsersProvider>(context, listen: false).getUsersData();
    super.initState();
  }

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
                    margin: EdgeInsets.only(left: 2.h),
                    child: Text(
                      "PUBLIC PLAYLIST",
                      style: TextStyle(
                          fontSize: 17.5.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Consumer(
                    builder: (context, ProfilePlaylistProvider value, child) {
                      return value.isProfilePlaylistLoaded == false
                          ? Container(
                              child: Text("LOADING"),
                            )
                          : SizedBox(
                              width: double.infinity,
                              height: 53.h,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    value.profilePlaylistData!.items!.length,
                                itemBuilder: (context, index) {
                                  return playlistSongWidget(
                                    playlistName: value
                                        .profilePlaylistData!.items![index].name
                                        .toString(),
                                    playlistImage: value.profilePlaylistData!
                                        .items![index].images![0].url!,
                                    playlistOwner: value.profilePlaylistData!
                                        .items![index].owner!.displayName!,
                                  );
                                },
                              ),
                            );
                    },
                  )
                ],
              ),
            ),
            Positioned(top: 30, child: Image.asset("assets/im_backEffect.png"))
          ],
        ),
      ),
    );
  }
}

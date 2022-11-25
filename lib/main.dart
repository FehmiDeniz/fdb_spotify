import 'package:fdb_spotify/provider/releases_provider.dart';
import 'package:fdb_spotify/screens/artist_profile_screen.dart';
import 'package:fdb_spotify/screens/home_screen.dart';
import 'package:fdb_spotify/screens/music_screen.dart';
import 'package:fdb_spotify/screens/profile_screen.dart';
import 'package:fdb_spotify/widgets/homeScreenWidgets/banner.dart';
import 'package:fdb_spotify/widgets/homeScreenWidgets/song.dart';
import 'package:fdb_spotify/widgets/musicScreenWidgets/nowPlayingTop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => ReleasesProvider(),
    )
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(),
            title: 'Material App',
            home: homeScreen());
      },
    );
  }
}

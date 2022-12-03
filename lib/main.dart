import 'package:fdb_spotify/providers/artist_album_provider.dart';
import 'package:fdb_spotify/providers/categories_playlist_provider.dart';
import 'package:fdb_spotify/providers/categories_provider.dart';
import 'package:fdb_spotify/providers/main_provider.dart';
import 'package:fdb_spotify/providers/playlist_provider.dart';
import 'package:fdb_spotify/providers/playlist_tracks_provider.dart';
import 'package:fdb_spotify/providers/profile_playlist_provider.dart';
import 'package:fdb_spotify/providers/releases_provider.dart';
import 'package:fdb_spotify/providers/users_provider.dart';
import 'package:fdb_spotify/screens/artist_profile_screen.dart';
import 'package:fdb_spotify/screens/categories_playlist_screen.dart';
import 'package:fdb_spotify/screens/home_screen.dart';
import 'package:fdb_spotify/screens/music_screen.dart';
import 'package:fdb_spotify/screens/playlist_tracks_screen.dart';
import 'package:fdb_spotify/screens/profile_screen.dart';
import 'package:fdb_spotify/screens/search_screen.dart';
import 'package:fdb_spotify/widgets/homeScreenWidgets/banner.dart';
import 'package:fdb_spotify/widgets/homeScreenWidgets/album.dart';
import 'package:fdb_spotify/widgets/musicScreenWidgets/nowPlayingTop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => ReleasesProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => PlaylistProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => UsersProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => ProfilePlaylistProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => ArtistAlbumProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => CategoriesProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => CategoriesPlaylistProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => PlaylistTracksProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => MainProvider(),
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
            home: MyHomePage());
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _select = [homeScreen(), SearchScreen(), profileScreen()];
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, MainProvider value, child) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 5.h,
                ),
                label: ""),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 5.h,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 5.h,
              ),
              label: '',
            ),
          ],
          currentIndex: value.selectedIndex,
          selectedItemColor: Colors.green[400],
          onTap: (de) {
            value.onItemTapped(de);
          },
        ),
        body: _select[value.selectedIndex],
      );
    });
  }
}

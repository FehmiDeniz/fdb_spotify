import 'package:fdb_spotify/providers/categories_playlist_provider.dart';
import 'package:fdb_spotify/widgets/categoriesPlaylistScreenWidgets/categorie_playlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoriePlaylistScreen extends StatefulWidget {
  final String playlistID;
  final String categorieTitle;
  const CategoriePlaylistScreen(
      {super.key, required this.playlistID, required this.categorieTitle});

  @override
  State<CategoriePlaylistScreen> createState() =>
      _CategoriePlaylistScreenState();
}

class _CategoriePlaylistScreenState extends State<CategoriePlaylistScreen> {
  @override
  void initState() {
    Provider.of<CategoriesPlaylistProvider>(context, listen: false)
        .getCategoriesPlaylistData(widget.playlistID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 4.w),
        child: SingleChildScrollView(
          child: SizedBox(
            width: 100.w,
            height: 100.h,
            child: Consumer(
              builder: (context, CategoriesPlaylistProvider value, child) {
                return value.isCategoriesPlaylistLoaded == false
                    ? Container()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            widget.categorieTitle,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text(
                            "Total Tracks: " +
                                value.categoriesPlaylistData!.playlists!
                                    .items![0].tracks!.total
                                    .toString(),
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 90.h,
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: value.categoriesPlaylistData!
                                  .playlists!.items!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return CategoriePlaylistWidget(
                                  playlistDescription: value
                                      .categoriesPlaylistData!
                                      .playlists!
                                      .items![index]
                                      .description!,
                                  playlistImage: value.categoriesPlaylistData!
                                      .playlists!.items![index].images![0].url!,
                                  playlistName: value.categoriesPlaylistData!
                                      .playlists!.items![index].name!,
                                  playlistID: value.categoriesPlaylistData!
                                      .playlists!.items![index].id!,
                                );
                              },
                            ),
                          ),
                        ],
                      );
              },
            ),
          ),
        ),
      ),
    );
  }
}

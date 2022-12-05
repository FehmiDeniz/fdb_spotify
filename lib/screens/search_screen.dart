import 'package:fdb_spotify/providers/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController? searchController = TextEditingController();

  @override
  void initState() {
    searchController;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
        child: SingleChildScrollView(
          child: SizedBox(
            width: 100.w,
            height: 100.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 9.h,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.h)),
                        labelText: "Artist, song or podcast"),
                    controller: searchController,
                    onChanged: (value) {
                      searchController!.text = value;

                      Provider.of<SearchProvider>(context, listen: false)
                          .getSearchTrackData(value);
                    },
                  ),
                ),
                Consumer(
                  builder: (context, SearchProvider value, child) {
                    return value.isLoadedTrack == false
                        ? Container()
                        : Expanded(
                            child: ListView.builder(
                              itemCount:
                                  value.searchTrackData!.tracks!.items!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: EdgeInsets.all(1.h),
                                  height: 15.h,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 15.w,
                                        height: 10.h,
                                        child: Image.network(value
                                            .searchTrackData!
                                            .tracks!
                                            .items![index]
                                            .album!
                                            .images![0]
                                            .url!),
                                      ),
                                      Text(value.searchTrackData!.tracks!
                                          .items![index].artists![0].name!),
                                      Text(value.searchTrackData!.tracks!
                                          .items![index].album!.name!)
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

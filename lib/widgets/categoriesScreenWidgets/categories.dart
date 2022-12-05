import 'package:fdb_spotify/screens/categories_playlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoriesWidget extends StatefulWidget {
  final String categorieTitle;
  final String categorieID;
  const CategoriesWidget(
      {super.key, required this.categorieTitle, required this.categorieID});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoriePlaylistScreen(
                playlistID: widget.categorieID,
                categorieTitle: widget.categorieTitle,
              ),
            ));
      },
      child: Container(
        padding: EdgeInsets.all(2.h),
        margin: EdgeInsets.only(left: 4.w, right: 2.w, top: 2.h),
        width: 38.w,
        height: 20.h,
        decoration: BoxDecoration(
            gradient: gradStyle(), borderRadius: BorderRadius.circular(5.w)),
        child: Text(
          widget.categorieTitle,
          style: TextStyle(color: Colors.white, fontSize: 19.sp),
        ),
      ),
    );
  }

  LinearGradient gradStyle() {
    return const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      stops: [
        0.1,
        0.4,
        0.6,
        0.9,
      ],
      colors: [
        Colors.blueGrey,
        Colors.purple,
        Colors.indigo,
        Colors.teal,
      ],
    );
  }
}

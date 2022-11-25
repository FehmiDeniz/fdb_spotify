import 'package:fdb_spotify/service/releases_service.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class searchWidget extends StatefulWidget {
  const searchWidget({super.key});

  @override
  State<searchWidget> createState() => _searchWidgetState();
}

class _searchWidgetState extends State<searchWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              getReleasesService();
            },
            icon: Icon(
              Icons.search,
            )),
        Container(
          width: 70.w,
          height: 5.h,
          child: TextField(
            showCursor: false,
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Search by Artist or Track'),
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(),
        Icon(Icons.more_vert)
      ],
    );
  }
}

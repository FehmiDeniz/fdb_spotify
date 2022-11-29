import 'package:fdb_spotify/screens/profile_screen.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 1.h),
            child: Image.asset("assets/im_spotify.png"),
          ),
          const Spacer(),
          // Icon(Icons.more_vert)
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => profileScreen(),
                    ));
              },
              icon: Icon(Icons.more_vert))
        ],
      ),
    );
  }
}

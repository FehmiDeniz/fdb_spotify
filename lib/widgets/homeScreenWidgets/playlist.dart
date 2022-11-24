import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class playlistWidget extends StatefulWidget {
  const playlistWidget({super.key});

  @override
  State<playlistWidget> createState() => _playlistWidgetState();
}

class _playlistWidgetState extends State<playlistWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                //incoming
              },
              child: Image.asset("assets/ic_play.png")),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("As It Was"),
              SizedBox(
                height: 1.h,
              ),
              Text("Harry Styles")
            ],
          ),
          Spacer(),
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite))
        ],
      ),
    );
  }
}

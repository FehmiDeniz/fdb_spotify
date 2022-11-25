import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class artistSongsWidget extends StatefulWidget {
  const artistSongsWidget({super.key});

  @override
  State<artistSongsWidget> createState() => artistSongsWidgetState();
}

class artistSongsWidgetState extends State<artistSongsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
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
              Text(
                "Dont Smile At me",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text("Billie Eilish")
            ],
          ),
          Spacer(),
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite))
        ],
      ),
    );
  }
}

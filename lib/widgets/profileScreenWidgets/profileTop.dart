import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class profileTopWidget extends StatefulWidget {
  const profileTopWidget({super.key});

  @override
  State<profileTopWidget> createState() => _profileTopWidgetState();
}

class _profileTopWidgetState extends State<profileTopWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 10.w,
              height: 10.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(0.2),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.keyboard_arrow_left_outlined,
                  size: 20,
                ),
              ),
            ),
            const Text(
              "Profile",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Icon(Icons.more_vert)
          ],
        ),
        Container(
          width: 30.w,
          height: 14.h,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage("assets/im_pp.png"), fit: BoxFit.cover),
          ),
        ),
        SizedBox(
          height: 1.5.h,
        ),
        Text("deneme123@gmail.com",
            style: TextStyle(fontStyle: FontStyle.italic)),
        SizedBox(
          height: 1.5.h,
        ), //usermail

        Text(
          "fdb123", //username
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 1.5.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("778",
                style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold)), //followers
            Text("243",
                style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold)), //following
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Followers"),
            Text("Following"),
          ],
        ),
      ],
    );
  }
}

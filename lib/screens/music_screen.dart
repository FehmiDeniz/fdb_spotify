import 'package:fdb_spotify/widgets/musicScreenWidgets/buttons.dart';
import 'package:fdb_spotify/widgets/musicScreenWidgets/nowPlayingTop.dart';
import 'package:fdb_spotify/widgets/musicScreenWidgets/songInfo.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class musicScreen extends StatefulWidget {
  const musicScreen({super.key});

  @override
  State<musicScreen> createState() => _musicScreenState();
}

class _musicScreenState extends State<musicScreen> {
  double _value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        child: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              nowPlayTopWidget(),
              SizedBox(
                height: 10,
              ),
              songInfoWidget(),
              Container(
                width: 400,
                child: SizedBox(
                  height: 35,
                  child: Slider(
                    activeColor: Color(0xff1ED760),
                    inactiveColor: Color(0xffD9D9D9),
                    min: 0.0,
                    max: 100.0,
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "0.22",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 18),
                    child: Text(
                      "2.53",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                ],
              ),
              buttonsWidget()
            ],
          ),
        ),
      ),
    );
  }
}
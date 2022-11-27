import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class bannerWidget extends StatefulWidget {
  const bannerWidget({super.key});

  @override
  State<bannerWidget> createState() => _bannerWidgetState();
}

class _bannerWidgetState extends State<bannerWidget> {
  @override
  Widget build(BuildContext context) {
    return (Container(
      width: 90.w,
      height: 17.h,
      decoration: BoxDecoration(
          color: const Color(0xff42C83C),
          borderRadius: BorderRadius.circular(5.h)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 45.w,
              height: 3.h,
              child: Text(
                "New Album",
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
            ),
            SizedBox(
              width: 35.w,
              height: 6.6.h,
              child: Text(
                "Happier Than Ever",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              width: 45.w,
              height: 3.h,
              child: Text(
                "Bille Eilish",
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

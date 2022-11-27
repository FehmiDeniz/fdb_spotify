import 'package:fdb_spotify/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class profileTopWidget extends StatefulWidget {
  const profileTopWidget({super.key});

  @override
  State<profileTopWidget> createState() => _profileTopWidgetState();
}

class _profileTopWidgetState extends State<profileTopWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, UsersProvider value, child) {
        return value.isLoadingUserData == false
            ? Container()
            : Column(
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                          image: NetworkImage(value.usersData!.images![0].url!),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  // Text(value.usersData!.email!,
                  //     style: TextStyle(fontStyle: FontStyle.italic)),
                  SizedBox(
                    height: 1.5.h,
                  ), //usermail

                  Text(
                    value.usersData!.displayName!, //username
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(value.usersData!.followers!.total.toString(),
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold)), //followers
                      Text(value.usersData!.followers!.total.toString(),
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold)), //following
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
      },
    );
  }
}

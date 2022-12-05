import 'package:fdb_spotify/providers/categories_provider.dart';
import 'package:fdb_spotify/service/categories_service.dart';
import 'package:fdb_spotify/widgets/categoriesScreenWidgets/categories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    Provider.of<CategoriesProvider>(context, listen: false).getCategoriesData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 12.w),
        child: SingleChildScrollView(
          child: SizedBox(
            width: 100.w,
            height: 100.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 9.h,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.h)),
                        labelText: "Artist, song or podcast"),
                  ),
                ),
                SizedBox(height: 1.h),
                Consumer(
                  builder: (context, CategoriesProvider value, child) {
                    return value.isCategoriesLoaded == false
                        ? Container()
                        : SizedBox(
                            width: double.infinity,
                            height: 83.h,
                            child: GridView.builder(
                              // shrinkWrap: true,
                              physics: ScrollPhysics(),
                              padding: EdgeInsets.only(top: 2.h),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 3 / 2,
                              ),
                              itemCount: 10,
                              itemBuilder: (BuildContext context, int index) {
                                return CategoriesWidget(
                                  categorieTitle: value.categoriesData!
                                      .categories!.items![index].name!,
                                  categorieID: value.categoriesData!.categories!
                                      .items![index].id!,
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

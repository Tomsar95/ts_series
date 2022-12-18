import 'package:flutter/material.dart';
import 'package:tv_series/features/core/utils/custom_colors.dart';
import 'package:tv_series/features/core/utils/text_styles.dart';
import 'package:tv_series/features/series/presentation/pages/favorites_page.dart';
import 'package:tv_series/features/series/presentation/pages/home_page.dart';
import 'package:tv_series/features/series/presentation/pages/recent_page.dart';
import 'package:tv_series/features/series/presentation/pages/search_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int pageIndex = 0;

  final pages = [
    const HomePage(),
    const FavoritesPage(),
    const RecentPage(),
    const SearchPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.softBlack,
      bottomNavigationBar: Container(
        height: 100,
        decoration: const BoxDecoration(
          color: CustomColors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                    pageIndex = 0;
                  });
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 2),
                      child: Icon(
                        Icons.home_outlined,
                        color: pageIndex == 0 ? CustomColors.yellow : CustomColors.white,
                        size: 32,
                      ),
                    ),
                    Text('Home', style: CustomTextStyles.gilroyLight.copyWith(fontSize: 12, color: pageIndex == 0 ? CustomColors.yellow : CustomColors.white),),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    pageIndex = 1;
                  });
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 2),
                      child: Icon(
                        Icons.favorite_border,
                        color: pageIndex == 1 ? CustomColors.yellow : CustomColors.white,
                        size: 32,
                      ),
                    ),
                    Text('Favorites', style: CustomTextStyles.gilroyLight.copyWith(fontSize: 12, color: pageIndex == 1 ? CustomColors.yellow : CustomColors.white),),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    pageIndex = 2;
                  });
                  },
                child: Column(
                  children: [
                    Padding(
                      padding:  const EdgeInsets.only(top: 10.0, bottom: 2),
                      child: Icon(
                        Icons.timelapse_outlined,
                        color: pageIndex == 2 ? CustomColors.yellow : CustomColors.white,
                        size: 32,
                      ),
                    ),
                    Text('Recent', style: CustomTextStyles.gilroyLight.copyWith(fontSize: 12, color: pageIndex == 2 ? CustomColors.yellow : CustomColors.white),),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    pageIndex = 3;
                  });
                },
                child: Column(
                  children: [
                    Padding(
                      padding:  const EdgeInsets.only(top: 10.0, bottom: 2),
                      child: Icon(
                        Icons.search,
                        color: pageIndex == 3 ? CustomColors.yellow : CustomColors.white,
                        size: 32,
                      ),
                    ),
                    Text('Search', style: CustomTextStyles.gilroyLight.copyWith(fontSize: 12, color: (pageIndex == 3) ? CustomColors.yellow : CustomColors.white),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: pages[pageIndex]
    );
  }
}

import 'package:e_comerce_app/core/config/size_config.dart';
import 'package:e_comerce_app/widgets/constant.dart';
import 'package:e_comerce_app/core/utils/features/tabs/favorites/presentation/favorite_page.dart';
import 'package:e_comerce_app/core/utils/features/tabs/home/presentation/home_page.dart';
import 'package:e_comerce_app/core/utils/features/tabs/profile/presentation/profile_page.dart';
import 'package:flutter/material.dart';

import '../../card/card_page.dart';
import '../../../details/details_page.dart';

class MainLayoutPage extends StatefulWidget {
  @override
  State<MainLayoutPage> createState() => _HomePageState();
}

class _HomePageState extends State<MainLayoutPage> {
  List<Widget> Pages = [
    const DetailsPage(),
    const FavoritePage(),
    HomePage(),
    const CardPage(),
    const ProfilePage(),
  ];
  int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentIndex = 2;
          });
        },
        backgroundColor: kContentColor,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.home,
          color: kPrimaryColor,
          size: 34,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: const Color.fromARGB(255, 223, 219, 219),
        height: 70,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
                icon: Icon(
                  Icons.grid_view_outlined,
                  color:
                      currentIndex == 0 ? kPrimaryColor : Colors.grey.shade400,
                  size: 30,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
                icon: Icon(
                  Icons.favorite_border,
                  color:
                      currentIndex == 1 ? kPrimaryColor : Colors.grey.shade400,
                  size: 30,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 3;
                  });
                },
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color:
                      currentIndex == 3 ? kPrimaryColor : Colors.grey.shade400,
                  size: 30,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 4;
                  });
                },
                icon: Icon(
                  Icons.person_2_outlined,
                  color:
                      currentIndex == 4 ? kPrimaryColor : Colors.grey.shade400,
                  size: 30,
                )),
          ],
        ),
      ),
      body: Pages[currentIndex],
    );
  }
}

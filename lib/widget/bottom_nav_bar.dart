import 'package:flutter/material.dart';
import 'package:netflix/screens/download_screen.dart';
import 'package:netflix/screens/home_screen.dart';
import 'package:netflix/screens/more_screen.dart';
import 'package:netflix/screens/search_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.black,
          height: 70,
          child: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.home),
              text: "Home",
            ),
            Tab(
              icon: Icon(Icons.search),
              text: "search",
            ),
            Tab(
              icon: Icon(Icons.photo_album_outlined),
              text: "New & Hot",
            ),
            Tab(
              icon: Icon(Icons.download),
              text: "Downloads",
            ),
          ],
          indicatorColor: Colors.transparent,
          labelColor: Colors.white,
          unselectedLabelStyle: TextStyle(color: Color(0xff999999)),
          ),
        ),

        body: const TabBarView(children: [
          HomeScreen(),
          SearchScreen(),
          MoreScreen(),
          DownloadsScreen(),
        ],
        ),
      ),
      );
  }
}
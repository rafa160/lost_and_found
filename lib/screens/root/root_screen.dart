import 'package:flutter/material.dart';
import 'package:found_and_lost_app/screens/home/home_screen.dart';
import 'package:found_and_lost_app/screens/lost_and_found/create_item.dart';

class RootScreen extends StatefulWidget {
  @override
  _RootScreenState createState() => _RootScreenState();
}

PageController pageController;

class _RootScreenState extends State<RootScreen> {
  int _page = 0;

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  void initState() {
    if (pageController == null) {
      pageController = PageController();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          HomeScreen(),
          CreateItem(),
          Container(),
          Container(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              iconSize: 30,
              color: _page == 0  ? Colors.yellow.shade700 : Colors.yellow.shade700,
              onPressed: () {
                pageController.jumpToPage(0);
              },
            ),
            IconButton(
              icon: Icon(Icons.add_circle_outlined),
              iconSize: 30,
              color: _page == 1 ? Colors.red : Colors.yellow.shade700,
              onPressed: () {
                pageController.jumpToPage(1);
              },
            ),
            IconButton(
              icon: Icon(Icons.dock_rounded),
              iconSize: 30,
              color: _page == 2
                  ? Colors.red
                  : Colors.yellow.shade700,
              onPressed: () {
                pageController.jumpToPage(2);
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              iconSize: 30,
              color: _page == 3
                  ? Colors.red
                  : Colors.yellow.shade700,
              onPressed: () {
                pageController.jumpToPage(3);
              },
            ),
          ],
        ),
      ),
    );
  }
}

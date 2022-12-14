import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:dev_hack/DataPage.dart';
import 'package:dev_hack/DevicePage.dart';
import 'package:dev_hack/test.dart';
import 'package:flutter/material.dart';
import 'HomeScreen.dart';


class PageManager extends StatefulWidget {
  const PageManager({Key? key}) : super(key: key);
  static const routName = "/home";

  @override
  State<PageManager> createState() => _PageManagerState();
}

class _PageManagerState extends State<PageManager> {
  final _pageController = PageController(initialPage: 1);

  int maxCount = 3;

  final List<Widget> bottomBarPages = [
    LineChartSample2(),
    HomeScreen(),
    DevicePage(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
        pageController: _pageController,
        color: Color(0xFF758ECD),
        showLabel: false,
        notchColor: Color(0xFF758ECD),
        bottomBarItems: [
          const BottomBarItem(
            inActiveItem: Icon(
              Icons.calendar_month_outlined,
              color: Colors.white,
            ),
            activeItem: Icon(
              Icons.calendar_month_outlined,
              color: Colors.white,
            ),
            itemLabel: 'Page 1',
          ),
          const BottomBarItem(
            inActiveItem: Icon(
              Icons.home_filled,
              color: Colors.white,
            ),
            activeItem: Icon(
              Icons.home_filled,
              color: Colors.white,
            ),
            itemLabel: 'Page 2',
          ),
          const BottomBarItem(
            inActiveItem: Icon(
              Icons.perm_contact_cal_rounded,
              color: Colors.white,
            ),
            activeItem: Icon(
              Icons.perm_contact_cal_rounded,
              color: Colors.white,
            ),
            itemLabel: 'Page 3',
          ),
        ],
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
          );
        },
      )
          : null,
    );
  }
}

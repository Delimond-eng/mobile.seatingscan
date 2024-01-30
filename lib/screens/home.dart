import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seating_scan/components/app_bg.dart';
import 'package:seating_scan/pages/guest_page.dart';

import '../pages/scanner_page.dart';
import '../pages/tables_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _pageController = PageController(initialPage: 0);
  final _controller = NotchBottomBarController(index: 0);

  int maxCount = 5;
  int currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// widget list
  final List<Widget> bottomBarPages = [
    const ScannersPage(),
    const GuestsPage(),
    const TablesPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: AppBackground(
        opacity: .9,
        child: bottomBarPages.elementAt(currentIndex),
      ),
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              notchBottomBarController: _controller,
              color: Colors.grey.shade800,
              showLabel: false,
              showShadow: false,
              notchColor: const Color(0xFFbf516a),
              removeMargins: false,
              bottomBarWidth: 500,
              durationInMilliSeconds: 300,
              bottomBarItems: [
                BottomBarItem(
                  inActiveItem: SvgPicture.asset(
                    "assets/svgs/qrcode-scan.svg",
                    height: 22.0,
                    colorFilter:
                        ColorFilter.mode(Colors.grey.shade200, BlendMode.srcIn),
                  ),
                  activeItem: SvgPicture.asset(
                    "assets/svgs/qrcode-scan.svg",
                    height: 22.0,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                  itemLabel: 'Qrcode',
                ),
                BottomBarItem(
                  inActiveItem: SvgPicture.asset(
                    "assets/svgs/guests-1.svg",
                    height: 22.0,
                    colorFilter:
                        ColorFilter.mode(Colors.grey.shade200, BlendMode.srcIn),
                  ),
                  activeItem: SvgPicture.asset(
                    "assets/svgs/guests-1.svg",
                    height: 22.0,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                  itemLabel: 'Guests',
                ),
                BottomBarItem(
                  inActiveItem: SvgPicture.asset(
                    "assets/svgs/table-desk.svg",
                    height: 22.0,
                    colorFilter:
                        ColorFilter.mode(Colors.grey.shade200, BlendMode.srcIn),
                  ),
                  activeItem: SvgPicture.asset(
                    "assets/svgs/table-desk.svg",
                    height: 22.0,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                  itemLabel: 'Tables',
                ),
              ],
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            )
          : null,
    );
  }
}

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/svgIcon_widget.dart';

import 'constants.dart';
import 'routes/screen_export.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EntryPointState createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  final List<Widget> _pages = [
    const HomeScreenPage(),
    const DeviceScreenPage(),
    const FlameScreenPage(),
    const DiscoverScreenPage(),
    const NotificationScreenPage(),
    const SettingScreenPage(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: const SizedBox(),
        leadingWidth: 0,
        centerTitle: false,
        title: Row(
          children: [
            SvgPicture.asset(
              "assets/svg/logo-iot.svg",
              color: primaryColor,
              height: 30,
              width: 30,
            ),
            const SizedBox(width: defaultPadding / 2),
            const Text(
              "Central Control",
              style: TextStyle(
                color: primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgIconWidget(
                src: "assets/svg/notification.svg",
                color: Theme.of(context).textTheme.bodyText1!.color,
              )),
          IconButton(
              onPressed: () {},
              icon: SvgIconWidget(
                src: "assets/svg/notification.svg",
                color: Theme.of(context).textTheme.bodyText1!.color,
              )),
        ],

      ),
      body: PageTransitionSwitcher(
        duration: defaultDuration,
        transitionBuilder: (child, animation, secondAnimation) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondAnimation,
            child: child,
          );
        },
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: defaultPadding / 2),
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : const Color(0xFF101015),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            if (index != _currentIndex) {
              setState(() {
                _currentIndex = index;
              });
            }
          },
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : const Color(0xFF101015),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.transparent,
          items: const [
            BottomNavigationBarItem(
              icon: SvgIconWidget(src: "assets/svg/home.svg"),
              activeIcon: SvgIconWidget(
                  src: "assets/svg/home.svg", color: primaryColor),
              label: "Trang chủ",
            ),
            BottomNavigationBarItem(
              icon: SvgIconWidget(src: "assets/svg/device.svg"),
              activeIcon: SvgIconWidget(
                  src: "assets/svg/device.svg", color: primaryColor),
              label: "Thiết bị",
            ),
            BottomNavigationBarItem(
              icon: SvgIconWidget(src: "assets/svg/flame.svg"),
              activeIcon:
                  SvgIconWidget(src: "assets/svg/flame.svg", color: errorColor),
              label: "Cháy nhà",
            ),
            BottomNavigationBarItem(
              icon: SvgIconWidget(src: "assets/svg/discover.svg"),
              activeIcon: SvgIconWidget(
                  src: "assets/svg/discover.svg", color: primaryColor),
              label: "Tiện ích",
            ),
            BottomNavigationBarItem(
              icon: SvgIconWidget(src: "assets/svg/notification.svg"),
              activeIcon: SvgIconWidget(
                  src: "assets/svg/notification.svg", color: primaryColor),
              label: "Thông báo",
            ),
            BottomNavigationBarItem(
              icon: SvgIconWidget(src: "assets/svg/setting.svg"),
              activeIcon: SvgIconWidget(
                  src: "assets/svg/setting.svg", color: primaryColor),
              label: "Cài đặt",
            ),
          ],
        ),
      ),
    );
  }
}

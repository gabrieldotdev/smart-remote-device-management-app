import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
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
        elevation: 0,
        leadingWidth: 0,
        centerTitle: false,
        title: Row(
          children: [

            SvgPicture.asset(
              "assets/svg/ic-homer-simpson.svg",
              color: primaryColor,
              height: 30,
              width: 30,
            ),
            const SizedBox(width: defaultPadding / 2),
            Text(
              "End Of Term",
              style: GoogleFonts.poppins(
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
                src: "assets/icon/notification.svg",
                color: Theme.of(context).textTheme.bodyText1!.color,
              )),
          IconButton(
              onPressed: () {},
              icon: SvgIconWidget(
                src: "assets/icon/notification.svg",
                color: Theme.of(context).textTheme.bodyText1!.color,
              )),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kBottomNavigationBarHeight),
          child: Container(
            padding: const EdgeInsets.only(top: defaultPadding / 2),
            color: Theme.of(context).brightness == Brightness.light
                ? Theme.of(context).scaffoldBackgroundColor
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
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: primaryColor,
              unselectedItemColor: Colors.transparent,
              elevation: 0,
              items: const [
                BottomNavigationBarItem(
                    icon: SvgIconWidget(src: "assets/icon/home.svg"),
                    activeIcon: SvgIconWidget(
                        src: "assets/icon/home.svg", color: primaryColor),
                    label: "------------",
                ),
                BottomNavigationBarItem(
                  icon: SvgIconWidget(src: "assets/icon/device.svg"),
                  activeIcon: SvgIconWidget(
                      src: "assets/icon/device.svg", color: primaryColor),
                  label: "------------",
                ),
                BottomNavigationBarItem(
                  icon: SvgIconWidget(src: "assets/icon/flame.svg"),
                  activeIcon: SvgIconWidget(
                      src: "assets/icon/flame.svg", color: errorColor),
                  label: "------------",
                ),
                BottomNavigationBarItem(
                  icon: SvgIconWidget(src: "assets/icon/discover.svg"),
                  activeIcon: SvgIconWidget(
                      src: "assets/icon/discover.svg", color: primaryColor),
                  label: "------------",
                ),
                BottomNavigationBarItem(
                  icon: SvgIconWidget(src: "assets/icon/notification.svg"),
                  activeIcon: SvgIconWidget(
                      src: "assets/icon/notification.svg", color: primaryColor),
                  label: "------------",
                ),
                BottomNavigationBarItem(
                  icon: SvgIconWidget(src: "assets/icon/setting.svg"),
                  activeIcon: SvgIconWidget(
                      src: "assets/icon/setting.svg", color: primaryColor),
                  label: "------------",
                ),
              ],
            ),
          ),
        ),
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
    );
  }
}

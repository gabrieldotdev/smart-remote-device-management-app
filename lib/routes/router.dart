import 'package:flutter/material.dart';

import 'screen_export.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const HomeScreenPage(),
      );

    case deviceScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const DeviceScreenPage(),
      );

    case flameScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const FlameScreenPage(),
      );

    case exploreScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const ExploreScreenPage(),
      );

    case notificationScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const NotificationScreenPage(),
      );

    case settingScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const SettingScreenPage(),
      );

    case onboardingScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const OnboardingScreenPage(),
      );

    case entryPointScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const EntryPoint(),
      );

    default:
      return MaterialPageRoute(
        // Make a screen for undefine
        builder: (context) => const EntryPoint(),
      );
  }
}

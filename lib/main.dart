import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../routes/screen_export.dart';
import '../routes/router.dart' as router;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
      // initialRoute: onboardingScreenRoute,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';

class OnboardingScreenPage extends StatelessWidget {
  const OnboardingScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Image.asset('assets/image/flame-success.png', fit: BoxFit.cover), flex: 1),
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/image/bg-241.png'),
                    Text(
                      'Giao diện tương tác với thiết bị, tương lai điều khiển thiết bị bằng cách tích hợp công nghệ não bộ...',
                      style: GoogleFonts.asap(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: whiteColor,

                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

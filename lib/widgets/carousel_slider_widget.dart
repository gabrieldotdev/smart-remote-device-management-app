import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_remote_device_management/constants.dart';

class CarouselSliderWidget extends StatelessWidget {
  final String title_first;
  final String title_second;
  final String imageUrl;
  final VoidCallback? onTap;

  const CarouselSliderWidget({
    Key? key,
    required this.title_first,
    required this.title_second,
    required this.imageUrl,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: whiteColor,
            boxShadow: [
              BoxShadow(
                color: whileColor80.withOpacity(0.2),
                offset: const Offset(0, 2),
                blurRadius: 10.0,
              ),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                colors: [
                  whiteColor.withOpacity(0.8),
                  whiteColor.withOpacity(0.2),
                ],
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title_first,
                    style: GoogleFonts.asap(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: primaryColor.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    title_second,
                    style: GoogleFonts.asap(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: primaryColor.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

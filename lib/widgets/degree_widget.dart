import 'dart:async';
import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_remote_device_management/widgets/svgIcon_widget.dart';
import '../constants.dart';

class DegreeWidget extends StatefulWidget {
  const DegreeWidget({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DegreeWidgetState createState() => _DegreeWidgetState();
}

class _DegreeWidgetState extends State<DegreeWidget> {
  double nhietDoValue = 0;
  int doAmValue = 0;
  late final DatabaseReference nhietDo =
      FirebaseDatabase.instance.ref("nhietDo");
  late final DatabaseReference doAm = FirebaseDatabase.instance.ref("doAm");

  void initState() {
    super.initState();
    getItems();
  }

  void getItems() async {
    nhietDo.onValue.listen((event) {
      var snapshot = event.snapshot;
      if (snapshot.exists) {
        setState(() {
          if (!mounted) {
            super.dispose();
            return;
          }
          ;
          nhietDoValue = snapshot.value as double;
        });
      }
    });
    doAm.onValue.listen((event) {
      var snapshot = event.snapshot;
      if (snapshot.exists) {
        setState(() {
          if (!mounted) {
            super.dispose();
            return;
          }
          ;
          doAmValue = snapshot.value as int;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      width: double.infinity,
      height: 150,
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
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/icon/i8-flame.svg',
              height: 50,
              color: errorColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Nhiệt độ: ${nhietDoValue.toStringAsFixed(1)}°C',
                  style: GoogleFonts.asap(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: primaryColor.withOpacity(0.8),
                  ),
                ),
                Text(
                  'Độ ẩm: ${doAmValue.toString()}%',
                  style: GoogleFonts.asap(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: primaryColor.withOpacity(0.8),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              'Một môi trường an toàn cho gia đình bạn',
              style: GoogleFonts.asap(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: primaryColor.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

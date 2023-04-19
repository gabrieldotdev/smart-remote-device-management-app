import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_remote_device_management/constants.dart';
import 'package:smart_remote_device_management/widgets/svgIcon_widget.dart';
import 'package:vibration/vibration.dart';

class FlameScreenPage extends StatefulWidget {
  const FlameScreenPage({Key? key}) : super(key: key);

  @override
  State<FlameScreenPage> createState() => _FlameScreenPageState();
}

class _FlameScreenPageState extends State<FlameScreenPage> {
  bool value = false;
  late final DatabaseReference databaseReference =
  FirebaseDatabase.instance.ref("fire");

  @override
  void initState() {
    super.initState();
    getItems();
  }

  void getItems() async {
    databaseReference.onValue.listen((event) {
      var snapshot = event.snapshot;
      if (snapshot.exists) {
        setState(() {
          if (!mounted) {
            super.dispose();
            return;
          };
          value = snapshot.value as bool;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: value == true ? Container(
        margin: const EdgeInsets.all(20.0),
        width: double.infinity,
        height: 200,
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
              const SvgIconWidget(src: 'assets/icon/i8-flame.svg', color: errorColor),
              Text(
                'Cháy nhà',
                style: GoogleFonts.asap(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: primaryColor.withOpacity(0.8),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Phát hiện nhiệt độ quá mức quy định tại gian phòng bếp của bạn.',
                style: GoogleFonts.asap(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: primaryColor.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
      ) : Container(
        margin: const EdgeInsets.all(20.0),
        width: double.infinity,
        height: 200,
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
              const SvgIconWidget(src: 'assets/icon/i8-flame.svg', color: successColor),
              Text(
                'Nhà vẫn là nhà',
                style: GoogleFonts.asap(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: primaryColor.withOpacity(0.8),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Mái ấm gia đình việt là biểu tượng của sự hạnh phúc, một khi nhà đã cháy thì đừng hỏi tại sao nhà lại cháy, còn nhà mà không cháy thì nó chả thèm cháy đâu.',
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
    );
  }
}


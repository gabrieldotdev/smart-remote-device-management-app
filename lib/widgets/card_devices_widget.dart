import 'dart:async';
import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';

class CardDevicesWidget extends StatefulWidget {
  const CardDevicesWidget({
    Key? key,
    required this.ref,
    required this.title,
    required this.icon,
    required this.selectedIcon,
    this.onTap,
    this.onTapDown,
  }) : super(key: key);

  final String title;
  final String icon;
  final String selectedIcon;
  final VoidCallback? onTap;
  final VoidCallback? onTapDown;

  final String ref;

  @override
  // ignore: library_private_types_in_public_api
  _CardDevicesWidgetState createState() => _CardDevicesWidgetState();
}

class _CardDevicesWidgetState extends State<CardDevicesWidget> {
  late final DatabaseReference databaseReference =
      FirebaseDatabase.instance.ref(widget.ref);
  Timer? _timer;

  bool isLoading = true;
  bool value = false;

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the Timer if exists
    super.dispose();
  }

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
          isLoading = false;
          value = snapshot.value as bool;
        });
      }
    });
  }

  void updateData(data) async {
    databaseReference.set(data);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        if (!value) return;
        _timer = Timer(const Duration(seconds: 1), () {
          widget.onTapDown?.call();
        });
      },
      onTapCancel: () {
        _timer?.cancel();
      },
      child: GestureDetector(
        onTap: () {
          setState(() {
            updateData(!value);
          });
          widget.onTap?.call();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 36,
          ),
          width: 156,
          decoration: BoxDecoration(
            color: value ? null : blackColor10.withOpacity(0.5),
            gradient: value ? primaryGradientColor : null,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              SvgPicture.asset(
                value ? widget.selectedIcon : widget.icon,
                height: 50,
                color: value ? Colors.white : primaryColor,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: value ? Colors.white : primaryColor,
                        ),
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: pi / 2,
                    child: CupertinoSwitch(
                      activeColor: whiteColor,
                      thumbColor: primaryColor,
                      value: value,
                      onChanged: (newVal) {
                        setState(() {
                          updateData(newVal);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

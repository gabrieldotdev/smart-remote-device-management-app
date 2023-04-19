// import 'dart:async';
// import 'dart:math';
// import 'dart:ui';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:vibration/vibration.dart';
// import '../constants.dart';
//
// class NotificationFlameWidget extends StatefulWidget {
//   const NotificationFlameWidget({
//     Key? key,
//     required this.src_s0,
//     required this.src_s1,
//   }) : super(key: key);
//
//   final CallbackAction src_s0;
//   final CallbackAction src_s1;
//
//   @override
//   // ignore: library_private_types_in_public_api
//   _NotificationFlameWidgetState createState() => _NotificationFlameWidgetState();
// }
//
// class _NotificationFlameWidgetState extends State<NotificationFlameWidget> {
//   int value = 0;
//   late final DatabaseReference databaseReference =
//   FirebaseDatabase.instance.ref("fire");
//
//   @override
//   void initState() {
//     super.initState();
//     getItems();
//   }
//
//   void getItems() async {
//     databaseReference.onValue.listen((event) {
//       var snapshot = event.snapshot;
//       if (snapshot.exists) {
//         setState(() {
//           if (!mounted) {
//             super.dispose();
//             return;
//           };
//           value = snapshot.value as int;
//           if (value == 0) {
//             Vibration.vibrate(duration: 5000);
//           } else {
//             Vibration.cancel();
//           }
//         });
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return value == 0 ? widget.src_s0 : widget.src_s1;
//   }
// }

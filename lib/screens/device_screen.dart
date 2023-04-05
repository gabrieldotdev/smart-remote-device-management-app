import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_remote_device_management/constants.dart';
import 'package:smart_remote_device_management/widgets/card_devices_widget.dart';

class DeviceScreenPage extends StatefulWidget {
  const DeviceScreenPage({Key? key}) : super(key: key);

  @override
  State<DeviceScreenPage> createState() => _DeviceScreenPageState();
}

class _DeviceScreenPageState extends State<DeviceScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Text(
                      'Tích hợp công nghệ Arduino!',
                      style: GoogleFonts.roboto(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'CHỨC NĂNG CHÍNH',
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: primaryColor
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CardDevicesWidget(
                          onTap: () {
                            print('Đèn');
                          },
                          ref: 'light',
                          icon: 'assets/svg/lamp-off.svg',
                          selectedIcon: 'assets/svg/lamp-on.svg',
                          title: 'BÓNG ĐÈN',
                        ),
                        CardDevicesWidget(
                          onTap: () {
                            print('Điều hoà');
                          },
                          ref: 'dieuHoa',
                          icon: 'assets/svg/air-conditioner-off.svg',
                          selectedIcon: 'assets/svg/air-conditioner-on.svg',
                          title: 'ĐIỀU HOÀ',
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CardDevicesWidget(
                          onTap: () {
                            print('máy giặt ');
                          },
                          ref: 'mayGiat',
                          icon: 'assets/svg/lamp-off.svg',
                          selectedIcon: 'assets/svg/lamp-on.svg',
                          title: 'MÁY GIẶT',
                        ),
                        CardDevicesWidget(
                          onTap: () {
                            print('fan');
                          },
                          ref: 'fan',
                          icon: 'assets/svg/air-conditioner-off.svg',
                          selectedIcon: 'assets/svg/air-conditioner-on.svg',
                          title: 'QUẠT TRỜI',
                        ),
                      ],
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

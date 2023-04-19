import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_remote_device_management/constants.dart';
import 'package:smart_remote_device_management/widgets/card_devices_widget.dart';

import '../widgets/carousel_slider_widget.dart';
import '../widgets/degree_widget.dart';
import '../widgets/svgIcon_widget.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  int _currentSlideIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [

          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
            child: Text(
              'Thiết bị tự huỷ tại nhà tiện lợi cho mọi nhà',
              style: GoogleFonts.asap(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: primaryColor.withOpacity(0.8),
              ),
            ),
          ),
          // CAROUEL SLIDER
          Stack(
            alignment: Alignment.center,
            children: [
              CarouselSlider(
                items: [
                  CarouselSliderWidget(
                    imageUrl:
                        'https://images.unsplash.com/photo-1583847268964-b28dc8f51f92?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGl2aW5nJTIwcm9vbXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                    title_first: 'Gian phòng khách',
                    title_second: 'Nơi quy tụ của gia đình, bạn bè.',
                    onTap: () {
                      print('Nhà bếp');
                    },
                  ),
                  CarouselSliderWidget(
                    imageUrl:
                        'https://images.unsplash.com/photo-1600489000022-c2086d79f9d4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8a2l0Y2hlbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                    title_first: 'Gian bếp mới',
                    title_second:
                        'Không gian ấm áp và thoải mái cho chiếc bụng đói.',
                    onTap: () {
                      print('Bếp');
                    },
                  ),
                  CarouselSliderWidget(
                    imageUrl:
                        'https://images.unsplash.com/photo-1615874959474-d609969a20ed?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YmVkcm9vbXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                    title_first: 'Gian phòng ngủ',
                    title_second: 'Tựa như lông mày của bạn, không thể thiếu.',
                    onTap: () {
                      print('Ngủ');
                    },
                  ),
                  CarouselSliderWidget(
                    imageUrl:
                        'https://images.unsplash.com/photo-1552321554-5fefe8c9ef14?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8YmF0aHJvb218ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                    title_first: 'Gian phòng tắm',
                    title_second:
                        'Chúng ta có thả rông, là một chốn bồng lai tiên cảnh tuyệt vời.',
                    onTap: () {
                      print('Tắm');
                    },
                  ),
                ],
                options: CarouselOptions(
                  height: 500.0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                  autoPlayCurve: Curves.decelerate,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    // Thêm callback để cập nhật chỉ số ảnh hiện tại
                    setState(() {
                      _currentSlideIndex = index;
                    });
                  },
                ),
              ),
              Positioned(
                bottom: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) {
                    // Tạo ra danh sách dấu chấm dựa trên số lượng ảnh
                    return Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 2.0),
                      decoration: BoxDecoration(
                        color: index ==
                                _currentSlideIndex // Đặt màu sắc khác nhau cho dấu chấm tại chỉ số ảnh hiện tại
                            ? primaryColor.withOpacity(0.5)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
          // TITLE
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
            child: Row(
              children: [
                Container(
                  width: 6,
                  height: 20,
                  margin: const EdgeInsets.only(right: 10.0),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Text(
                  'Theo dõi khí hậu',
                  style: GoogleFonts.asap(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: primaryColor),
                ),
              ],
            ),
          ),
          // NHIỆT ĐỘ & ĐỘ ẨM
          const DegreeWidget(),
          // TITLE
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
            child: Row(
              children: [
                Container(
                  width: 6,
                  height: 20,
                  margin: const EdgeInsets.only(right: 10.0),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Text(
                  'Tính năng đang phát triển',
                  style: GoogleFonts.asap(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: primaryColor),
                ),
              ],
            ),
          ),
          // LIST DEVICE
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20.0),
                    child: CardDevicesWidget(
                      onTap: () {
                        print('Đèn');
                      },
                      ref: 'light',
                      icon: 'assets/svg/lamp-off.svg',
                      selectedIcon: 'assets/svg/lamp-on.svg',
                      title: 'BÓNG ĐÈN',
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20.0),
                    child: CardDevicesWidget(
                      onTap: () {
                        print('Điều hoà');
                      },
                      ref: 'dieuHoa',
                      icon: 'assets/svg/air-conditioner-off.svg',
                      selectedIcon: 'assets/svg/air-conditioner-on.svg',
                      title: 'ĐIỀU HOÀ',
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20.0),
                    child: CardDevicesWidget(
                      onTap: () {
                        print('máy giặt ');
                      },
                      ref: 'mayGiat',
                      icon: 'assets/svg/lamp-off.svg',
                      selectedIcon: 'assets/svg/lamp-on.svg',
                      title: 'MÁY GIẶT',
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20.0),
                    child: CardDevicesWidget(
                      onTap: () {
                        print('fan');
                      },
                      ref: 'fan',
                      icon: 'assets/svg/air-conditioner-off.svg',
                      selectedIcon: 'assets/svg/air-conditioner-on.svg',
                      title: 'QUẠT TRỜI',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

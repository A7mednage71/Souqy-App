import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/extensions/theme_context.dart';

class HomeScreenBannersSlider extends StatefulWidget {
  const HomeScreenBannersSlider({super.key});

  @override
  State<HomeScreenBannersSlider> createState() =>
      _HomeScreenBannersSliderState();
}

class _HomeScreenBannersSliderState extends State<HomeScreenBannersSlider> {
  late CarouselSliderController carouselController;
  int _currentIndex = 0;
  @override
  void initState() {
    carouselController = CarouselSliderController();
    super.initState();
  }

  List<String> banners = [
    'https://img.freepik.com/free-psd/new-collection-fashion-sale-web-banner-template_120329-1507.jpg?semt=ais_hybrid',
    'https://img.freepik.com/premium-psd/special-black-friday-women-bag-sale-banner-template_361928-1604.jpg?semt=ais_hybrid',
    'https://img.freepik.com/premium-psd/modern-furniture-sale-banner-design_345426-597.jpg?w=740',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: carouselController,
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          itemCount: banners.length,
          itemBuilder: (context, index, realIndex) {
            final dannerImage = banners[index];
            return Padding(
              padding: EdgeInsets.all(5.r),
              child: Container(
                height: 160.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: CachedNetworkImageProvider(dannerImage),
                  ),
                ),
              ),
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                height: _currentIndex == index ? 10.h : 8.h,
                width: _currentIndex == index ? 10.w : 8.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? context.themeColors.bluePinkLight
                      : Colors.grey,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}

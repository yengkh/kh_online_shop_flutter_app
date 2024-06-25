import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePageCarocelSlider extends StatefulWidget {
  const HomePageCarocelSlider({super.key});

  @override
  State<HomePageCarocelSlider> createState() => _HomePageCarocelSliderState();
}

int _pageActiveController = 0;

class _HomePageCarocelSliderState extends State<HomePageCarocelSlider> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GlowingOverscrollIndicator(
          axisDirection: AxisDirection.right,
          color: Colors.pink.shade300,
          child: CarouselSlider(
            options: CarouselOptions(
              enableInfiniteScroll: false,
              onPageChanged: (index, reson) {
                setState(() {
                  _pageActiveController = index;
                });
              },
              height: 180.0,
              viewportFraction: 1,
            ),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: const BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'text $i',
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        Positioned(
          bottom: 10.0,
          left: MediaQuery.of(context).size.width / 2 - 50.0,
          child: AnimatedSmoothIndicator(
            effect: const ExpandingDotsEffect(
              activeDotColor: Colors.pink,
              dotHeight: 4.0,
              dotWidth: 10.0,
            ),
            activeIndex: _pageActiveController,
            count: 5,
          ),
        ),
      ],
    );
  }
}

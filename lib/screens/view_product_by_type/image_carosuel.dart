import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageCarosuel extends StatefulWidget {
  const ImageCarosuel({
    super.key,
    required this.pageIndexNotifier,
    required this.imageList,
  });

  @override
  State<ImageCarosuel> createState() => _ImageCarosuelState();
  final ValueNotifier<int> pageIndexNotifier;
  final List<String> imageList;
}

class _ImageCarosuelState extends State<ImageCarosuel> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            height: 200.0,
            autoPlay: true,
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) {
              widget.pageIndexNotifier.value = index;
            },
          ),
          items: widget.imageList.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.asset(
                      i,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          bottom: 10.0,
          left: 0.0,
          right: 0.0,
          child: Center(
            child: ValueListenableBuilder<int>(
              valueListenable: widget.pageIndexNotifier,
              builder: (
                BuildContext context,
                int value,
                Widget? child,
              ) {
                return AnimatedSmoothIndicator(
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Colors.pink,
                    dotHeight: 4.0,
                    dotWidth: 10.0,
                  ),
                  activeIndex: value,
                  count: widget.imageList.length,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

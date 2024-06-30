import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/top_position_of_detail_page.dart';
import 'package:kh_online_shop_app_flutter/widgets/more_widget/arrow_back_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class TopImagePath extends StatefulWidget {
  TopImagePath({super.key, required this.currentActiveIndex});

  @override
  State<TopImagePath> createState() => _TopImagePathState();
  int currentActiveIndex;
}

class _TopImagePathState extends State<TopImagePath> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GlowingOverscrollIndicator(
          axisDirection: AxisDirection.right,
          color: Colors.grey.shade400,
          child: CarouselSlider(
            options: CarouselOptions(
                enableInfiniteScroll: false,
                height: 300.0,
                viewportFraction: 1,
                onPageChanged: (index, reson) {
                  setState(() {
                    widget.currentActiveIndex = index;
                  });
                }),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(color: Colors.amber),
                    child: Image.asset(
                      'assets/images/tree.jpg',
                      fit: BoxFit.cover,
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        const TopPositionOfDetailPage(
          childOfItem: ArrowBackWidget(),
          leftPosition: 20.0,
        ),
        const TopPositionOfDetailPage(
          childOfItem: Icon(Icons.favorite_outline_rounded),
          rightPosition: 20.0,
        ),
        Positioned(
          bottom: 20.0,
          left: 0.0,
          right: 0.0,
          child: Center(
            child: AnimatedSmoothIndicator(
              effect: const ExpandingDotsEffect(
                activeDotColor: Colors.pink,
                dotHeight: 4.0,
                dotWidth: 10.0,
              ),
              count: 5,
              axisDirection: Axis.horizontal,
              activeIndex: widget.currentActiveIndex,
            ),
          ),
        ),
      ],
    );
  }
}

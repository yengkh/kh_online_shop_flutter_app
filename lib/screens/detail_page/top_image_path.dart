import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/top_position_of_detail_page.dart';
import 'package:kh_online_shop_app_flutter/widgets/more_widget/arrow_back_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class TopImagePath extends StatefulWidget {
  TopImagePath({
    super.key,
    required this.currentActiveIndex,
    required this.allImageData,
  });

  @override
  State<TopImagePath> createState() => _TopImagePathState();
  int currentActiveIndex;
  final Map<String, dynamic> allImageData;
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
            items: widget.allImageData.values.toList().map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 50.0,
                        right: 50.0,
                        top: 60.0,
                        bottom: 50.0,
                      ),
                      child: Image.network(
                        i.toString(),
                        fit: BoxFit.contain,
                      ),
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
              count: widget.allImageData.values.toList().length,
              axisDirection: Axis.horizontal,
              activeIndex: widget.currentActiveIndex,
            ),
          ),
        ),
      ],
    );
  }
}

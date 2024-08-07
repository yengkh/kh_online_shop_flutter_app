import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kh_online_shop_app_flutter/apis/home_page_carocel_api.dart';
import 'package:kh_online_shop_app_flutter/models/home_page_carocel_model.dart';
import 'package:kh_online_shop_app_flutter/screens/shimmer_items/home_page_shimmer.dart';
import 'package:kh_online_shop_app_flutter/widgets/more_widget/home_page_404_error.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePageCarocelSlider extends StatefulWidget {
  const HomePageCarocelSlider({super.key});

  @override
  State<HomePageCarocelSlider> createState() => _HomePageCarocelSliderState();
}

class _HomePageCarocelSliderState extends State<HomePageCarocelSlider> {
  int _pageActiveController = 0;
  List<CarocelModel>? _images;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchImages();
  }

  Future<void> _fetchImages() async {
    try {
      List<CarocelModel> images = await HomePageCarocelAPI.fetchImages();
      setState(() {
        _images = images;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const SizedBox(
        height: 180.0,
        child: HomePageShimmer(),
      );
    } else if (_error != null) {
      return const HomePageCarosuel404Error(
        image: 'assets/images/error-404.png',
        title: 'Can not get data!',
      );
    } else if (_images == null || _images!.isEmpty) {
      return const HomePageCarosuel404Error(
        image: 'assets/images/empty_data_icon_149938.webp',
        title: 'No data!',
      );
    } else {
      return Stack(
        children: [
          GlowingOverscrollIndicator(
            axisDirection: AxisDirection.right,
            color: Colors.grey.shade400,
            child: CarouselSlider(
              options: CarouselOptions(
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _pageActiveController = index;
                  });
                },
                height: 180.0,
                viewportFraction: 1,
              ),
              items: _images!.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.network(
                          image.imageUrl,
                          fit: BoxFit.cover,
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
            left: 0.0,
            right: 0.0,
            child: Center(
              child: AnimatedSmoothIndicator(
                effect: const ExpandingDotsEffect(
                  activeDotColor: Colors.pink,
                  dotHeight: 4.0,
                  dotWidth: 10.0,
                ),
                activeIndex: _pageActiveController,
                count: _images!.length,
              ),
            ),
          ),
        ],
      );
    }
  }
}

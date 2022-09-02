import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PromoSlider extends StatefulWidget {
  const PromoSlider({Key? key}) : super(key: key);

  @override
  State<PromoSlider> createState() => _PromoSliderState();
}

int activeIndex = 0;
final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
];

class _PromoSliderState extends State<PromoSlider> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: imgList.length,
      itemBuilder: ((context, index, realIndex) {
        final imgLists = imgList[index];
        return buildImage(imgLists, index);
      }),
      options: CarouselOptions(
        onPageChanged: (index, reason) => setState(() => activeIndex = index),
        viewportFraction: 1,
        height: 230,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 2),
      ),
    );
  }
}

Widget buildImage(String imgList, int index) => Container(
      width: double.infinity,
      color: Colors.grey,
      child: Image.network(imgList, fit: BoxFit.cover),
    );

Widget buildIndicator() => AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: imgList.length,
    );

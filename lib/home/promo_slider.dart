import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PromoSlider extends StatefulWidget {
  const PromoSlider({Key? key}) : super(key: key);

  @override
  State<PromoSlider> createState() => _PromoSliderState();
}

final List<String> imgList = ['assets/image/promo_carousel_1.png', 'assets/image/promo_carousel_2.png'];

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
        viewportFraction: 1,
        height: 250,
        autoPlay: true,
      ),
    );
  }
}

Widget buildImage(String imgList, int index) => Container(
      width: double.infinity,
      color: Colors.grey,
      child: Image.asset(imgList, fit: BoxFit.cover),
    );

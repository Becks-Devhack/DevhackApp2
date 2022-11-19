import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'RecommendationCell.dart';

class CarouselSlider2 extends StatelessWidget {
  const CarouselSlider2({required this.listItems});

  final List<PatientCell> listItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
        items: listItems,
      ),
    );
  }
}

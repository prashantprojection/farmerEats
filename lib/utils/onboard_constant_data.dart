import 'package:flutter/material.dart';

class OnBoardData {
  final String image;
  final String heading;
  final String description;
  final Color color;

  OnBoardData(
      {required this.image,
      required this.heading,
      required this.description,
      required this.color});
}

List<OnBoardData> onboardConstantData = [
  OnBoardData(
      image: "assets/onboarding/image1.png",
      heading: "Quality",
      description: """Sell your farm fresh products directly to
consumers, cutting out the middleman and 
reducing emissions of the global supply chain. 
                    """,
      color: const Color(0xff5EA25F)),
  OnBoardData(
      image: "assets/onboarding/image2.png",
      heading: "Convenient",
      description: """Our team of delivery drivers will make sure
      your orders are picked up on time and
      promptly delivered to your customers.""",
      color: const Color(0xffD5715B)),
  OnBoardData(
      image: "assets/onboarding/image3.png",
      heading: "Local",
      description: """We love the earth and know you do too! Join us
      in reducing our local carbon footprint one order
      at a time. """,
      color: const Color(0xffF8C569))
];

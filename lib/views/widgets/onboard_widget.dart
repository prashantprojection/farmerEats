import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:software_lab_assignment/controllers/page_slider_index_controller.dart';
import 'package:software_lab_assignment/utils/onboard_constant_data.dart';
import 'package:software_lab_assignment/utils/routes_const.dart';

class OnBoardScene extends ConsumerWidget {
  const OnBoardScene({super.key, required this.data});

  final OnBoardData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.sizeOf(context).width;
    final activIndex = ref.read(indexProvider);
    return Scaffold(
      backgroundColor: data.color,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(flex: 1, child: Image.asset(data.image)),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                  color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    data.heading,
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    data.description,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                  ),
                  AnimatedSmoothIndicator(
                    activeIndex: activIndex,
                    count: 3,
                    axisDirection: Axis.horizontal,
                    effect: const ExpandingDotsEffect(
                        dotWidth: 8,
                        dotHeight: 8,
                        dotColor: Colors.black,
                        activeDotColor: Colors.black),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, route.login);
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(width * 0.6, 55),
                        backgroundColor: data.color),
                    child: const Text(
                      'Join the movement!',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, route.login, (context) => false);
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                            fontSize: 16),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

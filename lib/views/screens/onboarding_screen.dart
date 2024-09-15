import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:software_lab_assignment/controllers/page_slider_index_controller.dart';
import 'package:software_lab_assignment/views/widgets/onboard_widget.dart';

import '../../utils/onboard_constant_data.dart';

class OnBoardingScreen extends ConsumerWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageView.builder(
        onPageChanged: (value) {
          ref.watch(indexProvider.notifier).update((state) => value);
        },
        itemCount: onboardConstantData.length,
        itemBuilder: (context, index) {
          return OnBoardScene(data: onboardConstantData[index]);
        });
  }
}

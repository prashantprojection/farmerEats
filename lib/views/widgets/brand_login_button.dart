import 'package:flutter/material.dart';

class BrandLoginButton extends StatelessWidget {
  const BrandLoginButton({required this.logo, super.key});

  final String logo;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        style: FilledButton.styleFrom(
            backgroundColor: Colors.white,
            side: const BorderSide(
                width: 0.5, color: Color.fromARGB(255, 216, 216, 216))),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/brand_logo/$logo.png",
            fit: BoxFit.contain,
            height: 25,
          ),
        ));
  }
}

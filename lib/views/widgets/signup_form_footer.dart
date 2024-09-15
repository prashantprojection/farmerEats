import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterSignUpForm extends StatelessWidget {
  const FooterSignUpForm(
      {required this.nextStepText,
      this.previousStepText,
      this.previousRouteName,
      required this.nextRoute,
      this.onPressed,
      super.key});

  final String nextRoute;
  final String? previousStepText;
  final String? previousRouteName;
  final String nextStepText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          previousStepText == null
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back))
              : TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context,
                        previousRouteName ?? "",
                        (Route<dynamic> route) => false);
                  },
                  child: Text(
                    previousStepText ?? "",
                    style: const TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline),
                  )),
          FilledButton(
            onPressed: onPressed ??
                () {
                  Navigator.pushNamed(context, nextRoute);
                },
            style: FilledButton.styleFrom(
                fixedSize: Size(width * 0.56, 40),
                backgroundColor: const Color(0xffD5715B)),
            child: Text(
              nextStepText,
              style: GoogleFonts.nunitoSans(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}

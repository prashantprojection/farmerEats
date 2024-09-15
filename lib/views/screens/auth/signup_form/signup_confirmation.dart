import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:software_lab_assignment/utils/routes_const.dart';

class SuccessfulRegistrationScreen extends StatelessWidget {
  const SuccessfulRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 120,
            ),
            Animate(
              effects: const [ScaleEffect(duration: Duration(seconds: 1))],
              child: Image.asset(
                "assets/done_check_mark.png",
                fit: BoxFit.contain,
                scale: 2.3,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "You're all done!",
              style: GoogleFonts.nunitoSans(
                  fontSize: 40, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
                style: GoogleFonts.nunitoSans(),
                textAlign: TextAlign.center,
                """Hang tight!  We are currently reviewing your account and will follow up with you in 2-3 business days. In the meantime, you can setup your inventory."""),
            const Expanded(child: SizedBox()),
            FilledButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, route.login, (context) => false);
              },
              style: FilledButton.styleFrom(
                  fixedSize: Size(width, 50),
                  backgroundColor: const Color(0xffD5715B)),
              child: const Text(
                "Got it!",
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}

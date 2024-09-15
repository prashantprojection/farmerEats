import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:software_lab_assignment/utils/routes_const.dart';

class RememberPasswordWidget extends StatelessWidget {
  const RememberPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Remember your password?",
          style: GoogleFonts.nunitoSans(),
        ),
        TextButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, route.login, (context) => false);
            },
            child: Text(
              "Login",
              style: GoogleFonts.nunito(color: Colors.red),
            ))
      ],
    );
  }
}

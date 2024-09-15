import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:software_lab_assignment/api/api.dart';
import 'package:software_lab_assignment/models/response_model.dart';
import 'package:software_lab_assignment/utils/routes_const.dart';
import 'package:software_lab_assignment/views/widgets/custom_text_field.dart';
import 'package:software_lab_assignment/views/widgets/remember_password_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("FarmerEats"),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            Text(
              "Forgot Password?",
              style: GoogleFonts.nunitoSans(
                  fontSize: 32, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 35,
            ),
            const RememberPasswordWidget(),
            CustomTextField(
              controller: controller,
              icon: Icons.phone,
              hintText: "Phone Number",
              inputType: TextInputType.phone,
            ),
            const SizedBox(
              height: 20,
            ),
            FilledButton(
                onPressed: () async {
                  ResponseModel res =
                      await Api().forgotPassword(number: "+${controller.text}");
                  if (res.success) {
                    Navigator.pushNamed(context, route.otp,
                        arguments: {'pN': controller.text});
                  } else {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(res.message)));
                    }
                  }
                },
                style: FilledButton.styleFrom(
                    fixedSize: Size(width, 50),
                    backgroundColor: const Color(0xffD5715B)),
                child: const Text(
                  "Send Code",
                  style: TextStyle(fontSize: 22),
                ))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:software_lab_assignment/api/api.dart';
import 'package:software_lab_assignment/models/response_model.dart';
import 'package:software_lab_assignment/utils/routes_const.dart';
import 'package:software_lab_assignment/views/widgets/remember_password_widget.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String otp = '';
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("FarmerEats"),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60,
              ),
              const Text(
                "Verify OTP",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 32),
              ),
              const SizedBox(
                height: 30,
              ),
              const RememberPasswordWidget(),
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                width: width,
                child: OTPTextField(
                  keyboardType: TextInputType.number,
                  spaceBetween: 8,
                  textFieldAlignment: MainAxisAlignment.spaceBetween,
                  fieldWidth: width * 0.1,
                  length: 6,
                  fieldStyle: FieldStyle.box,
                  outlineBorderRadius: 8,
                  onChanged: (value) {
                    otp = value;
                  },
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              FilledButton(
                onPressed: () async {
                  ResponseModel res = await Api().verifyOtp(otp: otp);
                  if (res.success) {
                    Navigator.pushNamed(context, route.resetPassword,
                        arguments: {"token": otp});
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
                child: const Text("Submit"),
              ),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                    onPressed: () {
                      Api().forgotPassword(number: arg["pN"]);
                    },
                    child: const Text(
                      "Resend Code",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.black),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

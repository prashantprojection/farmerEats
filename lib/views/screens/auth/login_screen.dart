import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:software_lab_assignment/api/api.dart';
import 'package:software_lab_assignment/models/response_model.dart';
import 'package:software_lab_assignment/views/screens/temp_logged_screen.dart';
import 'package:software_lab_assignment/views/widgets/brand_login_button.dart';
import 'package:software_lab_assignment/views/widgets/custom_text_field.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  final Api api = Api();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("FarmerEats"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text("Welcome back!",
                    style: GoogleFonts.nunitoSans(
                        fontSize: 35, fontWeight: FontWeight.w700)),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text(
                    "New here?",
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "/signup");
                      },
                      child: Text(
                        "Create account",
                        style: GoogleFonts.beVietnamPro(
                            color: const Color(0xffD5715B)),
                      ))
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              CustomTextField(
                controller: emailController,
                icon: FontAwesomeIcons.at,
                hintText: "Email Address",
                inputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: passwordController,
                icon: Icons.lock_outline_rounded,
                hintText: "Password",
                suffix: "Forget?",
                inputType: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () async {
                  ResponseModel res = await api.login(
                      email: emailController.text,
                      password: passwordController.text,
                      type: 'email',
                      token: "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx");
                  //I am unsure about which token you are fetching here so used it as static for testing purpose
                  if (res.success) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoggedInScreen()));
                  } else {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(res.message)));
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(width, 50),
                    backgroundColor: const Color(0xffD5715B),
                    foregroundColor: Colors.white),
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "or Login with",
                style: TextStyle(color: Colors.grey[500]),
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BrandLoginButton(logo: 'google'),
                  BrandLoginButton(logo: 'apple'),
                  BrandLoginButton(logo: 'facebook')
                ],
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}

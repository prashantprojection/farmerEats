import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:software_lab_assignment/utils/text_editing_controllers.dart';
import 'package:software_lab_assignment/views/widgets/brand_login_button.dart';
import 'package:software_lab_assignment/views/widgets/custom_text_field.dart';
import 'package:software_lab_assignment/views/widgets/signup_form_footer.dart';

import '../../../utils/routes_const.dart';

class SignupScreen extends ConsumerWidget {
  SignupScreen({super.key});

  final TextEditingController confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextFieldController controller = TextFieldController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("FarmerEats"),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "SignUp 1 of 4",
                      style: TextStyle(color: Colors.grey[600]),
                    )),
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Welcome!",
                    style: GoogleFonts.nunitoSans(
                        fontSize: 32, fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  height: 35,
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
                  height: 25,
                ),
                Text(
                  "or signup with",
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextField(
                  controller: controller.fullNameController,
                  icon: Icons.person_3_outlined,
                  hintText: "Full Name",
                  inputType: TextInputType.name,
                ),
                CustomTextField(
                  controller: controller.emailController,
                  icon: FontAwesomeIcons.at,
                  hintText: "Email Address",
                  inputType: TextInputType.emailAddress,
                ),
                CustomTextField(
                  controller: controller.phoneController,
                  icon: Icons.phone_outlined,
                  hintText: "Phone Number",
                  inputType: TextInputType.phone,
                ),
                CustomTextField(
                  controller: controller.passwordController,
                  icon: Icons.lock_outline_rounded,
                  hintText: "Password",
                  inputType: TextInputType.visiblePassword,
                ),
                CustomTextField(
                  controller: confirmPassword,
                  icon: Icons.lock_outline_rounded,
                  hintText: "Re-enter Password",
                  inputType: TextInputType.visiblePassword,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: FooterSignUpForm(
        nextStepText: "Continue",
        nextRoute: route.farminfo,
        previousStepText: "Login",
        previousRouteName: route.login,
        onPressed: () {
          if (_formKey.currentState!.validate() == false) {
          } else if (controller.passwordController.text ==
              confirmPassword.text) {
            Navigator.pushNamed(context, route.farminfo);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Both Password must Match")));
          }
        },
      ),
    );
  }
}

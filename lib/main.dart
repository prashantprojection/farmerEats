import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:software_lab_assignment/views/screens/auth/login_screen.dart';
import 'package:software_lab_assignment/views/screens/auth/password_reset/forgot_password.dart';
import 'package:software_lab_assignment/views/screens/auth/password_reset/otp_screen.dart';
import 'package:software_lab_assignment/views/screens/auth/password_reset/reset_password.dart';
import 'package:software_lab_assignment/views/screens/auth/signup_form/signup_document_verfication.dart';
import 'package:software_lab_assignment/views/screens/auth/signup_form/signup_confirmation.dart';
import 'package:software_lab_assignment/views/screens/auth/signup_form/singup_business_hours.dart';
import 'package:software_lab_assignment/views/screens/auth/signup_screen.dart';

import 'utils/routes_const.dart';
import 'views/screens/auth/signup_form/signup_farm_info.dart';
import 'views/screens/onboarding_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: route.initial,
      routes: {
        route.initial: (context) => const OnBoardingScreen(),
        route.login: (context) => LoginScreen(),
        route.signup: (context) => SignupScreen(),
        route.farminfo: (context) => FarmInfoScreen(),
        route.verification: (context) => const DocumentVerificationScreen(),
        route.businessHours: (context) => BusinessHoursScreen(),
        route.confirmation: (context) => const SuccessfulRegistrationScreen(),
        route.forgotPassword: (context) => ForgotPasswordScreen(),
        route.otp: (context) => const OtpScreen(),
        route.resetPassword: (context) => ChangePasswordNewScreen()
      },
    );
  }
}

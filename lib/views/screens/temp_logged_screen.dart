import 'package:flutter/material.dart';
import 'package:software_lab_assignment/views/screens/auth/login_screen.dart';

class LoggedInScreen extends StatelessWidget {
  const LoggedInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("You have successfully Logged in!"),
            const SizedBox(
              height: 20,
            ),
            FilledButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => LoginScreen()),
                      (_) => false);
                },
                child: const Text("Go back to Login"))
          ],
        ),
      ),
    );
  }
}

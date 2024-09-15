import 'package:flutter/material.dart';
import 'package:software_lab_assignment/api/api.dart';
import 'package:software_lab_assignment/models/response_model.dart';
import 'package:software_lab_assignment/views/widgets/custom_text_field.dart';
import 'package:software_lab_assignment/views/widgets/remember_password_widget.dart';

class ChangePasswordNewScreen extends StatelessWidget {
  ChangePasswordNewScreen({super.key});

  final TextEditingController password = TextEditingController();
  final TextEditingController cpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("FarmerEats"),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              const Text(
                "Reset Password",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              const RememberPasswordWidget(),
              const SizedBox(
                height: 50,
              ),
              CustomTextField(
                controller: password,
                icon: Icons.lock_outline_rounded,
                hintText: "New Password",
                inputType: TextInputType.visiblePassword,
              ),
              CustomTextField(
                controller: cpassword,
                icon: Icons.lock_outline_rounded,
                hintText: "Confirm New Password",
                inputType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 40,
              ),
              FilledButton(
                onPressed: () async {
                  //Just for assignment kept the default token
                  ResponseModel res = await Api().resetPassword(
                      token: arg["token"] ?? "895642",
                      password: password.text,
                      cpassword: cpassword.text);
                  if (res.success) {
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
            ],
          ),
        ),
      ),
    );
  }
}

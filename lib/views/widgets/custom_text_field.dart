import 'package:flutter/material.dart';
import 'package:software_lab_assignment/utils/routes_const.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {required this.icon,
      this.hintText,
      this.suffix,
      this.controller,
      this.inputType,
      super.key});

  final IconData icon;
  final String? hintText;
  final String? suffix;
  final TextEditingController? controller;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          color: const Color(0xff261C12).withOpacity(0.08),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Icon(icon),
          Flexible(
              child: TextFormField(
            controller: controller,
            keyboardType: inputType,
            validator: (value) {
              if (value == null || value == "") {
                return "Field can't be Empty";
              }
              return null;
            },
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.grey[500]),
                border: const OutlineInputBorder(borderSide: BorderSide.none)),
          )),
          suffix == null
              ? const SizedBox()
              : TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, route.forgotPassword);
                  },
                  child: Text(
                    suffix ?? "",
                    style: const TextStyle(color: Color(0xffD5715B)),
                  ),
                )
        ],
      ),
    );
  }
}

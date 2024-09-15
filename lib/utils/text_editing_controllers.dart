import 'package:flutter/material.dart';

class TextFieldController {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController informalNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController registrationProofController =
      TextEditingController();
  final TextEditingController deviceTokenController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController socialIdController = TextEditingController();

  static final TextFieldController _textFieldController =
      TextFieldController._internal();
  factory TextFieldController() {
    return _textFieldController;
  }
  TextFieldController._internal();

  void dispose() {
    fullNameController.clear();
    emailController.clear();
    phoneController.clear();
    passwordController.clear();
    roleController.clear();
    businessNameController.clear();
    informalNameController.clear();
    addressController.clear();
    cityController.clear();
    socialIdController.clear();
    stateController.clear();
    zipCodeController.clear();
    registrationProofController.clear();
    deviceTokenController.clear();
    typeController.clear();
  }
}

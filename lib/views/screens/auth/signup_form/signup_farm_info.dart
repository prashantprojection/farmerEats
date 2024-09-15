import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:software_lab_assignment/utils/constant_state_data.dart';
import 'package:software_lab_assignment/utils/routes_const.dart';
import 'package:software_lab_assignment/utils/text_editing_controllers.dart';
import 'package:software_lab_assignment/views/widgets/custom_text_field.dart';
import 'package:software_lab_assignment/views/widgets/signup_form_footer.dart';

class FarmInfoScreen extends ConsumerWidget {
  FarmInfoScreen({super.key});
  final TextFieldController controller = TextFieldController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("FarmerEats"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "SignUp 2 of 4",
                          style: TextStyle(color: Colors.grey[600]),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Farm Info",
                        style: GoogleFonts.nunitoSans(
                            fontSize: 32, fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomTextField(
                      controller: controller.businessNameController,
                      icon: FontAwesomeIcons.tag,
                      hintText: "Business Name",
                      inputType: TextInputType.text,
                    ),
                    CustomTextField(
                      controller: controller.informalNameController,
                      icon: FontAwesomeIcons.faceSmile,
                      hintText: "Informal Name",
                      inputType: TextInputType.name,
                    ),
                    CustomTextField(
                      controller: controller.addressController,
                      icon: FontAwesomeIcons.house,
                      hintText: "Street Address",
                      inputType: TextInputType.streetAddress,
                    ),
                    CustomTextField(
                      controller: controller.cityController,
                      icon: FontAwesomeIcons.locationDot,
                      hintText: "City",
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                                color:
                                    const Color(0xff261C12).withOpacity(0.08),
                                borderRadius: BorderRadius.circular(8)),
                            child: DropdownButtonFormField(
                              isExpanded: true,
                              items: stateList,
                              onChanged: (value) {
                                controller.stateController.text = value;
                              },
                              hint: const Text("State"),
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Flexible(
                            flex: 3,
                            child: Container(
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0xff261C12).withOpacity(0.08),
                                  borderRadius: BorderRadius.circular(8)),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value == "") {
                                    return "Field can't be Empty";
                                  }
                                  return null;
                                },
                                controller: controller.zipCodeController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    hintText: "Enter Zipcode",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[500]),
                                    border: const OutlineInputBorder(
                                        borderSide: BorderSide.none)),
                              ),
                            ))
                      ],
                    ),
                  ]),
            )),
      ),
      bottomNavigationBar: FooterSignUpForm(
        nextStepText: "Continue",
        nextRoute: route.verification,
        onPressed: () {
          if (_formKey.currentState!.validate() == false) {
          } else {
            Navigator.pushNamed(context, route.verification);
          }
        },
      ),
    );
  }
}

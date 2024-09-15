import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:software_lab_assignment/api/api.dart';
import 'package:software_lab_assignment/controllers/business_hours_controller.dart';
import 'package:software_lab_assignment/models/business_model.dart';
import 'package:software_lab_assignment/models/response_model.dart';
import 'package:software_lab_assignment/utils/routes_const.dart';
import 'package:software_lab_assignment/utils/text_editing_controllers.dart';
import 'package:software_lab_assignment/views/widgets/signup_form_footer.dart';

class BusinessHoursScreen extends ConsumerWidget {
  BusinessHoursScreen({super.key});

  final TextFieldController controller = TextFieldController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final businessHours = ref.watch(businessHoursControllerProvider);
    final timeSlots = ref.watch(timeSetControllerProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("FarmerEats"),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "SignUp 4 of 4",
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Business Hours",
                style: GoogleFonts.nunitoSans(
                    fontSize: 32, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                """Choose the hours your farm is open for pickups.
This will allow customers to order deliveries.""",
                style: GoogleFonts.nunitoSans(color: Colors.grey[500]),
              ),
            ),
            const SizedBox(height: 40),
            Container(
              height: width / 8.5,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: businessHours.length,
                itemBuilder: (context, index) {
                  final day = businessHours[index];
                  return GestureDetector(
                    onTap: () {
                      ref
                          .read(businessHoursControllerProvider.notifier)
                          .toggleDaySelection(day.day);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      constraints:
                          BoxConstraints.tight(Size(width / 9.2, width / 9.2)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: day.isSelected
                            ? Colors.orange
                            : const Color(0xff261C12).withOpacity(0.08),
                      ),
                      child: Center(
                        child: Text(
                          day.day.substring(0, 2),
                          style: TextStyle(
                            fontSize: 16,
                            color: day.isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            Flexible(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3.5 / 1,
                ),
                itemCount: timeSlots.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: FilledButton(
                      onPressed: () {
                        ref
                            .read(timeSetControllerProvider.notifier)
                            .switchSelection(index);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: timeSlots[index].active
                            ? Colors.orange
                            : const Color(0xff261C12).withOpacity(0.08),
                        fixedSize: const Size.fromHeight(60),
                      ),
                      child: Text(
                        timeSlots[index].slot,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: FooterSignUpForm(
        nextStepText: "Continue",
        nextRoute: route.confirmation,
        onPressed: () async {
          Map<String, List<String>> businessHourMap = {};
          for (var e in businessHours) {
            if (e.isSelected) {
              List<String> time = [];
              for (var e in timeSlots) {
                if (e.active) {
                  time.add(e.slot);
                }
              }
              businessHourMap[e.day] = time;
            }
          }
          ResponseModel res = await Api().signup(
              model: BusinessModel(
                  fullName: controller.fullNameController.text,
                  email: controller.emailController.text,
                  phone: controller.phoneController.text,
                  password: controller.passwordController.text,
                  role: "farmer",
                  businessName: controller.businessNameController.text,
                  informalName: controller.informalNameController.text,
                  address: controller.addressController.text,
                  city: controller.cityController.text,
                  state: controller.stateController.text,
                  zipCode: controller.zipCodeController.text,
                  registrationProof:
                      controller.registrationProofController.text,
                  businessHours: businessHourMap,
                  deviceToken: "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx",
                  type: "email",
                  socialId: "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx"));
          TextFieldController().dispose();
          if (res.success) {
            Navigator.pushNamed(context, route.confirmation);
          } else {
            if (context.mounted) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(res.message)));
            }
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:software_lab_assignment/controllers/verification_form_controller.dart';
import 'package:software_lab_assignment/models/document_model.dart';
import 'package:software_lab_assignment/controllers/document_provider.dart';
import 'package:software_lab_assignment/utils/text_editing_controllers.dart';
import 'package:software_lab_assignment/views/widgets/signup_form_footer.dart';

import '../../../../utils/routes_const.dart';

class DocumentVerificationScreen extends ConsumerStatefulWidget {
  const DocumentVerificationScreen({super.key});

  @override
  VerificationFormScreenState createState() => VerificationFormScreenState();
}

class VerificationFormScreenState
    extends ConsumerState<DocumentVerificationScreen> {
  final VerificationFormController _controller = VerificationFormController();

  void _pickPDF() async {
    await _controller.pickAndSavePDF(ref);
  }

  TextFieldController controller = TextFieldController();

  @override
  Widget build(BuildContext context) {
    final documents = ref.watch(documentProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("FarmerEats"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child:
                  Text("SignUp 3 of 4", style: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Verification",
                style: GoogleFonts.nunitoSans(
                    fontSize: 32, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Attached proof of Department of Agriculture registrations i.e. Florida Fresh, USDA Approved, USDA Organic",
                style: GoogleFonts.nunitoSans(color: Colors.grey[500]),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                const Expanded(child: Text("Attach proof of registration")),
                IconButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xffD5715B),
                    iconColor: Colors.white,
                  ),
                  onPressed: _pickPDF,
                  icon: const Icon(Icons.camera_alt_outlined),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Flexible(
              child: ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  DocumentModel document = documents[index];
                  return ListTile(
                    title: Text(document.documentName),
                    trailing: IconButton(
                      icon: const Icon(Icons.close, color: Colors.red),
                      onPressed: () {
                        _controller.removeDocument(ref, document);
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: FooterSignUpForm(
        nextStepText: "Continue",
        nextRoute: route.businessHours,
        onPressed: () {
          List<String> docString = [];
          for (var e in documents) {
            docString.add(e.documentName);
          }
          if (documents.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Please Select some Document")));
          } else {
            controller.registrationProofController.text = docString.toString();
            Navigator.pushNamed(context, route.businessHours);
          }
        },
      ),
    );
  }
}

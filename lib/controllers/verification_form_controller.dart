import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:software_lab_assignment/models/document_model.dart';
import 'package:software_lab_assignment/controllers/document_provider.dart';

class VerificationFormController {
  Future<void> pickAndSavePDF(WidgetRef ref) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      String? filePath = result.files.single.path;
      String documentName = result.files.single.name;

      ref.read(documentProvider.notifier).addDocument(
            DocumentModel(
              filePath: filePath ?? documentName,
              documentName: documentName,
            ),
          );
    }
  }

  void removeDocument(WidgetRef ref, DocumentModel document) {
    ref.read(documentProvider.notifier).removeDocument(document);
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:software_lab_assignment/models/document_model.dart';

class DocumentNotifier extends StateNotifier<List<DocumentModel>> {
  DocumentNotifier() : super([]);

  void addDocument(DocumentModel document) {
    state = [...state, document];
  }

  void removeDocument(DocumentModel document) {
    state = state.where((doc) => doc.filePath != document.filePath).toList();
  }
}

final documentProvider =
    StateNotifierProvider<DocumentNotifier, List<DocumentModel>>((ref) {
  return DocumentNotifier();
});

import '../models/notes_model.dart';

abstract class NotesDataSource {
  Future<void> createNotes(NotesModel notes);
  Future<NotesResponseModel> getNotes();
  Future<void> deleteNotes(int id);
  Future<void> updateNotes(NotesModel notes);
}

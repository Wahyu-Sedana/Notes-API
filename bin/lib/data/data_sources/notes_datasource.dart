import '../models/notes_model.dart';

abstract class NotesDataSource {
  Future<NotesResponseModel> createNotes(String title, String description);
  Future<NotesResponseModel> getNotes();
  Future<NotesResponseModel> deleteNotes(int id);
  Future<NotesResponseModel> updateNotes(int id, String title, String description);
}

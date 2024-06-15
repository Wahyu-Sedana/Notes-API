import '../../data/data_sources/notes_datasource.dart';
import '../../data/databases/database.dart';
import '../../data/models/notes_model.dart';

class NotesRepository extends NotesDataSource {
  final Database database;

  NotesRepository({required this.database});

  @override
  Future<NotesResponseModel> createNotes(String title, String description) {
    // TODO: implement createNotes
    throw UnimplementedError();
  }

  @override
  Future<NotesResponseModel> deleteNotes(int id) {
    // TODO: implement deleteNotes
    throw UnimplementedError();
  }

  @override
  Future<NotesResponseModel> getNotes() {
    // TODO: implement getNotes
    throw UnimplementedError();
  }

  @override
  Future<NotesResponseModel> updateNotes(int id, String title, String description) {
    // TODO: implement updateNotes
    throw UnimplementedError();
  }
}

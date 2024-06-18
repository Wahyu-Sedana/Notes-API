import '../../data/models/notes_model.dart';
import '../repositories/notes_repositories.dart';

class CreateNote {
  final NotesRepository repository;

  CreateNote(this.repository);

  Future<void> call(NotesModel note) async {
    await repository.createNotes(note);
  }
}

class DeleteNote {
  final NotesRepository repository;

  DeleteNote(this.repository);

  Future<void> call(int id) async {
    await repository.deleteNotes(id);
  }
}

class UpdateNote {
  final NotesRepository repository;

  UpdateNote(this.repository);

  Future<void> call(NotesModel note) async {
    await repository.updateNotes(note);
  }
}

class GetAllNotes {
  final NotesRepository repository;

  GetAllNotes(this.repository);

  Future<NotesResponseModel> call() async {
    return await repository.getNotes();
  }
}

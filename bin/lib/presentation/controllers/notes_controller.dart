import 'dart:convert';
import 'package:shelf/shelf.dart';

import '../../data/models/notes_model.dart';
import '../../domain/usecases/notes_usecase.dart';

class NotesController {
  final GetAllNotes getAllNotes;
  final CreateNote createNote;
  final UpdateNote updateNote;
  final DeleteNote deleteNote;

  NotesController({
    required this.getAllNotes,
    required this.createNote,
    required this.updateNote,
    required this.deleteNote,
  });

  Future<Response> getAll(Request request) async {
    final notesResponse = await getAllNotes();
    final notesJson = notesResponse.toJson();
    return Response.ok(json.encode(notesJson), headers: {'Content-Type': 'application/json'});
  }

  Future<Response> create(Request request) async {
    final payload = await request.readAsString();
    final Map<String, dynamic> jsonMap = json.decode(payload);
    final note = NotesModel(
      id: jsonMap["id"],
      title: jsonMap['title'],
      description: jsonMap['description'],
    );
    await createNote.call(NotesModel(
      id: note.id,
      title: note.title,
      description: note.description,
    ));
    return Response.ok('Note created');
  }

  Future<Response> update(Request request, String id) async {
    final payload = await request.readAsString();
    final Map<String, dynamic> jsonMap = json.decode(payload);
    final note = NotesModel(
      id: int.parse(id),
      title: jsonMap['title'],
      description: jsonMap['description'],
    );
    await updateNote.call(NotesModel(
      id: note.id,
      title: note.title,
      description: note.description,
    ));
    return Response.ok('Note updated');
  }

  Future<Response> delete(Request request, String id) async {
    await deleteNote.call(int.parse(id));
    return Response.ok('Note deleted');
  }
}

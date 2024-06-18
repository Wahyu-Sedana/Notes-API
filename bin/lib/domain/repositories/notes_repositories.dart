import 'package:mysql1/mysql1.dart';

import '../../data/data_sources/notes_datasource.dart';
import '../../data/databases/database.dart';
import '../../data/models/notes_model.dart';

class NotesRepository extends NotesDataSource {
  final Database database;

  NotesRepository({required this.database});

  @override
  Future<void> createNotes(NotesModel note) async {
    MySqlConnection conn = await database.connection().then((db) => db.conn);
    await conn.query(
        'INSERT INTO notes (title, description) VALUES (?, ?)', [note.title, note.description]);
    await conn.close();
  }

  @override
  Future<void> deleteNotes(int id) async {
    MySqlConnection conn = await database.connection().then((db) => db.conn);
    await conn.query('DELETE FROM notes WHERE id = ?', [id]);
    await conn.close();
  }

  @override
  Future<NotesResponseModel> getNotes() async {
    MySqlConnection conn = await database.connection().then((db) => db.conn);
    var results = await conn.query('SELECT * FROM notes');
    await conn.close();

    List<NotesModel> notes = results
        .map((row) => NotesModel(
              id: row['id'],
              title: row['title'],
              description: row['description'],
            ))
        .toList();

    if (notes.isNotEmpty) {
      return NotesResponseModel(
        status: 200,
        message: 'Notes fetched successfully',
        notes: notes,
      );
    } else {
      return NotesResponseModel(
        status: 404,
        message: 'No notes found',
        notes: [],
      );
    }
  }

  @override
  Future<void> updateNotes(NotesModel note) async {
    MySqlConnection conn = await database.connection().then((db) => db.conn);
    await conn.query('UPDATE notes SET title = ?, description = ? WHERE id = ?',
        [note.title, note.description, note.id]);
    await conn.close();
  }
}

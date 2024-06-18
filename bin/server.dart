import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'lib/data/databases/database.dart';
import 'lib/domain/repositories/notes_repositories.dart';
import 'lib/domain/usecases/notes_usecase.dart';
import 'lib/presentation/controllers/notes_controller.dart';
import 'lib/presentation/routes/routes.dart';

void main() async {
  final database = Database();
  await database.connection();

  final notesRepository = NotesRepository(database: database);

  final notesController = NotesController(
    getAllNotes: GetAllNotes(notesRepository),
    createNote: CreateNote(notesRepository),
    updateNote: UpdateNote(notesRepository),
    deleteNote: DeleteNote(notesRepository),
  );

  final router = Router()..mount('/notes', createNotesRouter(notesController));

  final handler = const Pipeline().addMiddleware(logRequests()).addHandler(router);

  final server = await io.serve(handler, 'localhost', 8080);
  print('Server is running on http://${server.address.host}:${server.port}');
}

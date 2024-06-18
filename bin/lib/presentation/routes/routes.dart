import 'package:shelf_router/shelf_router.dart';
import '../controllers/notes_controller.dart';

Router createNotesRouter(NotesController controller) {
  final router = Router();

  router.get('/', controller.getAll);
  router.post('/', controller.create);
  router.put('/<id>', controller.update);
  router.delete('/<id>', controller.delete);

  return router;
}

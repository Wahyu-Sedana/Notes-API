import 'package:mysql1/mysql1.dart';

class Database {
  late MySqlConnection _connection;

  Future<Database> connection() async {
    final settings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
      password: '',
      db: 'db_notes',
    );
    _connection = await MySqlConnection.connect(settings);
    return this;
  }

  MySqlConnection get conn => _connection;
}

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  // Open the SQLite database
  Future<Database> get database async {
    if (_database != null) return _database!;

    // If the database is null, initialize it
    _database = await openDatabase(
      join(await getDatabasesPath(), 'data.sqlite'),
    );

    return _database!;
  }
}
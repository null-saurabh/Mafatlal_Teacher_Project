import 'package:get/get.dart';
import 'package:teaching_app/database/database_helper.dart';

class MyDataController extends GetxController {
  final DatabaseHelper dbHelper = DatabaseHelper();

  Future<List<Map<String, dynamic>>> fetchDataFromDatabase(String tableName) async {
    final database = await dbHelper.database;
    return await database.query(tableName);
  }
}

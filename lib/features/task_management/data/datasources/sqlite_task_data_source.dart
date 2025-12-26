import 'package:innovage/features/task_management/data/datasources/local_task_data_source.dart';
import 'package:sqflite/sqflite.dart';

import '../models/task_model.dart';

/// SQLite implementation of LocalTaskDataSource
class SQLiteTaskDataSource implements LocalTaskDataSource {
  static const String _tableName = 'tasks';
  static const String _databaseName = 'my_db.db';

  /// Initialize the database and create table if it doesn't exist
  Future<Database> _initDatabase() async {
    var db = await openDatabase(_databaseName, singleInstance: true);
    
    var taskTable = await db.rawQuery(
        'SELECT * FROM sqlite_master WHERE name="$_tableName";');
    
    if (taskTable.isEmpty) {
      String createTable = """
        CREATE TABLE $_tableName (
          id TEXT PRIMARY KEY,
          name TEXT,
          date TEXT
        )
      """;
      await db.execute(createTable);
    }
    
    return db;
  }

  @override
  Future<void> addTask(TaskModel task) async {
    try {
      var db = await _initDatabase();
      await db.insert(_tableName, task.toJson());
    } catch (e) {
      throw Exception('Failed to add task: ${e.toString()}');
    }
  }

  @override
  Future<void> deleteTask(String id) async {
    try {
      var db = await _initDatabase();
      await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      throw Exception('Failed to delete task: ${e.toString()}');
    }
  }

  @override
  Future<void> editTask(TaskModel task, String id) async {
    try {
      var db = await _initDatabase();
      await db.update(_tableName, task.toJson(), where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      throw Exception('Failed to edit task: ${e.toString()}');
    }
  }

  @override
  Future<List<TaskModel>> getAllTasks() async {
    try {
      var db = await _initDatabase();
      List<Map<String, dynamic>> results = await db.query(_tableName);
      return results.map((json) => TaskModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to get tasks: ${e.toString()}');
    }
  }
}

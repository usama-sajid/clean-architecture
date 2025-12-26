
import 'package:innovage/features/task_management/data/models/task_model.dart';

/// Abstract data source for local task storage operations
abstract class LocalTaskDataSource {
  Future<List<TaskModel>> getAllTasks();
  Future<void> addTask(TaskModel task);
  Future<void> editTask(TaskModel task, String id);
  Future<void> deleteTask(String id);
}

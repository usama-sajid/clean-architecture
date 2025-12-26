import 'package:dartz/dartz.dart';
import 'package:innovage/features/task_management/domain/failures/failures.dart';
import '../../data/models/task_model.dart';

abstract class TaskRepository {
  Future<Either<Failure, List<TaskModel>>> getAllTasks();
  Future<Either<Failure, void>> addTask(TaskModel task);
  Future<Either<Failure, void>> editTask(TaskModel task, String id);
  Future<Either<Failure, void>> deleteTask(String id);
}

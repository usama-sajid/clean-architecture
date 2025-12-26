import 'package:dartz/dartz.dart';
import 'package:innovage/features/task_management/domain/failures/failures.dart';
import '../entities/task_entity.dart';

abstract class TaskRepository {
  Future<Either<Failure, List<TaskEntity>>> getAllTasks();
  Future<Either<Failure, void>> addTask(TaskEntity task);
  Future<Either<Failure, void>> editTask(TaskEntity task, String id);
  Future<Either<Failure, void>> deleteTask(String id);
}

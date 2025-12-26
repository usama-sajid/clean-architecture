import 'package:dartz/dartz.dart';
import 'package:innovage/features/task_management/data/datasources/local_task_data_source.dart';
import 'package:innovage/features/task_management/data/mappers/task_entity_to_model_mapper.dart';
import 'package:innovage/features/task_management/domain/entities/task_entity.dart';
import 'package:innovage/features/task_management/domain/failures/failures.dart';
import 'package:innovage/features/task_management/domain/repositories/task_respository.dart';

/// Implementation of TaskRepository using local data source
class TaskRepositoryImpl implements TaskRepository {
  final LocalTaskDataSource localDataSource;

  TaskRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, void>> addTask(TaskEntity task) async {
    try {
      await localDataSource.addTask(TaskMapper.toModel(task));
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Failed to add task: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTask(String id) async {
    try {
      await localDataSource.deleteTask(id);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Failed to delete task: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> editTask(TaskEntity task, String id) async {
    try {
      await localDataSource.editTask(TaskMapper.toModel(task), id);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Failed to edit task: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> getAllTasks() async {
    try {
      final tasks = await localDataSource.getAllTasks();
      return Right(tasks.map(TaskMapper.toEntity).toList());
    } catch (e) {
      return Left(DatabaseFailure('Failed to get tasks: ${e.toString()}'));
    }
  }
}

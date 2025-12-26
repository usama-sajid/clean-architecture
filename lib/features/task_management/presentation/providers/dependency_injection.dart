import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:innovage/features/task_management/data/datasources/local_task_data_source.dart';
import 'package:innovage/features/task_management/data/datasources/sqlite_task_data_source.dart';
import 'package:innovage/features/task_management/data/repositories/task_repository_impl.dart';
import 'package:innovage/features/task_management/domain/repositories/task_respository.dart';
import 'package:innovage/features/task_management/domain/usecases/add_task.dart';
import 'package:innovage/features/task_management/domain/usecases/delete_task.dart';
import 'package:innovage/features/task_management/domain/usecases/edit_task.dart';
import 'package:innovage/features/task_management/domain/usecases/get_all_tasks.dart';

/// Data Source Providers
final localTaskDataSourceProvider = Provider<LocalTaskDataSource>((ref) {
  return SQLiteTaskDataSource();
});

/// Repository Providers  
final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  return TaskRepositoryImpl(
    localDataSource: ref.read(localTaskDataSourceProvider),
  );
});

/// Use Case Providers
final getAllTasksUseCaseProvider = Provider<GetAllTasksUseCase>((ref) {
  return GetAllTasksUseCase(ref.read(taskRepositoryProvider));
});

final addTaskUseCaseProvider = Provider<AddTaskUseCase>((ref) {
  return AddTaskUseCase(ref.read(taskRepositoryProvider));
});

final editTaskUseCaseProvider = Provider<EditTaskUseCase>((ref) {
  return EditTaskUseCase(ref.read(taskRepositoryProvider));
});

final deleteTaskUseCaseProvider = Provider<DeleteTaskUseCase>((ref) {
  return DeleteTaskUseCase(ref.read(taskRepositoryProvider));
});

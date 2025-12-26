import 'package:dartz/dartz.dart';
import 'package:innovage/features/task_management/domain/failures/failures.dart';
import 'package:innovage/features/task_management/domain/repositories/task_respository.dart';
import 'package:innovage/features/task_management/domain/usecases/usecase.dart';
import '../entities/task_entity.dart';

class GetAllTasksUseCase implements UseCaseNoParams<List<TaskEntity>> {
  final TaskRepository repository;

  GetAllTasksUseCase(this.repository);

  @override
  Future<Either<Failure, List<TaskEntity>>> call() async {
    return await repository.getAllTasks();
  }
}

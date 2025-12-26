import 'package:dartz/dartz.dart';
import 'package:innovage/features/task_management/domain/failures/failures.dart';
import 'package:innovage/features/task_management/domain/repositories/task_respository.dart';
import 'package:innovage/features/task_management/domain/usecases/usecase.dart';

import '../../data/models/task_model.dart';

class GetAllTasksUseCase implements UseCaseNoParams<List<TaskModel>> {
  final TaskRepository repository;

  GetAllTasksUseCase(this.repository);

  @override
  Future<Either<Failure, List<TaskModel>>> call() async {
    return await repository.getAllTasks();
  }
}

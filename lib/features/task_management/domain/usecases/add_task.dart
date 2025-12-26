import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:innovage/features/task_management/domain/entities/task_entity.dart';
import 'package:innovage/features/task_management/domain/failures/failures.dart';
import 'package:innovage/features/task_management/domain/repositories/task_respository.dart';
import 'package:innovage/features/task_management/domain/usecases/usecase.dart';

class AddTaskUseCase implements UseCase<void, AddTaskParams> {
  final TaskRepository repository;

  AddTaskUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(AddTaskParams params) async {
    return await repository.addTask(params.task);
  }
}

class AddTaskParams extends Equatable {
  final TaskEntity task;

  const AddTaskParams({required this.task});

  @override
  List<Object?> get props => [task];
}

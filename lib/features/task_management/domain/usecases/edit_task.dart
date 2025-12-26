import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:innovage/features/task_management/domain/entities/task_entity.dart';
import 'package:innovage/features/task_management/domain/failures/failures.dart';
import 'package:innovage/features/task_management/domain/repositories/task_respository.dart';
import 'package:innovage/features/task_management/domain/usecases/usecase.dart';

class EditTaskUseCase implements UseCase<void, EditTaskParams> {
  final TaskRepository repository;

  EditTaskUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(EditTaskParams params) async {
    return await repository.editTask(params.task, params.oldId);
  }
}

class EditTaskParams extends Equatable {
  final TaskEntity task;
  final String oldId;

  const EditTaskParams({required this.task, required this.oldId});

  @override
  List<Object?> get props => [task, oldId];
}

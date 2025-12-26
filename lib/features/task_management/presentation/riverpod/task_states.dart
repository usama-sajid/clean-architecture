import 'package:equatable/equatable.dart';
import '../../domain/entities/task_entity.dart';

abstract class TasksState extends Equatable {}

class TasksInitial extends TasksState {
  @override
  List<Object> get props => [];
}

class TasksLoading extends TasksState {
  @override
  List<Object> get props => [];
}

class TasksLoaded extends TasksState {
  final List<TaskEntity> tasks;
  
  TasksLoaded(this.tasks);

  @override
  List<Object> get props => [tasks];
}

class TasksError extends TasksState {
  final String message;
  
  TasksError(this.message);

  @override
  List<Object> get props => [message];
}

class TaskAdded extends TasksState {
  final TaskEntity task;
  
  TaskAdded(this.task);

  @override
  List<Object> get props => [task];
}

class TaskUpdated extends TasksState {
  final TaskEntity task;
  
  TaskUpdated(this.task);

  @override
  List<Object> get props => [task];
}

class TaskDeleted extends TasksState {
  final String taskId;
  
  TaskDeleted(this.taskId);

  @override
  List<Object> get props => [taskId];
}

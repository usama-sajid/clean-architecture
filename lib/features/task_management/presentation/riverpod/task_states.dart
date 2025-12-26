import 'package:equatable/equatable.dart';

import '../../data/models/task_model.dart';

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
  final List<TaskModel> tasks;
  
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
  final TaskModel task;
  
  TaskAdded(this.task);

  @override
  List<Object> get props => [task];
}

class TaskUpdated extends TasksState {
  final TaskModel task;
  
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

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:innovage/features/task_management/domain/usecases/add_task.dart';
import 'package:innovage/features/task_management/domain/usecases/delete_task.dart';
import 'package:innovage/features/task_management/domain/usecases/edit_task.dart';
import 'package:innovage/features/task_management/domain/usecases/get_all_tasks.dart';
import 'package:innovage/features/task_management/presentation/riverpod/dependency_injection.dart';
import 'package:innovage/features/task_management/presentation/riverpod/task_states.dart';

import '../../data/models/task_model.dart';

class TaskNotifier extends Notifier<TasksState> {
  late GetAllTasksUseCase _getAllTasksUseCase;
  late AddTaskUseCase _addTaskUseCase;
  late EditTaskUseCase _editTaskUseCase;
  late DeleteTaskUseCase _deleteTaskUseCase;

  List<TaskModel> _tasks = [];

  @override
  TasksState build() {
    _getAllTasksUseCase = ref.read(getAllTasksUseCaseProvider);
    _addTaskUseCase = ref.read(addTaskUseCaseProvider);
    _editTaskUseCase = ref.read(editTaskUseCaseProvider);
    _deleteTaskUseCase = ref.read(deleteTaskUseCaseProvider);
    
    return TasksInitial();
  }

  Future<void> getAllTasks() async {
    state = TasksLoading();
    
    final result = await _getAllTasksUseCase();
    
    result.fold(
      (failure) {
        state = TasksError(failure.message);
      },
      (tasks) {
        _tasks = tasks;
        state = TasksLoaded(tasks);
      },
    );
  }

  Future<void> addTask(TaskModel task) async {
    state = TasksLoading();
    
    final result = await _addTaskUseCase(AddTaskParams(task: task));
    
    result.fold(
      (failure) {
        state = TasksError(failure.message);
      },
      (_) {
        _tasks.add(task);
        state = TasksLoaded(List.from(_tasks));
      },
    );
  }

  Future<void> editTask(TaskModel task, String oldId) async {
    state = TasksLoading();
    
    final result = await _editTaskUseCase(
      EditTaskParams(task: task, oldId: oldId),
    );
    
    result.fold(
      (failure) {
        state = TasksError(failure.message);
      },
      (_) {
        final index = _tasks.indexWhere((t) => t.id == oldId);
        if (index != -1) {
          _tasks[index] = task;
          state = TasksLoaded(List.from(_tasks));
        }
      },
    );
  }

  Future<void> deleteTask(String taskId) async {
    state = TasksLoading();
    
    final result = await _deleteTaskUseCase(DeleteTaskParams(id: taskId));
    
    result.fold(
      (failure) {
        state = TasksError(failure.message);
      },
      (_) {
        _tasks.removeWhere((task) => task.id == taskId);
        state = TasksLoaded(List.from(_tasks));
      },
    );
  }
}

final taskNotifierProvider = NotifierProvider<TaskNotifier, TasksState>(
  TaskNotifier.new,
);

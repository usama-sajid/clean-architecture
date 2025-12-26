import 'package:innovage/features/task_management/data/models/task_model.dart';
import 'package:innovage/features/task_management/domain/entities/taskEntity.dart' as task_entity;

/// Mapper to convert between Task entity and TaskDto
class TaskMapper {
  /// Converts TaskDto to Task entity
  static task_entity.Task toEntity(TaskModel dto) {
    return task_entity.Task(
      id: dto.id,
      name: dto.name,
      date: dto.date,
    );
  }

  /// Converts Task entity to TaskDto
  static TaskModel toDto(task_entity.Task entity) {
    return TaskModel(
      id: entity.id,
      name: entity.name,
      date: entity.date,
    );
  }

  /// Converts list of TaskDto to list of Task entities
  static List<task_entity.Task> toEntityList(List<TaskModel> dtoList) {
    return dtoList.map((dto) => toEntity(dto)).toList();
  }

  /// Converts list of Task entities to list of TaskDto
  static List<TaskModel> toDtoList(List<task_entity.Task> entityList) {
    return entityList.map((entity) => toDto(entity)).toList();
  }
}

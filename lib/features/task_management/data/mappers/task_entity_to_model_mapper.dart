import '../../domain/entities/task_entity.dart';
import '../models/task_model.dart';

class TaskMapper {
  /// Model → Entity
  static TaskEntity toEntity(TaskModel model) {
    return TaskEntity(
      id: model.id,
      name: model.name,
      date: model.date,
    );
  }

  /// Entity → Model
  static TaskModel toModel(TaskEntity entity) {
    return TaskModel(
      id: entity.id,
      name: entity.name,
      date: entity.date,
    );
  }

  static List<TaskEntity> toEntityList(List<TaskModel> models) {
    return models.map(toEntity).toList();
  }

  static List<TaskModel> toModelList(List<TaskEntity> entities) {
    return entities.map(toModel).toList();
  }
}

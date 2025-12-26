import 'package:equatable/equatable.dart';

/// Domain entity for Task
/// This is pure business logic and doesn't depend on any external frameworks
class TaskEntity extends Equatable {
  final String id;
  final String name;
  final String date;

  const TaskEntity({
    required this.id,
    required this.name,
    required this.date,
  });

  TaskEntity copyWith({
    String? id,
    String? name,
    String? date,
  }) {
    return TaskEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      date: date ?? this.date,
    );
  }

  @override
  List<Object?> get props => [id, name, date];

  @override
  String toString() => 'Task(id: $id, name: $name, date: $date)';
}

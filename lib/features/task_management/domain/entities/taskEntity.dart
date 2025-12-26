import 'package:equatable/equatable.dart';

/// Domain entity for Task
/// This is pure business logic and doesn't depend on any external frameworks
class Task extends Equatable {
  final String id;
  final String name;
  final String date;

  const Task({
    required this.id,
    required this.name,
    required this.date,
  });

  Task copyWith({
    String? id,
    String? name,
    String? date,
  }) {
    return Task(
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

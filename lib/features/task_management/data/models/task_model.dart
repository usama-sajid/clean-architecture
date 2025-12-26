import 'dart:convert';

/// Data Transfer Object for Task
/// This handles JSON serialization/deserialization for the data layer
class TaskModel {
  final String id;
  final String name;
  final String date;

  TaskModel({
    required this.id,
    required this.name,
    required this.date,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json["id"],
        name: json["name"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "date": date,
      };

  factory TaskModel.fromString(String str) =>
      TaskModel.fromJson(json.decode(str));

  String toJsonString() => json.encode(toJson());
}

import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
class Task {
  int id;
  String title;
  String assignee;
  DateTime startDate;
  DateTime endDate;
  String status;

  Task(
      {this.id = 0,
      required this.title,
      required this.assignee,
      required this.startDate,
      required this.endDate,
      required this.status});

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
  Map<String, dynamic> toJson() => _$TaskToJson(this);
}

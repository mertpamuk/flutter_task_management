import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/interface/ibase_model.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel implements IBaseModel<TaskModel> {
  @HiveField(0)
  int? taskId;
  @HiveField(1)
  String? taskTitle;
  @HiveField(2)
  String? taskDescription;
  @HiveField(3)
  String? taskDueDate;
  @HiveField(4)
  String? taskImagePath;

  TaskModel(
      {this.taskId,
      this.taskTitle,
      this.taskDescription,
      this.taskDueDate,
      this.taskImagePath});

  @override
  int get id => taskId ?? 0;

  @override
  String get title => taskTitle ?? "";

  @override
  String get description => taskDescription ?? "";

  @override
  String get dueDate => taskDueDate ?? DateTime.now().toString();

  @override
  XFile get image => XFile(taskImagePath ?? "path");
}

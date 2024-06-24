import 'dart:io';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:mertpamukfluttercase/core/enum/post_service_enum.dart';
import 'package:mertpamukfluttercase/pages/home/task_model.dart';

import '../constants/constans.dart';
import '../core/interface/ipost_service.dart';

class TaskService implements ITaskService {
  final Dio _dio;
  TaskService() : _dio = Dio(BaseOptions(baseUrl: AppConstants.baseUrl));
  final String _boxName = 'taskBox';

  @override
  Future<bool> deleteTask(int id) async {
    try {
      final box = await Hive.openBox<TaskModel>(_boxName);
      await box.delete(id);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> addTask(TaskModel model) async {
    try {
      final response = await _dio.post(
        PostServicePaths.posts.name,
        data: {
          'title': model.title,
          'body': model.description,
          'userId': 1,
        },
      );
      if (response.statusCode == HttpStatus.created) {
        final box = await Hive.openBox<TaskModel>(_boxName);
        await box.put(model.id, model);
        return true;
      } else {}
    } catch (e) {}
    return false;
  }

  Future<List<TaskModel>> getAllTasks() async {
    try {
      final box = await Hive.openBox<TaskModel>(_boxName);
      return box.values.toList();
    } catch (e) {
      return [];
    }
  }
}

import '../../pages/home/task_model.dart';

abstract class ITaskService {
  Future<bool> deleteTask(int id);
  Future<bool> addTask(TaskModel model);

}

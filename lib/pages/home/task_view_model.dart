import 'package:get/get.dart';
import 'package:mertpamukfluttercase/pages/home/task_model.dart';
import 'package:mertpamukfluttercase/service/task_service.dart';

import '../../core/interface/igetxcontroller.dart';

class TaskViewModel extends GetxController implements IGetxController {
  final RxBool _isLoading = false.obs;
  RxList<TaskModel> tasks = <TaskModel>[].obs;

  final TaskService _taskService = TaskService();

  @override
  void onInit() {
    super.onInit();
    fetchTasks();
  }

  void fetchTasks() async {
    try {
      isLoading(true);
      List<TaskModel> fetchedTasks = await _taskService.getAllTasks();
      tasks.assignAll(fetchedTasks);
    } catch (e) {
    } finally {
      isLoading(false);
    }
  }

  @override
  RxBool get isLoading => _isLoading;

  @override
  RxList<TaskModel> get items => tasks;
}

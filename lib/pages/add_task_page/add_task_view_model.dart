import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mertpamukfluttercase/constants/constans.dart';
import '../../components/widgets/app_alert_dialog.dart';
import '../../service/task_service.dart';
import '../home/task_model.dart';
import '../home/task_view_model.dart';

class AddTaskViewModel extends GetxController {
  final TaskService _taskService = TaskService();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  XFile? imageFile;
  final TaskViewModel _taskViewModel = Get.find<TaskViewModel>();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      dateController.text = DateFormat('dd-MM-yyyy').format(picked);
    }
  }

  Future<void> pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    imageFile = pickedFile;
    update();
  }

  void createTask() {
    if (formKey.currentState!.validate() && imageValidator()) {
      final TaskModel task = TaskModel(
        taskId: _taskViewModel.items.length + 1,
        taskTitle: titleController.text,
        taskDescription: descriptionController.text,
        taskDueDate: dateController.text,
        taskImagePath: imageFile?.path,
      );

      _taskService.addTask(task).then((value) {
        if (value) {
          _taskViewModel.items.add(task);
          Get.dialog(const AppTaskCreateAlertDialog())
              .then((value) => Get.back());
        }
      });
    }
  }

  bool imageValidator() {
    if (imageFile == null) {
      Get.snackbar('Error', AppConstants.imageErrorSnackBarText);
      return false;
    }
    return true;
  }

  String? validateFormField(String? value) {
    if (value == null || value.isEmpty) {
      return AppConstants.validateEmptyText;
    } else if (value.length < 5) {
      return AppConstants.validateShortText;
    }
    return null;
  }

  Future<void> fetchAllTasks() async {
    final tasks = await _taskService.getAllTasks();
    _taskViewModel.items.assignAll(tasks);
    update();
  }
}

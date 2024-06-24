import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/widgets/add_task_float_button.dart';
import '../../components/widgets/app_appbar.dart';
import '../../components/widgets/app_item_builder.dart';
import '../../constants/constans.dart';
import 'task_view_model.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final postViewModel = Get.put(TaskViewModel());
    return Scaffold(
      appBar: setAppBar(AppConstants.tasksTitle),
      body: AppItemBuilder(viewModel: postViewModel),
      floatingActionButton: const AddTaskFloatButton(),
    );
  }
}




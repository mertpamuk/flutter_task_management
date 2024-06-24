import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mertpamukfluttercase/components/widgets/app_alert_dialog.dart';
import 'package:mertpamukfluttercase/constants/app_colors.dart';
import 'package:mertpamukfluttercase/constants/app_padding.dart';
import 'package:mertpamukfluttercase/constants/app_text_styles.dart';
import 'package:mertpamukfluttercase/constants/constans.dart';
import 'package:mertpamukfluttercase/core/interface/ibase_model.dart';

import '../../core/enum/post_service_enum.dart';
import '../../pages/home/task_view_model.dart';
import '../../service/task_service.dart';

class AppTaskDetail extends StatelessWidget {
  final IBaseModel model;
  AppTaskDetail({super.key, required this.model});
  final TaskViewModel _taskViewModel = Get.find<TaskViewModel>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          detailTitleBox(),
          const SizedBox(height: 16),
          Text(AppConstants.addTaskTitleText),
          const Divider(),
          Text(model.title),
          const SizedBox(height: 16),
          Text(AppConstants.addTaskDateText),
          const Divider(),
          Text(
            model.dueDate,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(AppConstants.addTaskDescriptionText,style: const TextStyle(fontSize: 20),),
          const Divider(),
          Text(
            model.description,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 32),
          Center(child: Image.file(File(model.image.path)))
        ],
      ),
      actions: [Center(child: deleteTaskButton())],
    );
  }

  Container detailTitleBox() {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Padding(
          padding: AppPadding.paddingMax,
          child: Center(
              child: Text(
            AppConstants.taskDetailTitle,
            style: AppTextStyles.whiteText,
          )),
        ));
  }

  ElevatedButton deleteTaskButton() => ElevatedButton(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
             Text(
              AppConstants.taskDeleteButtonText,
              style: AppTextStyles.redTextTitle,
            ),
            const SizedBox(
              width: 16,
            ),
            Icon(
              Icons.delete,
              color: AppColors.appTaskDeleteColor,
            ),
          ],
        ),
        onPressed: () => deleteItem(),
      );

  void deleteItem() {
    TaskService().deleteTask(model.id).then((value) {
      if (value) {
        Get.dialog(const AppDeleteAlertDialog(path: PostServicePaths.posts))
            .then((value) => Get.back());
        _taskViewModel.items.remove(model);
      } else {}
    });
  }
}

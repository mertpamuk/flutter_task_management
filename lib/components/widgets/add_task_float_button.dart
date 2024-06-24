import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../pages/add_task_page/add_task_page.dart';

class AddTaskFloatButton extends StatelessWidget {
  const AddTaskFloatButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: ()=> Get.to(const AddTaskPage()),
      backgroundColor: AppColors.primaryColor,
      child: Icon(
        Icons.add,
        color: AppColors.primaryIconColor,
      ),
    );
  }
}
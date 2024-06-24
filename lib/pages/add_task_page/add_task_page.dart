import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/widgets/app_appbar.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_padding.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/constans.dart';
import 'add_task_view_model.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AddTaskViewModel viewModel = Get.put(AddTaskViewModel());

    return Scaffold(
      appBar: setAppBar(AppConstants.addTaskPageTitle),
      body: Padding(
        padding: AppPadding.paddingMax,
        child: Form(
          key: viewModel.formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(AppConstants.addTaskTitleText),
                TextFormField(
                  controller: viewModel.titleController,
                  validator: viewModel.validateFormField,
                ),
                const SizedBox(height: 16),
                Text(AppConstants.addTaskDescriptionText),
                TextFormField(
                  controller: viewModel.descriptionController,
                  validator: viewModel.validateFormField,
                ),
                const SizedBox(height: 16),
                Text(AppConstants.addTaskDateText),
                TextFormField(
                  controller: viewModel.dateController,
                  readOnly: true,
                  onTap: () => viewModel.selectDate(context),
                  validator: viewModel.validateFormField,
                  decoration: InputDecoration(
                    hintText: AppConstants.selectDateText,
                  ),
                ),
                const SizedBox(height: 16),
                GetBuilder<AddTaskViewModel>(
                  builder: (viewmodel) {
                    return viewmodel.imageFile == null
                        ? Text(AppConstants.noImageSelectText)
                        : Image.file(File(viewmodel.imageFile!.path));
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => viewModel.pickImage(),
                  child: Text(AppConstants.imagePickerButtonText),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
                  onPressed: viewModel.createTask,
                  child: Text(
                    AppConstants.addTaskButtonText,
                    style: AppTextStyles.whiteText,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

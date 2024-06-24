import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mertpamukfluttercase/constants/constans.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_padding.dart';
import '../../constants/app_text_styles.dart';
import '../../core/enum/post_service_enum.dart';

class AppDeleteAlertDialog extends StatelessWidget {
  final PostServicePaths path;
  const AppDeleteAlertDialog({super.key, required this.path});

  @override
  Widget build(BuildContext context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Column(
          children: [
            Padding(
              padding: AppPadding.paddingDefault,
              child: Icon(
                Icons.delete_outline,
                size: 50,
                color: AppColors.appTaskDeleteColor,
              ),
            ),
            Text(
              AppConstants.taskDeletedText,
              style: AppTextStyles.redTextTitle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () => Get.back(),
              child: const Text(
                'Close',
                style: AppTextStyles.redTextTitle,
              ),
            ),
          ),
        ],
      );
}

class AppTaskCreateAlertDialog extends StatelessWidget {
  const AppTaskCreateAlertDialog({super.key});

  @override
  Widget build(BuildContext context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Column(
          children: [
            Padding(
              padding: AppPadding.paddingDefault,
              child: Icon(
                Icons.delete_outline,
                size: 50,
                color: AppColors.primaryColor,
              ),
            ),
            Text(
              AppConstants.taskCreatedText,
              style: AppTextStyles.primaryTextStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () => Get.back(),
              child: Text(
                'Close',
                style: AppTextStyles.primaryTextStyle,
              ),
            ),
          ),
        ],
      );
}

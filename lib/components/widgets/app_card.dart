import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mertpamukfluttercase/components/widgets/app_task_detail.dart';
import '../../constants/app_box_decorations.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_padding.dart';
import '../../constants/app_text_styles.dart';
import '../../core/interface/ibase_model.dart';

class AppCard extends StatelessWidget {
  final IBaseModel model;

  const AppCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: AppPadding.paddingDefault,
        child: Card(
          elevation: 4,
          color: AppColors.appCardBackgroundColor,
          child: ListTile(
            minVerticalPadding: 0,
            contentPadding: AppPadding.appCardTitlePadding,
            leading: Text(
              model.id.toString(),
              style: TextStyle(color: AppColors.primaryColor, fontSize: 20),
            ),
            title: Container(
              decoration: AppBoxDecorations.appCardTitleDecoration,
              child: Padding(
                padding: AppPadding.paddingDefault,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: AppPadding.appCardTitlePadding,
                        child: Column(
                          children: [
                            Text(
                              model.title,
                              style: AppTextStyles.whiteTextTitle,
                            ),
                            Text(
                              model.dueDate.toString(),
                              style: AppTextStyles.whiteTextTitle,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Icon(Icons.info_outline,
                          color: AppColors.primaryIconColor),
                    )
                  ],
                ),
              ),
            ),
            onTap: () => Get.dialog(AppTaskDetail(model: model)),
          ),
        ),
      );
}

import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/constans.dart';

AppBar setAppBar(String title) => AppBar(
      backgroundColor: AppColors.primaryColor,
      title: Text(
        "${AppConstants.appBarTitle} - $title",
        style: AppTextStyles.whiteText,
        
      ),
    );

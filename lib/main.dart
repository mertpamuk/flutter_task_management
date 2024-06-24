import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mertpamukfluttercase/constants/app_colors.dart';
import 'package:mertpamukfluttercase/pages/home/task_view.dart';

import 'pages/home/task_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mert Pamuk Case App',
      home: const TaskView(),
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: AppColors.primaryIconColor))),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/interface/igetxcontroller.dart';
import 'app_card.dart';

class AppItemBuilder extends StatelessWidget {
  final IGetxController viewModel;

  const AppItemBuilder({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) => Obx(
        () => viewModel.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: viewModel.items.length,
                itemBuilder: (context, index) =>
                    AppCard(model: viewModel.items[index]),
              ),
      );
}

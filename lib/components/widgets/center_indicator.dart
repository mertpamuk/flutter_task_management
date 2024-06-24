import 'package:flutter/material.dart';

class CenterIndicator extends StatelessWidget {
  const CenterIndicator({super.key});
  @override
  Widget build(BuildContext context) =>
      const Center(child: CircularProgressIndicator());
}

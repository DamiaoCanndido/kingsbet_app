import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './predict_controller.dart';

class PredictPage extends GetView<PredictController> {
  const PredictPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PredictPage'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: controller.addHome,
            child: const Text("+"),
          ),
          Obx(
            () => Text(controller.homePredict.toString()),
          ),
          ElevatedButton(
            onPressed: controller.subHome,
            child: const Text("-"),
          ),
        ],
      ),
    );
  }
}

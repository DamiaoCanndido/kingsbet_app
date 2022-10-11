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
      body: Container(
        margin: const EdgeInsets.all(8),
        height: 300,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 150,
              padding: const EdgeInsets.all(8),
              child: Row(children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          controller.gameModel.home!.shieldUrl!,
                        ),
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: controller.subHome,
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                        ),
                        child: const Text("-"),
                      ),
                      Container(
                        child: Obx(
                          () => Text(
                            controller.homePredict.value.toString(),
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: controller.addHome,
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                        ),
                        child: const Text("+"),
                      ),
                    ],
                  ),
                )
              ]),
            ),
            Container(
              height: 150,
              padding: const EdgeInsets.all(8),
              child: Row(children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          controller.gameModel.away!.shieldUrl!,
                        ),
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: controller.addAway,
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                        ),
                        child: const Text("+"),
                      ),
                      Container(
                        child: Obx(
                          () => Text(
                            controller.awayPredict.value.toString(),
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: controller.subAway,
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                        ),
                        child: const Text("-"),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

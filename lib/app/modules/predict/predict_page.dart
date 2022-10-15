import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kingsbet_app/app/core/ui/widgets/kingsbet_appbar.dart';
import 'package:kingsbet_app/app/core/ui/widgets/kingsbet_button.dart';
import 'package:kingsbet_app/app/modules/predict/widgets/predict_tile.dart';
import './predict_controller.dart';

class PredictPage extends GetView<PredictController> {
  const PredictPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KingsbetAppBar(),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            height: 266,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: Column(
              children: [
                Container(
                  height: 100,
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
                          Obx(
                            () => Text(
                              controller.homePredict.value.toString(),
                              style: const TextStyle(
                                fontSize: 25,
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
                  height: 100,
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
                            onPressed: controller.subAway,
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                            ),
                            child: const Text("-"),
                          ),
                          Obx(
                            () => Text(
                              controller.awayPredict.value.toString(),
                              style: const TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: controller.addAway,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: KingsbetButton(
                    label: "ENVIAR",
                    width: double.infinity,
                    onPressed: controller.createPredict,
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => Container(
              margin: const EdgeInsets.only(top: 280),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.predicts.length,
                itemBuilder: (context, index) {
                  final predict = controller.predicts[index];
                  return PredictTile(predictModel: predict);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

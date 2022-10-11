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
          Container(
            height: 150,
            child: Row(children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.amber,
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
                child: Container(
                  color: Colors.orange,
                  child: const Text("0"),
                ),
              )
            ]),
          ),
          Container(
            height: 150,
            child: Row(children: [
              Expanded(
                flex: 2,
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
                child: Container(
                  child: const Text("0"),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}

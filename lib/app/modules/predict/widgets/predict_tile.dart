import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kingsbet_app/app/modules/predict/predict_controller.dart';
import '../../../models/predict_model.dart';

class PredictTile extends GetView<PredictController> {
  final PredictModel predictModel;
  const PredictTile({super.key, required this.predictModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 60,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 30,
            child: Text(
              "${predictModel.player!.user!.name} - ${predictModel.homePredict}:${predictModel.awayPredict}",
            ),
          ),
          SizedBox(
            height: 30,
            child: Text(
              DateFormat('dd/MM/yyyy E kk:mm').format(
                predictModel.createdAt!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

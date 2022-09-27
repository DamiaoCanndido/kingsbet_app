import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kingsbet_app/app/core/ui/widgets/kingsbet_game.dart';
import '../../../models/phase_model.dart';

class PhaseTile extends StatelessWidget {
  final PhaseModel phaseModel;
  const PhaseTile({super.key, required this.phaseModel});

  @override
  Widget build(BuildContext context) {
    // TODO: ExpansionPanelList
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
          ),
          padding: const EdgeInsets.all(10),
          height: 50,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          child: Text(
            "RODADA ${phaseModel.order.toString()}",
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        Container(
          height: 320,
          margin: const EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          child: ListView.builder(
            itemBuilder: (ctx, idx) {
              return const KingsbetGame();
            },
            itemCount: 10,
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
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
              return KingsbetGame(
                homeShield:
                    "https://upload.wikimedia.org/wikipedia/commons/0/01/Brazil_flag_300.png",
                awayShield:
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Flag_of_Serbia.svg/800px-Flag_of_Serbia.svg.png",
                homeTeam: "BRASIL",
                awayTeam: "SÉRVIA",
                stadium: "LUSAIL",
                start: DateTime.parse("2022-09-24T16:36:29.187Z"),
                champ: "Copa do mundo",
                homeKick: null,
                awayKick: null,
              );
            },
            itemCount: 5,
          ),
        )
      ],
    );
  }
}

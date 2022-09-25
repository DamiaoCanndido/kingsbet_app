import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kingsbet_app/app/core/ui/widgets/kingsbet_appbar.dart';
import 'package:kingsbet_app/app/modules/phase/widgets/phase_tile.dart';
import './phase_controller.dart';

class PhasePage extends GetView<PhaseController> {
  const PhasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KingsbetAppBar(
        title: Text(controller.leagueModel.name),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.phases.length,
          itemBuilder: (context, index) {
            final phase = controller.phases[index];
            return PhaseTile(phaseModel: phase);
          },
        );
      }),
    );
  }
}

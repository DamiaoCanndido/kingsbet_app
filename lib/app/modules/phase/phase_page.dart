import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kingsbet_app/app/core/ui/widgets/kingsbet_appbar.dart';
import './phase_controller.dart';

class PhasePage extends GetView<PhaseController> {
  const PhasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KingsbetAppBar(
        title: Text(controller.leagueModel.name),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return const Text("RODADA");
        },
      ),
    );
  }
}

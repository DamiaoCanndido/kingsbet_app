import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'league_controller.dart';

class LeaguePage extends GetView<LeagueController> {
  const LeaguePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Ligas"),
    );
  }
}

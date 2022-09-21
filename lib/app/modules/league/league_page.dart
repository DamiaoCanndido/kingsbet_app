import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kingsbet_app/app/modules/league/widgets/league_tile.dart';
import 'league_controller.dart';

class LeaguePage extends GetView<LeagueController> {
  const LeaguePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const LeagueTile();
      },
    );
  }
}

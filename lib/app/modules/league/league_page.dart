import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kingsbet_app/app/modules/league/widgets/league_tile.dart';
import 'league_controller.dart';

class LeaguePage extends GetView<LeagueController> {
  const LeaguePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: controller.leagues.length,
        itemBuilder: (context, index) {
          final league = controller.leagues[index];
          return LeagueTile(
            leagueModel: league,
          );
        },
      ),
    );
  }
}

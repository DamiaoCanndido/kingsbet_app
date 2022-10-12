import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kingsbet_app/app/modules/league_me/widgets/league_me_tile.dart';
import 'league_me_controller.dart';

class LeaguePage extends GetView<LeagueMeController> {
  const LeaguePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          return RefreshIndicator(
            onRefresh: controller.refreshPage,
            child: ListView.builder(
              itemCount: controller.leagues.length,
              itemBuilder: (context, index) {
                final league = controller.leagues[index];
                return LeagueMeTile(
                  leagueModel: league,
                );
              },
            ),
          );
        },
      ),
    );
  }
}

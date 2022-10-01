import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kingsbet_app/app/core/ui/widgets/kingsbet_appbar.dart';
import 'package:kingsbet_app/app/modules/game/widgets/game_tile.dart';
import 'game_controller.dart';

class GamePage extends GetView<GameController> {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KingsbetAppBar(
        title: Text(controller.leagueModel.name),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.games.length,
          itemBuilder: (context, index) {
            final game = controller.games[index];
            return GameTile(gameModel: game);
          },
        );
      }),
    );
  }
}

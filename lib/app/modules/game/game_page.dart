import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kingsbet_app/app/core/ui/widgets/kingsbet_appbar.dart';
import 'package:kingsbet_app/app/core/ui/widgets/kingsbet_button.dart';
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
        return Column(
          children: [
            Row(
              children: [
                KingsbetButton(
                  label: "jogos",
                  onPressed: () {
                    controller.setTabIndexButton(0);
                    controller.findGamesByLeague();
                  },
                  color: controller.tabButton == 0 ? Colors.green : Colors.grey,
                ),
                KingsbetButton(
                  label: "tabela",
                  onPressed: () {
                    controller.setTabIndexButton(1);
                    controller.findGamesByLeague();
                  },
                  color: controller.tabButton == 1 ? Colors.green : Colors.grey,
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: controller.games.length,
              itemBuilder: (context, index) {
                final game = controller.games[index];
                return GameTile(gameModel: game);
              },
            ),
          ],
        );
      }),
    );
  }
}

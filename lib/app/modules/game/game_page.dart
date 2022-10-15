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
        return Stack(
          children: [
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: KingsbetButton(
                      width: Get.width * 0.4,
                      height: 30,
                      label: "JOGOS",
                      onPressed: () {
                        controller.setTabIndexButton(0);
                      },
                      color: controller.tabButton == 0
                          ? Colors.green
                          : Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: KingsbetButton(
                      width: Get.width * 0.4,
                      height: 30,
                      label: "TABELA",
                      onPressed: () {
                        controller.setTabIndexButton(1);
                      },
                      color: controller.tabButton == 1
                          ? Colors.green
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            controller.tabButton == 0
                ? Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.games.length,
                      itemBuilder: (context, index) {
                        final game = controller.games[index];
                        return GameTile(gameModel: game);
                      },
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: const Text("Em breve"),
                  ),
          ],
        );
      }),
    );
  }
}

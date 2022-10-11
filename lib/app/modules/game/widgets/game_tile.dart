import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kingsbet_app/app/core/ui/widgets/kingsbet_game.dart';
import 'package:kingsbet_app/app/modules/game/game_controller.dart';
import '../../../core/constants/constants.dart';
import '../../../models/game_model.dart';

class GameTile extends GetView<GameController> {
  final GameModel gameModel;
  const GameTile({super.key, required this.gameModel});

  @override
  Widget build(BuildContext context) {
    return KingsbetGame(
      onTap: () {
        Get.toNamed(
          Constants.PREDICT,
          arguments: {
            "gameModel": gameModel,
            "leagueId": controller.leagueModel.id
          },
        );
      },
      homeShield: gameModel.home!.shieldUrl!,
      awayShield: gameModel.away!.shieldUrl!,
      homeTeam: gameModel.home!.name!,
      awayTeam: gameModel.away!.name!,
      stadium: "",
      start: gameModel.start!,
      champ: gameModel.champ?.name,
      homeScore: gameModel.homeScore,
      homeKick: gameModel.homeKickScore,
      awayScore: gameModel.awayScore,
      awayKick: gameModel.awayKickScore,
    );
  }
}

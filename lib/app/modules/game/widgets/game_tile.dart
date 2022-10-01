import 'package:flutter/material.dart';
import 'package:kingsbet_app/app/core/ui/widgets/kingsbet_game.dart';
import '../../../models/game_model.dart';

class GameTile extends StatelessWidget {
  final GameModel gameModel;
  const GameTile({super.key, required this.gameModel});

  @override
  Widget build(BuildContext context) {
    // TODO: ExpansionPanelList
    return KingsbetGame(
      homeShield: gameModel.home!.shieldUrl!,
      awayShield: gameModel.away!.shieldUrl!,
      homeTeam: gameModel.home!.name!,
      awayTeam: gameModel.away!.name!,
      stadium: "",
      start: gameModel.start!,
      champ: gameModel.champ?.name,
      homeKick: gameModel.homeScore,
      awayKick: gameModel.awayScore,
    );
  }
}

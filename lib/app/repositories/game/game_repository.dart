import 'package:kingsbet_app/app/models/game_model.dart';

abstract class GameRepository {
  Future<List<GameModel>> getGamesByLeague(String leagueId);
}

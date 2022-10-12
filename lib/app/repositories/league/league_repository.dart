import 'package:kingsbet_app/app/models/league_model.dart';
import 'package:kingsbet_app/app/models/player_model.dart';

abstract class LeagueRepository {
  Future<List<LeagueModel>> getMyLeagues();
  Future<PlayerModel> createPlayer(String leagueId);
}

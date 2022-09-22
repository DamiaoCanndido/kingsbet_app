import 'package:kingsbet_app/app/models/league_model.dart';

abstract class LeagueRepository {
  Future<List<LeagueModel>> getLeagues();
}

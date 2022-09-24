import 'package:kingsbet_app/app/models/phase_model.dart';

abstract class PhaseRepository {
  Future<List<PhaseModel>> getPhasesByLeague(String leagueId);
}

import '../../models/predict_model.dart';

abstract class PredictRepository {
  Future<List<PredictModel>> findPredictByMatch(
    String leagueId,
    String gameId,
  );
  Future<PredictModel> createPredict(
    String leagueId,
    String gameId,
    int homePredict,
    int awayPredict,
  );
}

import '../../models/predict_model.dart';

abstract class PredictRepository {
  Future<PredictModel> createPredict(
    String leagueId,
    String gameId,
    int homePredict,
    int awayPredict,
  );
}

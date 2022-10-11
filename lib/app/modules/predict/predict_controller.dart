import 'package:get/get.dart';
import '../../models/game_model.dart';
import '../../repositories/predict/predict_repository.dart';

class PredictController extends GetxController {
  final PredictRepository _predictRepository;

  PredictController({required PredictRepository predictRepository})
      : _predictRepository = predictRepository;

  final _gameModel = Rx<GameModel>(Get.arguments["gameModel"]);
  GameModel get gameModel => _gameModel.value;

  final _leagueId = RxString(Get.arguments["leagueId"]);
  String get leagueId => _leagueId.value;

  RxInt homePredict = 0.obs;
  RxInt awayPredict = 0.obs;

  void addHome() {
    homePredict(homePredict.value + 1);
  }

  void subHome() {
    if (homePredict.value > 0) {
      homePredict(homePredict.value - 1);
    }
  }
}

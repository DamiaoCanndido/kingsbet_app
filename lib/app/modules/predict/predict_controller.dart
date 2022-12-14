import 'dart:developer';
import 'package:get/get.dart';
import '../../core/mixins/messages_mixin.dart';
import '../../core/rest_client/rest_client.dart';
import '../../models/game_model.dart';
import '../../models/predict_model.dart';
import '../../repositories/predict/predict_repository.dart';

class PredictController extends GetxController with MessagesMixin {
  final PredictRepository _predictRepository;

  PredictController({required PredictRepository predictRepository})
      : _predictRepository = predictRepository;

  final predicts = <PredictModel>[].obs;

  final _message = Rxn<MessageModel>();

  final _gameModel = Rx<GameModel>(Get.arguments["gameModel"]);
  GameModel get gameModel => _gameModel.value;

  final _leagueId = RxString(Get.arguments["leagueId"]);
  String get leagueId => _leagueId.value;

  RxInt homePredict = 0.obs;
  RxInt awayPredict = 0.obs;

  @override
  void onInit() {
    super.onInit();
    messageListener(_message);
  }

  @override
  void onReady() {
    super.onReady();
    try {
      findPredictsByMatch();
    } catch (e, s) {
      log(
        'Erro ao buscar palpites',
        error: e,
        stackTrace: s,
      );
    }
  }

  void addHome() {
    homePredict(homePredict.value + 1);
  }

  void subHome() {
    if (homePredict.value > 0) {
      homePredict(homePredict.value - 1);
    }
  }

  void addAway() {
    awayPredict(awayPredict.value + 1);
  }

  void subAway() {
    if (awayPredict.value > 0) {
      awayPredict(awayPredict.value - 1);
    }
  }

  Future<void> findPredictsByMatch() async {
    final allPredicts = await _predictRepository.findPredictByMatch(
      leagueId,
      gameModel.id!,
    );
    predicts.assignAll(allPredicts);
  }

  Future<void> createPredict() async {
    try {
      await _predictRepository.createPredict(
        leagueId,
        gameModel.id!,
        homePredict.value,
        awayPredict.value,
      );

      Get.back();
      _message(MessageModel(
        title: 'Sucesso',
        message: 'Palpite enviado',
        type: MessageType.info,
      ));
    } on RestClientException catch (e, s) {
      Get.back();
      _message(MessageModel(
        title: 'Erro',
        message: e.message,
        type: MessageType.error,
      ));
      log(
        e.message,
        error: e.code,
        stackTrace: s,
      );
    } catch (e, s) {
      log('Erro ao criar palpite', stackTrace: s);
      _message(MessageModel(
        title: 'Erro',
        message: 'Erro ao criar palpite',
        type: MessageType.error,
      ));
    }
  }
}

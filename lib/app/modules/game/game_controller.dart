import 'dart:developer';
import 'package:get/get.dart';
import 'package:kingsbet_app/app/models/league_model.dart';
import 'package:kingsbet_app/app/models/game_model.dart';
import '../../core/mixins/loader_mixin.dart';
import '../../repositories/game/game_repository.dart';

class GameController extends GetxController with LoaderMixin {
  final _leagueModel = Rx<LeagueModel>(Get.arguments);
  LeagueModel get leagueModel => _leagueModel.value;

  final _tabButton = 0.obs;
  int get tabButton => _tabButton.value;

  void setTabIndexButton(int index) {
    _tabButton(index);
  }

  final _loading = false.obs;
  final games = <GameModel>[].obs;

  final GameRepository _gameRepository;

  GameController({required GameRepository gameRepository})
      : _gameRepository = gameRepository;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
  }

  @override
  void onReady() async {
    super.onReady();
    try {
      findGamesByLeague();
    } catch (e, s) {
      _loading.toggle();
      log(
        'Erro ao buscar games',
        error: e,
        stackTrace: s,
      );
    }
  }

  Future<void> findGamesByLeague() async {
    if (_tabButton.value == 0) {
      final allGames = await _gameRepository.getGamesByLeague(
        _leagueModel.value.id!,
      );
      games.assignAll(allGames);
    } else {
      games.assignAll([]);
    }
  }
}

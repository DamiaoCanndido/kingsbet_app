import 'dart:developer';

import 'package:get/get.dart';
import 'package:kingsbet_app/app/core/mixins/loader_mixin.dart';
import '../../models/league_model.dart';
import '../../repositories/league/league_repository.dart';

class LeagueController extends GetxController with LoaderMixin {
  final LeagueRepository _leagueRepository;

  final _loading = false.obs;
  final leagues = <LeagueModel>[].obs;

  LeagueController({required LeagueRepository leagueRepository})
      : _leagueRepository = leagueRepository;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
  }

  @override
  void onReady() {
    super.onReady();
    try {
      _loading.toggle();
      findAllLeagues();
      _loading.toggle();
    } catch (e, s) {
      _loading.toggle();
      log(
        'Erro ao buscar ligas',
        error: e,
        stackTrace: s,
      );
    }
  }

  Future<void> findAllLeagues() async {
    final allLeagues = await _leagueRepository.getLeagues();
    leagues.assignAll(allLeagues);
  }
}

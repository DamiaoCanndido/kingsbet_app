import 'dart:developer';
import 'package:get/get.dart';
import 'package:kingsbet_app/app/models/league_model.dart';
import 'package:kingsbet_app/app/models/phase_model.dart';
import '../../core/mixins/loader_mixin.dart';
import '../../repositories/phase/phase_repository.dart';

class PhaseController extends GetxController with LoaderMixin {
  final _leagueModel = Rx<LeagueModel>(Get.arguments);
  LeagueModel get leagueModel => _leagueModel.value;

  final _loading = false.obs;
  final phases = <PhaseModel>[].obs;

  final PhaseRepository _phaseRepository;

  PhaseController({required PhaseRepository phaseRepository})
      : _phaseRepository = phaseRepository;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
  }

  @override
  void onReady() async {
    super.onReady();
    try {
      findPhasesByLeague();
    } catch (e, s) {
      _loading.toggle();
      log(
        'Erro ao buscar fases',
        error: e,
        stackTrace: s,
      );
    }
  }

  Future<void> findPhasesByLeague() async {
    final allPhases = await _phaseRepository.getPhasesByLeague(
      _leagueModel.value.id!,
    );
    phases.assignAll(allPhases);
  }
}

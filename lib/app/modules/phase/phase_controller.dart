import 'package:get/get.dart';
import 'package:kingsbet_app/app/models/league_model.dart';

import '../../repositories/phase/phase_repository.dart';

class PhaseController extends GetxController {
  final _leagueModel = Rx<LeagueModel>(Get.arguments);
  LeagueModel get leagueModel => _leagueModel.value;

  final PhaseRepository _phaseRepository;

  PhaseController({required PhaseRepository phaseRepository})
      : _phaseRepository = phaseRepository;
}

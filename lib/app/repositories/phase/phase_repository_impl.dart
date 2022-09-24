import 'dart:developer';
import 'package:get/get.dart';
import 'package:kingsbet_app/app/models/phase_model.dart';
import 'package:kingsbet_app/app/repositories/phase/phase_repository.dart';
import '../../core/constants/constants.dart';
import '../../core/rest_client/rest_client.dart';
import '../../core/services/auth_service.dart';

class PhaseRepositoryImpl implements PhaseRepository {
  final RestClient _restClient;

  PhaseRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;
  @override
  Future<List<PhaseModel>> getPhasesByLeague(String leagueId) async {
    final response = await _restClient.get(
      "${Constants.PHASE}/$leagueId/league",
    );
    if (response.hasError) {
      log(
        'Erro ao buscar fases ${response.statusCode}',
        error: response.statusText,
        stackTrace: StackTrace.current,
      );
      Get.find<AuthService>().logout();
      throw RestClientException('Erro ao buscar fases');
    }

    return response.body.map<PhaseModel>((p) => PhaseModel.fromMap(p)).toList();
  }
}

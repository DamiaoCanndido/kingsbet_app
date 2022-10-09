import 'dart:developer';
import 'package:get/get.dart';
import 'package:kingsbet_app/app/models/league_model.dart';
import 'package:kingsbet_app/app/models/player_model.dart';
import 'package:kingsbet_app/app/repositories/league/league_repository.dart';
import '../../core/constants/constants.dart';
import '../../core/rest_client/rest_client.dart';
import '../../core/services/auth_service.dart';

class LeagueRepositoryImpl implements LeagueRepository {
  final RestClient _restClient;

  LeagueRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<List<LeagueModel>> getLeagues() async {
    final response = await _restClient.get(Constants.LEAGUE);

    if (response.hasError) {
      log(
        'Erro ao buscar ligas ${response.statusCode}',
        error: response.statusText,
        stackTrace: StackTrace.current,
      );
      Get.find<AuthService>().logout();
      throw RestClientException('Erro ao buscar ligas');
    }

    return response.body
        .map<LeagueModel>((l) => LeagueModel.fromMap(l))
        .toList();
  }

  @override
  Future<PlayerModel> createPlayer(String leagueId) async {
    final token = Get.find<AuthService>().getUserAccessToken();

    final response = await _restClient
        .post("${Constants.LEAGUE}/$leagueId/player", headers: {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token",
    }, {});

    if (response.hasError) {
      log(
        'Erro ao criar jogador ${response.statusCode}',
        error: response.statusText,
        stackTrace: StackTrace.current,
      );
      // Get.find<AuthService>().logout();
      throw RestClientException('Erro ao criar jogador');
    }

    return PlayerModel.fromMap(response.body);
  }
}

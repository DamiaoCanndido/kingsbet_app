import 'dart:developer';
import 'package:get/get.dart';
import 'package:kingsbet_app/app/models/game_model.dart';
import 'package:kingsbet_app/app/repositories/game/game_repository.dart';
import '../../core/constants/constants.dart';
import '../../core/rest_client/rest_client.dart';
import '../../core/services/auth_service.dart';

class GameRepositoryImpl implements GameRepository {
  final RestClient _restClient;

  GameRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;
  @override
  Future<List<GameModel>> getGamesByLeague(String leagueId) async {
    final response = await _restClient.get(
      "${Constants.GAME}/$leagueId/league",
    );
    if (response.hasError) {
      log(
        'Erro ao buscar jogos ${response.statusCode}',
        error: response.statusText,
        stackTrace: StackTrace.current,
      );
      Get.find<AuthService>().logout();
      throw RestClientException('Erro ao buscar jogos');
    }

    return response.body.map<GameModel>((p) => GameModel.fromMap(p)).toList();
  }
}

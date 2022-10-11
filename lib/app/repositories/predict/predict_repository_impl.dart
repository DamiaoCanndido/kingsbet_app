import 'dart:developer';
import 'package:get/get.dart';
import 'package:kingsbet_app/app/core/rest_client/rest_client.dart';
import 'package:kingsbet_app/app/core/services/auth_service.dart';
import 'package:kingsbet_app/app/models/predict_model.dart';
import 'package:kingsbet_app/app/repositories/predict/predict_repository.dart';
import '../../core/constants/constants.dart';

class PredictRepositoryImpl implements PredictRepository {
  final RestClient _restClient;

  PredictRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<PredictModel> createPredict(
    String leagueId,
    String gameId,
    int homePredict,
    int awayPredict,
  ) async {
    final token = Get.find<AuthService>().getUserAccessToken();

    final response = await _restClient
        .post("${Constants.LEAGUE}/$leagueId${Constants.PREDICT}", headers: {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token",
    }, {
      "gameId": gameId,
      "homePredict": homePredict,
      "awayPredict": awayPredict
    });

    if (response.hasError) {
      if (response.body["statusCode"] == 401) {
        Get.find<AuthService>().logout();
      }
      log(
        'Erro ao criar palpite ${response.body["statusCode"]}',
        error: response.statusText,
        stackTrace: StackTrace.current,
      );

      throw RestClientException(response.body["error"]);
    }

    return PredictModel.fromMap(response.body);
  }
}

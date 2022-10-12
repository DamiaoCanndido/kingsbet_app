import 'dart:developer';
import 'package:get/get.dart';
import 'package:kingsbet_app/app/core/mixins/loader_mixin.dart';
import 'package:kingsbet_app/app/core/mixins/messages_mixin.dart';
import '../../core/rest_client/rest_client.dart';
import '../../models/league_model.dart';
import '../../repositories/league/league_repository.dart';

class LeagueMeController extends GetxController
    with LoaderMixin, MessagesMixin {
  final LeagueRepository _leagueRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();
  final leagues = <LeagueModel>[].obs;

  LeagueMeController({required LeagueRepository leagueRepository})
      : _leagueRepository = leagueRepository;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
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

  Future<void> createPlayer(String leagueId) async {
    try {
      _loading.toggle();
      await _leagueRepository.createPlayer(leagueId);
      _loading.toggle();

      _message(MessageModel(
        title: 'Sucesso',
        message: 'Você foi cadastrado',
        type: MessageType.info,
      ));
    } on RestClientException catch (e, s) {
      _loading.toggle();
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
      _loading.toggle();
      log('Erro ao criar jogador', stackTrace: s);
      _message(MessageModel(
        title: 'Erro',
        message: 'Erro ao criar jogador',
        type: MessageType.error,
      ));
    }
  }

  Future<void> findAllLeagues() async {
    final allLeagues = await _leagueRepository.getMyLeagues();
    leagues.assignAll(allLeagues);
  }

  Future<void> refreshPage() async {
    try {
      findAllLeagues();
    } catch (e, s) {
      log(
        'Erro ao buscar ligas',
        error: e,
        stackTrace: s,
      );
    }
  }
}

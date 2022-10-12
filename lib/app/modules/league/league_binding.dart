import 'package:get/get.dart';
import 'package:kingsbet_app/app/repositories/league/league_repository.dart';
import 'package:kingsbet_app/app/repositories/league/league_repository_impl.dart';
import 'league_controller.dart';

class LeagueBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeagueRepository>(
      () => LeagueRepositoryImpl(
        restClient: Get.find(),
      ),
    );
    Get.lazyPut<LeagueController>(
      () => LeagueController(
        leagueRepository: Get.find<LeagueRepository>(),
      ),
    );
  }
}

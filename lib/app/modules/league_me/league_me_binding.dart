import 'package:get/get.dart';
import 'package:kingsbet_app/app/repositories/league/league_repository.dart';
import 'package:kingsbet_app/app/repositories/league/league_repository_impl.dart';
import 'league_me_controller.dart';

class LeagueMeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeagueRepository>(
      () => LeagueRepositoryImpl(
        restClient: Get.find(),
      ),
    );
    Get.lazyPut<LeagueMeController>(
      () => LeagueMeController(
        leagueRepository: Get.find<LeagueRepository>(),
      ),
    );
  }
}

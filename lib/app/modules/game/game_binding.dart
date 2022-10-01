import 'package:get/get.dart';
import 'package:kingsbet_app/app/repositories/game/game_repository.dart';
import 'package:kingsbet_app/app/repositories/game/game_repository_impl.dart';
import 'game_controller.dart';

class GameBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GameRepository>(
      () => GameRepositoryImpl(
        restClient: Get.find(),
      ),
    );
    Get.lazyPut<GameController>(
      () => GameController(
        gameRepository: Get.find<GameRepository>(),
      ),
    );
  }
}

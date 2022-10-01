import 'package:get/get.dart';
import 'package:kingsbet_app/app/core/constants/constants.dart';
import '../modules/game/game_binding.dart';
import '../modules/game/game_page.dart';

class GameRouters {
  GameRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: Constants.GAME,
      page: () => const GamePage(),
      binding: GameBinding(),
    )
  ];
}

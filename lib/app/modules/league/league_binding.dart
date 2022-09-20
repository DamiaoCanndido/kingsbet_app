import 'package:get/get.dart';
import 'league_controller.dart';

class LeagueBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LeagueController());
  }
}

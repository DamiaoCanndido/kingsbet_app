import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kingsbet_app/app/core/services/auth_service.dart';
import 'package:kingsbet_app/app/modules/league_me/league_me_page.dart';
import '../../core/constants/constants.dart';
import '../league/league_binding.dart';
import '../league/league_page.dart';
import '../league_me/league_me_binding.dart';

class HomeController extends GetxController {
  static const NAVIGATOR_KEY = 1;

  final _tabIndex = 0.obs;
  int get tabIndex => _tabIndex.value;

  final _tabs = [Constants.LEAGUE_NOW, Constants.LEAGUE_ME, Constants.LOGOUT];

  set setTabIndex(int index) {
    _tabIndex(index);
    if (_tabs[index] == Constants.LOGOUT) {
      Get.find<AuthService>().logout();
    } else {
      Get.toNamed(_tabs[index], id: NAVIGATOR_KEY);
    }
  }

  Route? onGenerateRouter(RouteSettings settings) {
    if (settings.name == Constants.LEAGUE_NOW) {
      return GetPageRoute(
        settings: settings,
        page: () => const LeaguePage(),
        binding: LeagueBinding(),
        transition: Transition.fadeIn,
      );
    }

    if (settings.name == Constants.LEAGUE_ME) {
      return GetPageRoute(
        settings: settings,
        page: () => const LeagueMePage(),
        binding: LeagueMeBinding(),
        transition: Transition.fadeIn,
      );
    }

    return null;
  }
}

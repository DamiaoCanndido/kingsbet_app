import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kingsbet_app/app/modules/league/league_binding.dart';
import 'package:kingsbet_app/app/modules/league/league_page.dart';

import '../../core/constants/constants.dart';

class HomeController extends GetxController {
  static const NAVIGATOR_KEY = 1;

  Route? onGenerateRouter(RouteSettings settings) {
    if (settings.name == Constants.LEAGUE) {
      return GetPageRoute(
        settings: settings,
        page: () => const LeaguePage(),
        binding: LeagueBinding(),
        transition: Transition.fadeIn,
      );
    }

    if (settings.name == Constants.LEAGUE_ME) {}

    return null;
  }
}

import 'package:get/get.dart';
import 'package:kingsbet_app/app/core/constants/constants.dart';
import 'package:kingsbet_app/app/modules/phase/phase_page.dart';
import '../modules/phase/phase_binding.dart';

class PhaseRouters {
  PhaseRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: Constants.PHASE,
      page: () => const PhasePage(),
      binding: PhaseBinding(),
    )
  ];
}

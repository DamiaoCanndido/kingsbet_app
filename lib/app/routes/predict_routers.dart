import 'package:get/get.dart';
import 'package:kingsbet_app/app/core/constants/constants.dart';
import '../modules/predict/predict_binding.dart';
import '../modules/predict/predict_page.dart';

class PredictRouters {
  PredictRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: Constants.PREDICT,
      page: () => const PredictPage(),
      binding: PredictBinding(),
    )
  ];
}

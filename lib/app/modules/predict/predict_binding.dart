import 'package:get/get.dart';
import 'package:kingsbet_app/app/modules/predict/predict_controller.dart';
import '../../repositories/predict/predict_repository.dart';
import '../../repositories/predict/predict_repository_impl.dart';

class PredictBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PredictRepository>(
      () => PredictRepositoryImpl(
        restClient: Get.find(),
      ),
    );
    Get.lazyPut<PredictController>(
      () => PredictController(
        predictRepository: Get.find<PredictRepository>(),
      ),
    );
  }
}

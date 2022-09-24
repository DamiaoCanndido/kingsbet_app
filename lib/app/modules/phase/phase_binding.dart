import 'package:get/get.dart';
import 'package:kingsbet_app/app/repositories/phase/phase_repository.dart';
import 'package:kingsbet_app/app/repositories/phase/phase_repository_impl.dart';
import './phase_controller.dart';

class PhaseBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhaseRepository>(
      () => PhaseRepositoryImpl(
        restClient: Get.find(),
      ),
    );
    Get.lazyPut<PhaseController>(
      () => PhaseController(
        phaseRepository: Get.find<PhaseRepository>(),
      ),
    );
  }
}

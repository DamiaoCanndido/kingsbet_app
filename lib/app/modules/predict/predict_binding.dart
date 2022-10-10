import 'package:get/get.dart';
import './predict_controller.dart';

class PredictBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PredictController());
  }
}

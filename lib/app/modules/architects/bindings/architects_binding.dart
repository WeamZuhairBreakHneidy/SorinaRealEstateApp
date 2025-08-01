import 'package:get/get.dart';

import '../controllers/architects_controller.dart';

class ArchitectsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArchitectsController>(
      () => ArchitectsController(),
    );
  }
}

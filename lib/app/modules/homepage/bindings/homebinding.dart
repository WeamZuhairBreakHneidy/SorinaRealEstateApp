import 'package:get/get.dart';
import 'package:my_house_app/app/modules/property/controllers/propertycontroller.dart';

import '../controllers/homecontroller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
        Get.lazyPut<PropertyController>(() => PropertyController()); // ✅ This was the key fix

  }
}

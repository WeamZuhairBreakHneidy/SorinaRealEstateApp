import 'package:get/get.dart';
import 'package:my_house_app/app/modules/homemanagement/bindings/home_manager.dart';
import 'package:my_house_app/app/modules/homemanagement/view/home_manager.dart';

import 'package:my_house_app/app/modules/propertydetails/bindings/property_binding.dart';
import 'package:my_house_app/app/modules/propertydetails/views/property_view.dart';

import '../modules/architects/bindings/architects_binding.dart';
import '../modules/architects/views/architects_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/bindings/register_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/auth/views/register_view.dart';
import '../modules/home/bindings/home_binding.dart';

import '../modules/mainbar/views/Mainbar_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () =>  MainbarView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PROPERTYDETAILS,
      page: () => PropertyDetails(),
      binding: PropertyDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PROPERTYMANAGER,
      page: () => PropertyManager(),
      binding: PropertyManagerBinding(),
    ),
         
    

    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(name: _Paths.AUTH, page: () => AuthView(), binding: AuthBinding()),
    //Auth.Register
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.ARCHITECTS,
      page: () =>  ArchitectsView(),
      binding: ArchitectsBinding(),
    ),
  ];
}

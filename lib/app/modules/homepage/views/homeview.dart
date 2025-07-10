   import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/modules/home/views/widgets/Bottombar.dart' show BottomNavBar;
import 'package:my_house_app/app/modules/property/controllers/propertycontroller.dart';
import 'package:my_house_app/app/modules/property/view/property.dart';
import '../controllers/homecontroller.dart';

class HomeView extends StatelessWidget {
  
  final HomeController controller = Get.find();


  final List<Widget> bodies = [
    PropertyView(),
    //ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
     
      //appBar: AppBar(title: Text('GetX Home Page')),
      body: Obx(() => bodies[controller.selectedIndex.value]),
            bottomNavigationBar: BottomNavBar(),

    
      );
    
  }
}

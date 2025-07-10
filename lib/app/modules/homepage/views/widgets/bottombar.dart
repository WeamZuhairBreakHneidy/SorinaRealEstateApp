import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../../../homepage/controllers/home_controller.dart';

class BottomNavBar extends StatelessWidget {
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          height: 90, // Increased to suit larger icons
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8), // Slight vertical padding
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, -2),
              ),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: SalomonBottomBar(
            currentIndex: controller.selectedIndex.value,
            onTap: controller.changeBody,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey[400],
            itemPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16), // Center text+icon
            items: [
              SalomonBottomBarItem(
                icon: const Icon(Icons.home, size: 35),
                title:  Text("Home",style: Theme.of(context).textTheme.labelSmall),
                selectedColor: Colors.indigo,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.store, size: 35),
                title:  Text("Hot Deals",style: Theme.of(context).textTheme.labelSmall),
                selectedColor: Colors.teal,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.add, size: 35),
                title:  Text("Add Offer",style: Theme.of(context).textTheme.labelSmall),
                selectedColor: Colors.red,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.person, size: 35),
                title:  Text("My Offers",style: Theme.of(context).textTheme.labelSmall),
                selectedColor: Colors.indigo,
              ),
            ],
          ),
        ));
  }
}

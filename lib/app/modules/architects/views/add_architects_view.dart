import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AddArchitectsView extends GetView {
  const AddArchitectsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddArchitectsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddArchitectsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

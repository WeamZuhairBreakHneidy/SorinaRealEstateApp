import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:my_house_app/app/modules/homemanagement/services/homemanager_service.dart';

class PropertyManagerController extends GetxController {
  final _service = PropertyService(
    token: '1|Nv8B2uXnMgi37cHbvvh1P1bi7V0JlV7Ilx4aH1Hj5c5c2d8c',
  );

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final bedroomsController = TextEditingController();
  final bathroomsController = TextEditingController();
  final areaController = TextEditingController();
  final addressController = TextEditingController();
  final locationController = TextEditingController();
  final floorsNumberController = TextEditingController();
  final groundDistanceController = TextEditingController();
  final buildingAgeController = TextEditingController();
  final feature1Controller = TextEditingController();
  final feature2Controller = TextEditingController();
  final feature3Controller = TextEditingController();

  List<File> selectedImages = [];
  File? selectedVideo;
  bool showOnTimeline = false;

  void setShowOnTimeline(bool value) {
    showOnTimeline = value;
    update();
  }

  Future<void> pickImages() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.any, allowMultiple: true);
    if (result != null) {
      selectedImages = result.paths.map((path) => File(path!)).toList();
      update();
    }
  }

  Future<void> pickVideo() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.video);
    if (result != null && result.files.single.path != null) {
      selectedVideo = File(result.files.single.path!);
      update();
    }
  }

  Future<void> submitProperty() async {
    final fields = {
      'title': titleController.text.trim(),
      'description': descriptionController.text.trim(),
      'price': priceController.text.trim(),
      'rooms_number': bedroomsController.text.trim(),
      'baths_number': bathroomsController.text.trim(),
      'area': areaController.text.trim(),
      'address': addressController.text.trim(),
      'location': locationController.text.trim(),
      'floors_number': floorsNumberController.text.trim(),
      'ground_distance': groundDistanceController.text.trim(),
      'building_age': buildingAgeController.text.trim(),
    };

    List<String> features = [
      feature1Controller.text.trim(),
      feature2Controller.text.trim(),
      feature3Controller.text.trim(),
    ];

    for (int i = 0; i < features.length; i++) {
      if (features[i].isNotEmpty) {
        fields['main_features[$i]'] = features[i];
      }
    }

    final response = await _service.submitProperty(
      fields: fields,
      images: selectedImages,
      video: selectedVideo,
    );

    if (response == null) {
      Get.snackbar('Error', 'No response from server');
      return;
    }

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = response.body;
      final json = data.isNotEmpty ? jsonDecode(data) : {};
      Get.snackbar('Success', 'Property added successfully');

      if (json['status'] == true && showOnTimeline) {
        final houseId = json['data']['id'];
        await _service.sendToFeaturedApi(houseId);
      }

    } else {
      Get.snackbar('Error', 'Failed: ${response.body}');
    }
  }

  void clearFields() {
    titleController.clear();
    descriptionController.clear();
    priceController.clear();
    bedroomsController.clear();
    bathroomsController.clear();
    areaController.clear();
    addressController.clear();
    locationController.clear();
    floorsNumberController.clear();
    groundDistanceController.clear();
    buildingAgeController.clear();
    feature1Controller.clear();
    feature2Controller.clear();
    feature3Controller.clear();
    selectedImages = [];
    selectedVideo = null;
    update();
  }

  @override
  void onClose() {
    //clearFields();
    super.onClose();
  }
}

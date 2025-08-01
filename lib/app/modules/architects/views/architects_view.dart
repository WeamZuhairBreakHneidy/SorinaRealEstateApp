import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/colors.dart';
import '../../../data/services/api_endpoints.dart';
import '../controllers/architects_controller.dart';
import '../models/architect_model.dart';

class ArchitectsView extends StatelessWidget {
  final controller = Get.put(ArchitectsController());

  ArchitectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Architects", style: TextStyle(color: AppColors.numbersfontcolor)),
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.architects.isEmpty) {
          return const Center(
              child: CircularProgressIndicator(color: AppColors.numbersfontcolor));
        }

        return NotificationListener<ScrollNotification>(
          onNotification: (scrollInfo) {
            if (!controller.isLoading.value &&
                controller.hasMore.value &&
                scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
              controller.fetchArchitects(loadMore: true);
            }
            return false;
          },
          child: Padding(
            padding: EdgeInsets.all(12.w),
            child: GridView.builder(
              itemCount: controller.architects.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 14.h,
                crossAxisSpacing: 14.w,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                return ArchitectCard(architect: controller.architects[index]);
              },
            ),
          ),
        );
      }),
    );
  }
}

class ArchitectCard extends StatelessWidget {
  final Architect architect;

  const ArchitectCard({super.key, required this.architect});

  String? _getFullImageUrl(String? rawUrl) {
    if (rawUrl == null || rawUrl.isEmpty) return null;
    final uri = Uri.parse(rawUrl);
    return "${ApiEndpoints.baseUrl}${uri.path}";
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = _getFullImageUrl(architect.imageUrl);

    return GestureDetector(
      onTap: () => _showDetailsBottomSheet(context, architect),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 8.r,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: imageUrl == null
                    ? Image.asset('assets/images/placeholder_blur.png', fit: BoxFit.cover)
                    : FadeInImage.assetNetwork(
                  placeholder: 'assets/images/placeholder_blur.png',
                  image: imageUrl,
                  fit: BoxFit.cover,
                  imageErrorBuilder: (_, __, ___) => Image.asset(
                    'assets/images/placeholder_blur.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 12.h,
            left: 12.w,
            right: 12.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.85),
                borderRadius: BorderRadius.circular(14.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4.r,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    architect.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      color: AppColors.fontcolor,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    architect.specialization,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.numbersfontcolor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDetailsBottomSheet(BuildContext context, Architect architect) {
    final imageUrl = _getFullImageUrl(architect.imageUrl);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (_) {
        return DraggableScrollableSheet(
          initialChildSize: 0.85,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          expand: false,
          builder: (_, scrollController) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                    child: imageUrl == null
                        ? Image.asset('assets/images/placeholder_blur.png',
                        width: 120.w, height: 120.w, fit: BoxFit.cover)
                        : FadeInImage.assetNetwork(
                      placeholder: 'assets/images/placeholder_blur.png',
                      image: imageUrl,
                      width: 120.w,
                      height: 120.w,
                      fit: BoxFit.cover,
                      imageErrorBuilder: (_, __, ___) => Image.asset(
                          'assets/images/placeholder_blur.png',
                          width: 120.w,
                          height: 120.w,
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    architect.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: AppColors.numbersfontcolor,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  _buildInfoRow("Specialization", architect.specialization),
                  _buildInfoRow("University", architect.university),
                  _buildInfoRow("Country", architect.country),
                  _buildInfoRow("City", architect.city),
                  if (architect.experience != null)
                    _buildInfoRow("Experience", architect.experience!),
                  _buildInfoRow("Languages", architect.languages),
                  _buildInfoRow("Years Experience", "${architect.yearsExperience} years"),
                  _buildPhoneRow("Phone", architect.phone),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 3,
              child: Text("$title:",
                  style:
                  TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp))),
          Expanded(
              flex: 5,
              child: Text(value,
                  style: TextStyle(fontSize: 14.sp, color: AppColors.fontcolor))),
        ],
      ),
    );
  }

  Widget _buildPhoneRow(String title, String phoneNumber) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text("$title:",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp)),
          ),
          Expanded(
            flex: 5,
            child: GestureDetector(
              onTap: () async {
                final uri = Uri.parse("tel:$phoneNumber");
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                } else {
                  Get.snackbar("Error", "Could not launch dialer",
                      backgroundColor: Colors.red, colorText: Colors.white);
                }
              },
              child: Row(
                children: [
                  Icon(Icons.call, color: Colors.green, size: 18.sp),
                  SizedBox(width: 6.w),
                  Text(
                    phoneNumber,
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

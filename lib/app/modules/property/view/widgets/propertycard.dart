import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/routes/app_pages.dart';
import 'package:my_house_app/app/widgets/responsive_buttun.dart';
import 'package:my_house_app/generated/locales.g.dart';

//new edits
class PropertyCard extends StatelessWidget {
  final List<String> imageUrls;
  final String? videoUrl;

  final String location;
   final String address;
  final String name;
  final String price;
  final String description;
    final bool isSell;
    final bool isRent;
    final bool isFurnitured;

  final int? roomsNumber;
  final int? bathsNumber;
  final int? floorsNumber;
  final int? groundDistance;
  final int? buildingAge;
  final List<String>? mainFeatures;


  const PropertyCard({
    required this.imageUrls,
    required this.videoUrl,
    required this.location,
    required this.address,
    required this.name,
    required this.price,
    required this.description, required this.roomsNumber, required this.bathsNumber, required this.floorsNumber, this.groundDistance, this.buildingAge, this.mainFeatures, required this.isSell, required this.isRent, required this.isFurnitured
  });

 @override
Widget build(BuildContext context) {

  return Card(
    clipBehavior: Clip.antiAlias,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🖼️ Image with Favorite Icon
        Stack(
          children: [
            Image.network(
              imageUrls[0],
              width: double.infinity,
              height: 250.h,
              fit: BoxFit.cover,
            ),
           Positioned(
            top: 12.h,
            right: 12.w,
            child: Container(
              padding:  EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary, // Secondary color
                borderRadius: BorderRadius.circular(8), // Square with slight rounding
              ),
              child: Text(
                isSell
                    ? 'for_sale_category'.tr
                    : isRent
                        ? 'for_rent_category'.tr
                        : 'Null',
                style: Theme.of(context).textTheme.titleSmall
              ),
            ),
          ),

          ],
        ),

        // 📝 Info Section
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  Location + Price Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, size: 25.sp, color: AppColors.black),
                      SizedBox(width: 4.w),
                      Text(
                        location,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  Text(
                    price,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
                            
                            
                SizedBox(height: 5.h,),
               Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          address,
                          style: Theme.of(context).textTheme.labelSmall
                        
                        ),
                        SizedBox(height: 3.h,),
                         Text(
                        '$roomsNumber ${LocaleKeys.rooms.tr}, $groundDistance ${LocaleKeys.area.tr}, $floorsNumber ${LocaleKeys.floors.tr}',
                          style: Theme.of(context).textTheme.labelSmall
                        
                        ),
                      ],
                    ),
                  ],
                ),
              Column(
                children: [
                   SizedBox(height: 5.h),
                 
                  /*Text(
                    '/Paid in Usd',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),*/
                ],
              ),
              SizedBox(height: 6.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
               
                    style: Theme.of(context).textTheme.titleSmall,
                    
                  ),

                   ResponsiveButton(
                    buttonHeight: 40.h,
                    onPressed: () {
                    Get.toNamed(
                      Routes.PROPERTYDETAILS,
                     arguments: {
                  'imgUrls': imageUrls,
                  'videoUrl': videoUrl,
                  'location': location,
                  'address': address,
                  'title': name,
                  'price': price,
                  'description': description,
                  'roomsNumber': roomsNumber,
                  'bathsNumber': bathsNumber,
                  'floorsNumber': floorsNumber,
                  'groundDistance': groundDistance,
                  'buildingAge': buildingAge,
                  'mainFeatures': mainFeatures,
                  'isSell': isSell,
                  'isRent': isRent,
                  'isFurnitured': isFurnitured,
                },
                    );
                  },
                    clickable: true,
                    buttonWidth: 120.w,
                    child: Text( 'contact_seller_button'.tr, style: Theme.of(context).textTheme.labelSmall,),
                  ),

                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/core/theme/colors.dart';


class RememberMeCheckbox extends StatelessWidget {
  final RxBool isChecked;
  final Color? activeColor;
RememberMeCheckbox({super.key, required this.isChecked, this.activeColor});

  @override
  Widget build(BuildContext context) {
    return Obx(() => FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width:15.w,
            child: Checkbox(
                  
             
              value: isChecked.value,
              onChanged: (value) {
                isChecked.value = value!;
              },
            ),
          ),
          SizedBox(width:5.w),
          Text('labels_remember_me'.tr,
              style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    ));
  }
}

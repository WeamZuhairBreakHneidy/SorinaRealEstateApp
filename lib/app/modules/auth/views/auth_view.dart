import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:my_house_app/app/widgets/input_text_form_field.dart';


import '../../../core/theme/colors.dart';

import '../../../core/util/device_utils.dart';

import '../../../data/services/validator_service.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/remember_me_checkbox.dart';

import '../../../widgets/input_text_form_field_with_label.dart';
import '../../../widgets/responsive_buttun.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
   AuthView({super.key});
  GlobalKey<FormState> loginFormKey=GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,


      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0, // Remove the shadow of the app bar
      //   automaticallyImplyLeading: false,
      //   leading: TextButton(
      //     onPressed: () {
      //       Get.find<LocaleService>().toggleLocale();
      //     },
      //     child: Text(
      //       '${Get.locale?.languageCode}',
      //       style: Theme.of(context).textTheme.bodyLarge,
      //     ),
      //   ),
      // ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  DeviceUtils.isPhone()
                      ? 'assets/images/authphoto.jpg'
                      : 'assets/backgrounds/tablet_background.jpeg',
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          // Opacity Layer
          Container(
            color: AppColors.grey.withOpacity(0.3),
          ),

          Form(
            key:loginFormKey,
            child: ListView(

              children: [



                //Logo
                Container(
                  alignment: Alignment.center,
                  height: 300.h,
                  margin: EdgeInsets.only(  top:20.h ,left: 30.w,right: 30.w).r,
                  child: Image.asset(
                    'assets/Logo.png',

                  ),

                ),




                //Email
                Container(

                  margin:   EdgeInsets.only(top:70.h,left: 48.w,right: 48.w),
                  child: InputTextFormField(
                      height: 80.h,


                    textEditingController: controller.emailController,

                    errorStyle: TextStyle(height: 0, color: Theme.of(context).colorScheme.error),

                    suffixIcon: Icon(Icons.mail, color: AppColors.fontcolor),
                    obsecure: false,
                    hintText: 'hint_text_enter_your_email'.tr,
                    helper: Text(''),

                    validatorType: ValidatorType.Email,

                  ),
                ),


                //Password
                Container(
                  margin:   EdgeInsets.only(top:10.h,left: 48.w,right: 48.w),
                  child: Obx(
                    () => InputTextFormField(
                      height: 60.h,

                      textEditingController: controller.passwordController,
                      errorStyle: const TextStyle(height: -1, color: Colors.transparent),
                      obsecure: controller.isPasswordHidden.value,
                      hintText: 'hint_text_enter_your_password'.tr,
                      suffixIcon: IconButton(
                        icon: Icon(
                          (controller.isPasswordHidden.value)
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.primary,
                        ),
                        onPressed: () {
                          controller.isPasswordHidden.value =
                              !controller.isPasswordHidden.value;
                        },
                      ),


                      validatorType: ValidatorType.LoginPassword,

                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 48).w,
                  child: Row(
                     mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                    children: [
                      // Remember Me Checkbox
                      Flexible(flex: 1,child: RememberMeCheckbox(isChecked: controller.rememberMe)),


                      
                    ],
                  ),
                ),



                //Button
                Obx(()=>Container(
                  margin:   EdgeInsets.only(top:24.h,left: 48.w,right: 48.w),
                  child: ResponsiveButton(
                    onPressed: () {
                      if(loginFormKey.currentState!.validate()){

                        controller.login();
                      }
                    },
                    clickable: !controller.isLoading.value,

                    buttonStyle: ButtonStyle(


                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        ),
                      ),
                    ),
                    buttonWidth: Get.width,
                    child: Text('buttons_login'.tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.fontcolor)),
                  ),
                )),
                       Container(
                            margin:   EdgeInsets.only(top:33.h,left: 48.w,right: 48.w),
                  child: ResponsiveButton(
                    onPressed: () {
                      Get.toNamed(Routes.HOME);
                    },
                    clickable: true,

                    buttonStyle: ButtonStyle(


                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        ),
                      ),
                    ),
                    buttonWidth: Get.width,
                    child: Text('guest_button'.tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.fontcolor)),
                  ),
                ),



                GestureDetector(
                  onTap: () => Get.toNamed(Routes.REGISTER),
                  child: Container(
                    margin:   EdgeInsets.only(top:25.h,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "labels_dont_have_an_account".tr,
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(color:Colors.grey[400]),
                        ),
                  
                      ],
                    ),
                  ),
                ),


                /*Container(
                            margin:   EdgeInsets.only(top:33.h,left: 48.w,right: 48.w),
                  child: ResponsiveButton(
                    onPressed: () {
                      Get.toNamed(Routes.REGISTER);
                    },
                    clickable: true,

                    buttonStyle: ButtonStyle(


                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        ),
                      ),
                    ),
                    buttonWidth: Get.width,
                    child: Text('buttons_sign_up'.tr, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.numbersfontcolor)),
                  ),
                ),*/
           
                 /*Container(
                            margin:   EdgeInsets.only(top:33.h,left: 48.w,right: 48.w),
                  child: ResponsiveButton(
                    onPressed: () {
                      Get.toNamed(Routes.PROPERTYMANAGER);
                    },
                    clickable: true,

                    buttonStyle: ButtonStyle(


                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        ),
                      ),
                    ),
                    buttonWidth: Get.width,
                    child: Text('Add', style: Theme.of(context).textTheme.bodyMedium),
                  ),
                ),*/
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// //OR Divider
// CustomDivider(
//
//   height: 20.h,
//   text: 'OR',
//   fontSize: 16.r,
//   fontFamily: AppTheme.primaryFont,
//
//   thickness: 2,
//   indent: 20.w,
//   endIndent: 20.w,
//
//
// ),
// 20.verticalSpace,
// //Google Login
// ResponsiveButton(
//   onPressed: () {},
//   clickable: true,
//   margin: EdgeInsets.symmetric(horizontal: 48).w,
//   buttonStyle: ButtonStyle(
//     backgroundColor: WidgetStatePropertyAll(AppColors.surface),
//     overlayColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.secondary),
//     padding: WidgetStatePropertyAll(
//       EdgeInsets.symmetric(vertical: 10.r),
//     ),
//     shape: WidgetStatePropertyAll(
//       RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(Radius.circular(50.r)),
//       ),
//     ),
//   ),
//   buttonWidth: Get.width,
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Text('labels_login_with_Google'.tr, style: Theme.of(context).textTheme.bodyMedium,),
//       10.horizontalSpace,
//       Image.asset(
//         'assets/google.png',
//         width: 20,
//         height: 20,
//       ),
//
//     ],
//   ),
// ),

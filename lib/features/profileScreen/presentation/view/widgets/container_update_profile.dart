import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskapp/Controller/profile_controller.dart';
import 'package:taskapp/core/utils/app_strings.dart';
import 'package:taskapp/core/utils/app_styles.dart';
import 'package:taskapp/core/utils/k_colors.dart';

class ContainerUpdateProfile extends StatelessWidget {
  final ProfileController? profileController;

  const ContainerUpdateProfile({super.key, this.profileController});

  @override
  Widget build(BuildContext context) {
    final controller = profileController ?? Get.find<ProfileController>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Obx(() => GestureDetector(
        onTap: controller.isSaving.value ? null : () => controller.onUpdateProfile(),
        child: Container(
          height: 45,
          width: 220,
          decoration: BoxDecoration(
            color: controller.isSaving.value ? Colors.grey : salmonColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: controller.isSaving.value
                ? CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
                : Text(
              AppStrings.updateProfile,
              style: AppStyles.textSemiBold24(context).copyWith(color: Colors.white),
            ),
          ),
        ),
      )),
    );
  }
}
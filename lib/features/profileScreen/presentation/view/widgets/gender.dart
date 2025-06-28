import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskapp/Controller/profile_controller.dart';
import 'package:taskapp/core/utils/app_styles.dart';
import 'package:taskapp/core/utils/k_colors.dart';

class Gender extends StatelessWidget {
  final ProfileController? profileController;

  const Gender({super.key, this.profileController});

  @override
  Widget build(BuildContext context) {
    final controller = profileController ?? Get.find<ProfileController>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Gender',
            style: AppStyles.textSemiBold18(context).copyWith(fontSize: 16),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: beigeColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Obx(() => RadioListTile<String>(
                    value: 'Male',
                    groupValue: controller.selectedGender.value,
                    onChanged: (value) {
                      controller.setGender(value!);
                    },
                    title: Text('Male'),
                    activeColor: Colors.brown,
                    contentPadding: EdgeInsets.zero,
                  )),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: beigeColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Obx(() => RadioListTile<String>(
                    value: 'Female',
                    groupValue: controller.selectedGender.value,
                    onChanged: (value) {
                      controller.setGender(value!);
                    },
                    title: Text('Female'),
                    activeColor: Colors.brown,
                    contentPadding: EdgeInsets.zero,
                  )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
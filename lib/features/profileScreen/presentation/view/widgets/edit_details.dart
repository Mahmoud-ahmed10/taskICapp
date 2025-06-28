import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskapp/controller/edit_details_controller.dart';
import 'package:taskapp/core/utils/app_styles.dart';
import 'package:taskapp/core/utils/k_colors.dart';

class EditDetails extends GetView<EditDetailsController> {
  const EditDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Stack(
            children: [
              Obx(() => CircleAvatar(
                    radius: 60,
                    backgroundImage: controller.selectedImage.value != null
                        ? FileImage(controller.selectedImage.value!)
                            as ImageProvider
                        : const AssetImage('assets/logo.jpg'),
                  )),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: salmonColor,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(0),
                  child: IconButton(
                    onPressed: controller.pickImage,
                    icon: const Icon(
                      Icons.camera_alt,
                      color: Colors.black87,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(color: beigeColor),
            child: Column(
              children: [
                Text('7ooda',
                    textAlign: TextAlign.center,
                    style: AppStyles.textSemiBold18(context)
                        .copyWith(fontSize: 26)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('ID',
                        textAlign: TextAlign.center,
                        style: AppStyles.textSemiBold18(context)
                            .copyWith(fontSize: 20)),
                    Text(
                      ':25030024',
                      textAlign: TextAlign.center,
                      style: AppStyles.textSemiBold18(context)
                          .copyWith(fontSize: 18, color: Colors.grey),
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

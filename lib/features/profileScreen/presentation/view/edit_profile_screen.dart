import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskapp/Controller/profile_controller.dart';
import 'package:taskapp/core/utils/app_strings.dart';
import 'package:taskapp/core/utils/k_colors.dart';
import 'package:taskapp/features/profileScreen/presentation/view/widgets/container_update_profile.dart';
import 'package:taskapp/features/profileScreen/presentation/view/widgets/custom_text_form_field.dart';
import 'package:taskapp/features/profileScreen/presentation/view/widgets/date_of_birth.dart';
import 'package:taskapp/features/profileScreen/presentation/view/widgets/details_preson.dart';
import 'package:taskapp/features/profileScreen/presentation/view/widgets/edit_details.dart';
import 'package:taskapp/features/profileScreen/presentation/view/widgets/gender.dart';
import '../../../../core/utils/components/app_bar.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context, AppStrings.myProfile, false),
      body: Obx(() {
        if (profileController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              // DetailsPreson(color: beigeColor),
              EditDetails(),
              SizedBox(height: 20),
              CustomTextFormField(
                LabelText: AppStrings.fullName,
                hintText: AppStrings.enterYourFullName,
                controller: profileController.fullNameController,
              ),
              CustomTextFormField(
                LabelText: AppStrings.email,
                hintText: AppStrings.enterYourEmail,
                controller: profileController.emailController,
              ),
              CustomTextFormField(
                LabelText: AppStrings.mobileNumber,
                hintText: AppStrings.enterYourMobileNumber,
                controller: profileController.mobileNumberController,
              ),
              DatePickerField(profileController: profileController),
              Gender(profileController: profileController),
              ContainerUpdateProfile(profileController: profileController),
            ],
          ),
        );
      }),
    );
  }
}

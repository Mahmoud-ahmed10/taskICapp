import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskapp/Controller/profile_controller.dart';
import 'package:taskapp/core/utils/app_styles.dart';
import 'package:taskapp/core/utils/k_colors.dart';

class DatePickerField extends StatelessWidget {
  final ProfileController? profileController;

  const DatePickerField({super.key, this.profileController});

  Future<void> _pickDate(
      BuildContext context, ProfileController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      final formattedDate = "${picked.day}/${picked.month}/${picked.year}";
      controller.setDateOfBirth(formattedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = profileController ?? Get.find<ProfileController>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Date Of Birth',
            style: AppStyles.textSemiBold18(context).copyWith(fontSize: 16),
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: controller.dateOfBirthController,
            readOnly: true,
            onTap: () => _pickDate(context, controller),
            decoration: InputDecoration(
              hintText: 'Select your date of birth',
              filled: true,
              fillColor: beigeColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
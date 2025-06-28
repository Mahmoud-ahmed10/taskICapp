import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskapp/controller/date_controller.dart';
import 'package:taskapp/core/utils/app_styles.dart';
import 'package:taskapp/core/utils/k_colors.dart';

class DatePickerField extends StatelessWidget {
  const DatePickerField({super.key});

  Future<void> _pickDate(
      BuildContext context, DatePickerController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: controller.selectedDate.value ?? DateTime(2000, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      controller.setDate(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DatePickerController());

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
          Obx(() => TextFormField(
                readOnly: true,
                onTap: () => _pickDate(context, controller),
                decoration: InputDecoration(
                  hintText: controller.formattedDate,
                  filled: true,
                  fillColor: beigeColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

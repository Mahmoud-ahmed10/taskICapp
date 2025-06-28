import 'package:flutter/material.dart';
import 'package:taskapp/core/utils/app_styles.dart';
import 'package:taskapp/core/utils/k_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.LabelText,
    required this.hintText,
    this.controller,
    this.readOnly = false,
    this.onTap,
  });

  final String LabelText;
  final String hintText;
  final TextEditingController? controller;
  final bool readOnly;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LabelText,
            style: AppStyles.textSemiBold18(context).copyWith(fontSize: 16),
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: controller,
            readOnly: readOnly,
            onTap: onTap,
            decoration: InputDecoration(
              hintText: hintText,
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

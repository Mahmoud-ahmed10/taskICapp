import 'package:flutter/material.dart';
import 'package:taskapp/core/utils/app_strings.dart';
import 'package:taskapp/core/utils/app_styles.dart';
import 'package:taskapp/core/utils/k_colors.dart';

class ContainerUpdateProfile extends StatelessWidget {
  const ContainerUpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 45,
          width: 220,
          decoration: BoxDecoration(
            color: salmonColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
              child: Text(
            AppStrings.updateProfile,
            style:
                AppStyles.textSemiBold24(context).copyWith(color: Colors.white),
          )),
        ),
      ),
    );
  }
}

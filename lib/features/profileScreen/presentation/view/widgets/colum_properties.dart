import 'package:flutter/material.dart';
import 'package:taskapp/core/utils/app_styles.dart';
import 'package:taskapp/core/utils/custom_space_height.dart';
import 'package:taskapp/core/utils/custom_space_width.dart';
import 'package:taskapp/core/utils/k_colors.dart';

class RowProperties extends StatelessWidget {
  RowProperties(
      {super.key, required this.iconProperties, required this.nameProperties});
  String nameProperties;
  IconData iconProperties;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: salmonColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(iconProperties),
          ),
          CustomSpaceWidth(width: .03),
          Text(
            nameProperties,
            style: AppStyles.textSemiBold18(context).copyWith(fontSize: 18),
          )
        ],
      ),
    );
  }
}

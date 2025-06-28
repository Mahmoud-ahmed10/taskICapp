import 'package:flutter/material.dart';

import '../app_styles.dart';
import '../k_colors.dart';

AppBar buildAppBar(BuildContext context, String title, bool isActionButton) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    title: Text(
      title,
      style: AppStyles.textSemiBold24(context).copyWith(color: salmonColor),
    ),
    centerTitle: true,
    actions: [
      isActionButton
          ? IconButton(
              icon: const Icon(
                Icons.edit_note,
                color: salmonColor,
                size: 30,
              ),
              onPressed: () {
                // Add your edit action here
              },
            )
          : SizedBox(),
    ],
  );
}

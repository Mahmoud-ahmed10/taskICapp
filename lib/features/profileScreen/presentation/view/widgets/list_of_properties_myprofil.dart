import 'package:flutter/material.dart';
import 'package:taskapp/core/utils/app_strings.dart';
import 'package:taskapp/core/utils/k_colors.dart';
import 'package:taskapp/features/profileScreen/presentation/view/widgets/colum_properties.dart';

class ListOfPropertiesMyprofil extends StatelessWidget {
  ListOfPropertiesMyprofil({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      RowProperties(
          iconProperties: Icons.key, nameProperties: AppStrings.privacyPolicy),
      RowProperties(
          iconProperties: Icons.payment,
          nameProperties: AppStrings.paymentMethods),
      RowProperties(
          iconProperties: Icons.notifications,
          nameProperties: AppStrings.notification),
      RowProperties(
          iconProperties: Icons.settings, nameProperties: AppStrings.settings),
      RowProperties(
          iconProperties: Icons.help, nameProperties: AppStrings.help),
      RowProperties(
          iconProperties: Icons.logout, nameProperties: AppStrings.logout),
    ]);
  }
}

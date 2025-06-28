import 'package:flutter/material.dart';
import 'package:taskapp/core/utils/custom_space_height.dart';
import 'package:taskapp/features/profileScreen/presentation/view/widgets/User_menu_container.dart';

import 'package:taskapp/features/profileScreen/presentation/view/widgets/details_preson.dart';

import 'package:taskapp/core/utils/app_strings.dart';
import 'package:taskapp/features/profileScreen/presentation/view/widgets/list_of_properties_myprofil.dart';

import '../../../../core/utils/components/app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(context, AppStrings.myProfile, true),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                DetailsPreson(
                  color: Colors.white,
                ),
                CustomSpaceHeight(
                  height: .03,
                ),
                UserMenuContainer(),
                CustomSpaceHeight(
                  height: .03,
                ),
                ListOfPropertiesMyprofil()
              ],
            ),
          ),
        ));
  }
}

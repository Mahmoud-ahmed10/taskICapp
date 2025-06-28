import 'package:flutter/material.dart';
import 'package:taskapp/core/utils/app_styles.dart';

class MenuItem extends StatelessWidget {
  MenuItem({
    super.key,
    required this.textmenu,
    required this.icon,
    required this.onpressed,
  });
  String textmenu;
  IconData icon;
  VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(onPressed: onpressed, icon: Icon(icon, size: 50)),
        Text(textmenu,
            style: AppStyles.textSemiBold18(context).copyWith(fontSize: 15)),
      ],
    );
  }
}

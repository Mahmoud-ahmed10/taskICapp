import 'package:flutter/material.dart';
import 'package:taskapp/core/utils/k_colors.dart';
import 'package:taskapp/features/profileScreen/presentation/view/widgets/order_items.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Oreder",
          style: TextStyle(color: salmonColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            OrderItemCard(),
            OrderItemCard(),
            OrderItemCard(),
            OrderItemCard(),
            OrderItemCard(),
          ],
        ),
      ),
    );
  }
}

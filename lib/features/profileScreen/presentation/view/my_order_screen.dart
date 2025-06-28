import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskapp/core/utils/k_colors.dart';
import 'package:taskapp/features/profileScreen/presentation/view/widgets/order_items.dart';
import 'package:taskapp/Controller/order.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderController orderController = Get.put(OrderController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Oreder",
          style: TextStyle(color: salmonColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (orderController.orders.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(color: salmonColor),
                SizedBox(height: 16),
                Text(
                  "Loading orders...",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          itemCount: orderController.orders.length,
          itemBuilder: (context, index) {
            final order = orderController.orders[index];
            return OrderItemCard(order: order);
          },
        );
      }),
    );
  }
}
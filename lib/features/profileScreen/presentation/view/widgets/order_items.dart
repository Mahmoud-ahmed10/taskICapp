import 'package:flutter/material.dart';
import 'package:taskapp/core/utils/k_colors.dart';
import 'package:taskapp/features/profileScreen/data/model/order.dart';

class OrderItemCard extends StatelessWidget {
  final OrderModel order;

  const OrderItemCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Order: ${order.orderStatus}",
                  style: TextStyle(color: Colors.grey[700])),
              Text(order.orderDate??"",style: TextStyle(color: Colors.grey[700])),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(
            color: salmonColor,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  order.itemImage??"",
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/logo.jpg',
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            order.itemName??"",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: terracottaColor,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.delete_outline,
                                    size: 20, color: salmonColor)),
                            const SizedBox(width: 8),
                            Icon(Icons.add_circle_outline,
                                size: 20, color: salmonColor),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "In a laoreet purus. Integer turpis quam, laoreet id orci nec, ultrices...",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$${order.price}",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("${order.quantity}x uds.",
                            style: TextStyle(color: Colors.grey[700])),
                        Text("Total: \$${order.total}",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

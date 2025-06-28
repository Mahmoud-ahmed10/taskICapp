import 'package:flutter/material.dart';
import 'package:taskapp/core/utils/k_colors.dart';

class OrderItemCard extends StatelessWidget {
  const OrderItemCard({super.key});

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
              Text("Order: Delivered",
                  style: TextStyle(color: Colors.grey[700])),
              Text("May 15", style: TextStyle(color: Colors.grey[700])),
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
                child: Image.asset(
                  'assets/logo.jpg',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
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
                            "Serenity Nightstand",
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
                        Text("\$7.50",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("1x uds.",
                            style: TextStyle(color: Colors.grey[700])),
                        Text("Total: \$7.50",
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

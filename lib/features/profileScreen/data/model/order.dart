class OrderModel {
  final String orderStatus;
  final String orderDate;
  final String itemName;
  final String itemImage;
  final double price;
  final int quantity;
  final double total;

  OrderModel({
    required this.orderStatus,
    required this.orderDate,
    required this.itemName,
    required this.itemImage,
    required this.price,
    required this.quantity,
    required this.total,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        orderStatus: json['orderStatus'],
        orderDate: json['orderDate'],
        itemName: json['itemName'],
        itemImage: json['itemImage'],
        price: json['price'],
        quantity: json['quantity'],
        total: json['total'],
      );

  Map<String, dynamic> toJson() => {
        "orderStatus": orderStatus,
        "orderDate": orderDate,
        "itemName": itemName,
        "itemImage": itemImage,
        "price": price,
        "quantity": quantity,
        "total": total,
      };
}

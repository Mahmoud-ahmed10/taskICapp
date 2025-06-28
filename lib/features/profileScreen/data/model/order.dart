class OrderModel {
  final String? orderStatus;
  final String? orderDate;
  final String? itemName;
  final String? itemImage;
  final String? price;
  final String? quantity;
  final String? total;

  OrderModel({
    this.orderStatus,
    this.orderDate,
    this.itemName,
    this.itemImage,
    this.price,
    this.quantity,
    this.total,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    orderStatus: json['orderStatus']?.toString(),
    orderDate: json['orderDate']?.toString(),
    itemName: json['itemName']?.toString(),
    itemImage: json['itemImage']?.toString(),
    price: json['price']?.toString(),
    quantity: json['quantity']?.toString(),
    total: json['total']?.toString(),
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

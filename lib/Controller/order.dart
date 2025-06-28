import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taskapp/features/profileScreen/data/model/order.dart';

class OrderController extends GetxController {
  final box = GetStorage();
  RxList<OrderModel> orders = <OrderModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAndStoreOrders(); // جلب البيانات عند بدء الصفحة
  }

  Future<void> fetchAndStoreOrders() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('orders').get();

      List<OrderModel> fetchedOrders =
          snapshot.docs.map((doc) => OrderModel.fromJson(doc.data())).toList();

      box.write('local_orders', fetchedOrders.map((e) => e.toJson()).toList());

      orders.assignAll(fetchedOrders);
    } catch (e) {
      // لو فيه بيانات محفوظة محليًا
      final localData = box.read('local_orders') ?? [];
      orders.assignAll(
          List<OrderModel>.from(localData.map((e) => OrderModel.fromJson(e))));
    }
  }
}

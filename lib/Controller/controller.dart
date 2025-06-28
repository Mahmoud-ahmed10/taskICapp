import 'package:get/get.dart';

class GenderController extends GetxController {
  var selectedGender = ''.obs;

  void setGender(String gender) {
    selectedGender.value = gender;
  }
}

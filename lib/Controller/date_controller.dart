import 'package:get/get.dart';

class DatePickerController extends GetxController {
  var selectedDate = Rxn<DateTime>(); // Rxn يعني nullable date

  void setDate(DateTime date) {
    selectedDate.value = date;
  }

  String get formattedDate {
    final date = selectedDate.value;
    if (date == null) return 'Select your date of birth';
    return '${date.day.toString().padLeft(2, '0')} / '
        '${date.month.toString().padLeft(2, '0')} / '
        '${date.year}';
  }
}

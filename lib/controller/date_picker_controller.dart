

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DatePickerController extends GetxController {
  // Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);

  String get formattedDate {
    if (selectedDate.value == null) {
      return '';
    } else {
      return DateFormat('dd-MM-yyyy').format(selectedDate.value!);
    }
  }
}
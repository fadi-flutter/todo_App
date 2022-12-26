import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddTodoController extends GetxController {
  RxString time = ''.obs;
  RxBool timeCollected = false.obs;
  RxString date = ''.obs;
  RxBool dateCollected = false.obs;
  RxBool personal = true.obs;
  RxBool team = false.obs;

  void collectTime(BuildContext context) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      timeCollected.value = true;
      time.value = value.format(context);
    });
  }

  void collectdate(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime(2029))
        .then(
      (value) {
        if (value == null) {
          return;
        }
        DateFormat dateFormat = DateFormat('dd/MM/yy');
        date.value = dateFormat.format(value);
        dateCollected.value = true;
      },
    );
  }
}

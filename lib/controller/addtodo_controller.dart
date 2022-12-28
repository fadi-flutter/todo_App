
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ui_flutter/const.dart';

class AddTodoController extends GetxController {
  var todoitleC = TextEditingController();
  var todoDescriptionC = TextEditingController();
  var formKey = GlobalKey<FormState>();
  RxString time = ''.obs;
  RxBool timeCollected = false.obs;
  RxString date = ''.obs;
  RxBool dateCollected = false.obs;
  RxBool personal = true.obs;
  RxBool team = false.obs;
  RxBool pending = false.obs;
  RxString currentdocID = ''.obs;
  RxBool titleValidate = false.obs;
  RxBool descriptionValidate = false.obs;
  var isLoading = false.obs;

  addTodo() async {
    isLoading(true);
    await firebaseFirestore
        .collection(collectionUsers)
        .doc(user!.uid)
        .collection(collectionTodos)
        .add({
      'createdAt': DateTime.now(),
      'taskTitle': todoitleC.text,
      'description': todoDescriptionC.text,
      'personal': personal.toString(),
      'team': team.toString(),
      'taskDate': date.value,
      'pending': 'false',
      'taskTime': time.value,
      'userID': user!.uid,
      'userName': user!.displayName,
    }).then((value) {
      currentdocID.value = value.id;
      todoDescriptionC.clear();
      todoitleC.clear();
    });
    isLoading(false);
  }

  getTodo() {
    if (user != null) {
      return firebaseFirestore
          .collection(collectionUsers)
          .doc(user!.uid)
          .collection(collectionTodos)
          .where('pending', isEqualTo: 'false')
          .snapshots();
    }
  }

  updateTodo(doc) {
    firebaseFirestore
        .collection(collectionUsers)
        .doc(user!.uid)
        .collection(collectionTodos)
        .doc(doc.id)
        .update({'pending': pending.value.toString()});
  }

  againUpdateTodo(doc) {
    firebaseFirestore
        .collection(collectionUsers)
        .doc(user!.uid)
        .collection(collectionTodos)
        .doc(doc.id)
        .update({'pending': pending.value.toString()});
  }

  completeTodo() {
    return firebaseFirestore
        .collection(collectionUsers)
        .doc(user!.uid)
        .collection(collectionTodos)
        .where('pending', isEqualTo: 'true')
        .snapshots();
  }

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

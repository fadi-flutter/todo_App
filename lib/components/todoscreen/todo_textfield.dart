import 'package:flutter/material.dart';
import 'package:ui_flutter/controller/addtodo_controller.dart';

import '../../const.dart';

Widget todotextField(context,
    {String labeltext = 'Add Task...',
    required double height,
    required TextEditingController controller,
    required AddTodoController addTodoController,
    required String? Function(String?)? validator,
    int maxlines = 1}) {
  double sizeh = MediaQuery.of(context).size.height;
  return SizedBox(
    height: height,
    child: TextFormField(
      validator: validator,
      controller: controller,
      maxLines: maxlines,
      decoration: InputDecoration(
        filled: true,
        fillColor: todopageBg,
        hintText: labeltext,
        hintStyle: TextStyle(color: grey, fontSize: sizeh * 0.025),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(style: BorderStyle.solid, color: white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              style: BorderStyle.solid, color: purplemedium, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}

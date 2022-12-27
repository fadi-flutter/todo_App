import 'package:flutter/material.dart';

import '../../const.dart';

Widget todotextField(context,
    {String labeltext = 'Add Task...',
    required double height,
    required TextEditingController controller,
    int maxlines = 1}) {
  double sizew = MediaQuery.of(context).size.width;
  double sizeh = MediaQuery.of(context).size.height;
  return Padding(
    padding: EdgeInsets.only(top: sizeh * 0.01),
    child: Container(
      decoration: BoxDecoration(
          color: todopageBg, borderRadius: BorderRadius.circular(10)),
      width: sizew * 0.82,
      height: height,
      child: TextField(
        controller: controller,
        maxLines: maxlines,
        decoration: InputDecoration(
          hintText: labeltext,
          hintStyle: TextStyle(color: grey, fontSize: sizeh * 0.025),
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(style: BorderStyle.solid, color: white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                style: BorderStyle.solid, color: purplemedium, width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    ),
  );
}

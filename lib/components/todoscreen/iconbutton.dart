import 'package:flutter/material.dart';
import '../../const.dart';

Widget appbarIcons(context, {IconData icon = Icons.calendar_month}) {
  double sizew = MediaQuery.of(context).size.width;
  double sizeh = MediaQuery.of(context).size.height;
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: sizew * 0.01),
    child: Container(
      height: sizeh * 0.10,
      width: sizew * 0.10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: todopageBg,
        border: Border.all(
          color: grey,
          width: 1,
        ),
      ),
      child: Icon(
        icon,
        color: purple,
      ),
    ),
  );
}

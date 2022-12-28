import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ui_flutter/controller/addtodo_controller.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../const.dart';
import 'iconbutton.dart';

Widget smallcardWidget(
    {context,
    required int index,
    required DocumentSnapshot doc,
    required AddTodoController addTodoController}) {
  double sizew = MediaQuery.of(context).size.width;
  double sizeh = MediaQuery.of(context).size.height;
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            height: sizeh * 0.16,
            width: sizew * 0.778,
            decoration: BoxDecoration(
              color: index.isEven ? purple : grey,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: sizeh * 0.01),
            height: sizeh * 0.17,
            width: sizew * 0.76,
            decoration: const BoxDecoration(
              color: white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          doc['taskTitle']
                              .toString()
                              .text
                              .uppercase
                              .ellipsis
                              .size(sizeh * 0.024)
                              .bold
                              .lineThrough
                              .make(),
                          3.heightBox,
                          doc['description']
                              .toString()
                              .text
                              .ellipsis
                              .size(sizeh * 0.018)
                              .color(grey)
                              .make(),
                        ],
                      ),
                    ),
                    appbarIcons(
                        context,
                        icon:  Icons.check,
                        onPressed: () {
                          addTodoController.pending(false);
                          addTodoController.againUpdateTodo(doc);
                        },
                      )
                  ],
                ),
                const Divider(
                  color: grey,
                  height: 2,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: sizeh * 0.02),
                  child: '${doc['taskTime']}, ${doc['taskDate']}'
                      .text
                      .size(sizeh * 0.019)
                      .color(purple)
                      .make(),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ui_flutter/controller/addtodo_controller.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../const.dart';

class Todocard extends StatelessWidget {
  const Todocard(
      {super.key,
      required this.index,
      required this.doc,
      required this.addTodoController});
  final int index;
  final DocumentSnapshot doc;
  final AddTodoController addTodoController;
  

  @override
  Widget build(BuildContext context) {
    double sizew = MediaQuery.of(context).size.width;
    double sizeh = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: sizeh * 0.008),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: sizeh * 0.34,
            width: sizew * 0.77,
            decoration: BoxDecoration(
              color: index.isEven ? purple : grey,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: null,
          ),
          Container(
            height: sizeh * 0.33,
            width: sizew * 0.79,
            decoration: const BoxDecoration(
              color: white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(top: sizeh * 0.010),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                doc['taskTitle']
                                    .toString()
                                    .text
                                    .size(sizeh * 0.023)
                                    .bold
                                    .uppercase
                                    .maxLines(1)
                                    .ellipsis
                                    .overflow(TextOverflow.fade)
                                    .make(),
                                2.heightBox,
                                '${doc['taskTime']}, ${doc['taskDate']}'
                                    .text
                                    .color(purple)
                                    .size(sizeh * 0.017)
                                    .make()
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: sizeh * 0.011),
                          child: CircleAvatar(
                            radius: sizeh * 0.033,
                            backgroundColor: todopageBg,
                            child: Icon(
                              doc['team'] == 'true' ? Icons.group : Icons.man,
                              size: sizeh * 0.033,
                              color: purple,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    color: grey,
                    height: 2,
                  ),
                  SizedBox(
                    height: sizeh * 0.014,
                  ),
                  Flexible(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        'Description :'
                            .text
                            .size(sizeh * 0.025)
                            .color(purple)
                            .bold
                            .make(),
                        SizedBox(
                          height: sizeh * 0.01,
                        ),
                        doc['description']
                            .toString()
                            .text
                            .ellipsis
                            .size(sizeh * 0.018)
                            .maxLines(3)
                            .make(),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        doc['team'] == 'true'
                            ? 'Team Task'
                                .text
                                .color(purple)
                                .size(sizeh * 0.025)
                                .bold
                                .make()
                            : 'Personal Task'
                                .text
                                .color(purple)
                                .size(sizeh * 0.025)
                                .bold
                                .make(),
                        Checkbox(
                            value: doc['pending'] == 'true' ? true : false,
                            onChanged: ((value) {
                              addTodoController.pending(value);
                              addTodoController.updateTodo(doc);
                            })),
                        Row(
                          children: [
                            'Status : '
                                .text
                                .color(purple)
                                .size(sizeh * 0.025)
                                .bold
                                .make(),
                            2.heightBox,
                            doc['pending'] == 'false'
                                ? 'Pending'.text.size(sizeh * 0.02).make()
                                : 'Completed'.text.size(sizeh * 0.02).make()
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

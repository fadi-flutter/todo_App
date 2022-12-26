import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../const.dart';

class Todocard extends StatelessWidget {
  const Todocard({super.key, required this.index});
  final int index;

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
                                'Design UI ToDo App'
                                    .text
                                    .size(sizeh * 0.023)
                                    .bold
                                    .maxLines(1)
                                    .ellipsis
                                    .overflow(TextOverflow.fade)
                                    .make(),
                                2.heightBox,
                                'Friday, 17 Dec 2022'
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
                              Icons.group,
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
                            .size(sizeh * 0.019)
                            .color(purple)
                            .bold
                            .make(),
                        SizedBox(
                          height: sizeh * 0.01,
                        ),
                        'This isen you nebase and changn nebase and cha n you nebase and cha n you nebase and chae the description there.....'
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
                    child: Column(
                      children: [
                        'Progress :'
                            .text
                            .color(purple)
                            .size(sizeh * 0.02)
                            .bold
                            .make(),
                        2.heightBox,
                        '47%'.text.size(sizeh * 0.02).make()
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

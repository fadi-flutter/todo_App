import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_flutter/controller/addtodo_controller.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../const.dart';

// ignore: must_be_immutable
class TeamOrPersonal extends StatelessWidget {
  var addTodoController = Get.find<AddTodoController>();

  TeamOrPersonal({super.key});
  @override
  Widget build(BuildContext context) {
    double sizew = MediaQuery.of(context).size.width;
    double sizeh = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: sizeh * 0.01),
      child: Container(
        padding: const EdgeInsets.all(11),
        height: sizeh * 0.09,
        width: sizew * 0.82,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: todopageBg,
        ),
        child: GetX<AddTodoController>(builder: (controller) {
          return Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    controller.personal.value = true;
                    controller.team.value = false;
                  },
                  child: Container(
                    height: sizeh * 0.06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: controller.personal.value ? purple : white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.person,
                          color: controller.personal.value ? white : purple,
                          size: sizeh * 0.04,
                        ),
                        'Personal'
                            .text
                            .size(sizeh * 0.025)
                            .bold
                            .color(controller.personal.value ? white : purple)
                            .make()
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: sizew * 0.03,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                     controller.personal.value = false;
                    controller.team.value = true;
                  },
                  child: Container(
                    height: sizeh * 0.06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: controller.team.value ? purple : white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.group,
                          color: controller.team.value ? white : purple,
                          size: sizeh * 0.04,
                        ),
                        'Team'
                            .text
                            .size(sizeh * 0.025)
                            .bold
                            .color(controller.team.value ? white : purple)
                            .make()
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

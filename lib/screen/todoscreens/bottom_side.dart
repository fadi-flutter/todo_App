import 'package:flutter/material.dart';
import 'package:ui_flutter/const.dart';
import 'package:ui_flutter/controller/addtodo_controller.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../components/todoscreen/teamorpersonal.dart';
import '../../components/todoscreen/todo_textfield.dart';
import 'package:get/get.dart';

class Bottomside extends StatelessWidget {
  var addtodoController = Get.put(AddTodoController());
  @override
  Widget build(BuildContext context) {
    double sizew = MediaQuery.of(context).size.width;
    double sizeh = MediaQuery.of(context).size.height;
    return SizedBox(
      height: sizeh * 0.7,
      child: Container(
        height: sizeh * 0.6,
        color: const Color(0xFF6F7071),
        child: Container(
          height: sizeh * 0.6,
          decoration: const BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: sizew * 0.09, vertical: sizeh * 0.02),
            child: SingleChildScrollView(
              child: GetX<AddTodoController>(builder: (controller) {
                return Column(
                  children: [
                    'New Task ToDo'.text.size(sizeh * 0.03).bold.make(),
                    SizedBox(
                      height: sizeh * 0.02,
                    ),
                    const Divider(
                      height: 2,
                      color: grey,
                    ),
                    //this is titltask title
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: sizeh * 0.005),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          'Task Title :'
                              .text
                              .size(sizeh * 0.025)
                              .fontWeight(FontWeight.w600)
                              .make(),
                          todotextField(context, height: sizeh * 0.06),
                        ],
                      ),
                    ),
                    //this is category
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: sizeh * 0.005),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          'Category :'
                              .text
                              .size(sizeh * 0.025)
                              .fontWeight(FontWeight.w600)
                              .make(),
                          const TeamOrPersonal()
                        ],
                      ),
                    ),
                    //this is description
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: sizeh * 0.005),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          'Description :'
                              .text
                              .size(sizeh * 0.025)
                              .fontWeight(FontWeight.w600)
                              .make(),
                          todotextField(context,
                              labeltext: 'Add Description',
                              height: sizeh * 0.10,
                              maxlines: 4)
                        ],
                      ),
                    ),
                    //this is date
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: sizeh * 0.005),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              'Date :'
                                  .text
                                  .size(sizeh * 0.022)
                                  .fontWeight(FontWeight.w600)
                                  .make(),
                              InkWell(
                                onTap: () {
                                  controller.collectdate(context);
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(top: sizeh * 0.01),
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    height: sizeh * 0.065,
                                    width: sizew * 0.38,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: todopageBg),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Icon(
                                          Icons.calendar_month,
                                          color: grey,
                                        ),
                                        Text(
                                          controller.dateCollected.value
                                              ? controller.date.value
                                              : 'dd/mm/yy',
                                          style: TextStyle(
                                            color: grey,
                                            fontSize: sizeh * 0.02,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              'Time :'
                                  .text
                                  .size(sizeh * 0.025)
                                  .fontWeight(FontWeight.w600)
                                  .make(),
                              InkWell(
                                onTap: () {
                                  controller.collectTime(context);
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(top: sizeh * 0.01),
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    height: sizeh * 0.065,
                                    width: sizew * 0.38,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: todopageBg),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Icon(
                                          Icons.watch,
                                          color: grey,
                                        ),
                                        Text(
                                          controller.timeCollected.value
                                              ? controller.time.value
                                              : 'hh:mm',
                                          style: TextStyle(
                                            color: grey,
                                            fontSize: sizeh * 0.02,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    //this is submit
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MaterialButton(
                          elevation: 0,
                          height: sizeh * 0.07,
                          minWidth: sizew * 0.28,
                          shape: RoundedRectangleBorder(
                            side:
                                const BorderSide(color: purplemedium, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onPressed: () {},
                          child: 'Cancel'.text.make(),
                        ),
                        MaterialButton(
                          elevation: 0,
                          height: sizeh * 0.07,
                          minWidth: sizew * 0.28,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: purple,
                          onPressed: () {},
                          child: 'Add'.text.white.make(),
                        ),
                      ],
                    )
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

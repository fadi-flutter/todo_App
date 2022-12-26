import 'package:flutter/material.dart';
import 'package:ui_flutter/components/todoscreen/small_card.dart';
import 'package:ui_flutter/components/todoscreen/todo_card.dart';
import 'package:ui_flutter/const.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../components/todoscreen/iconbutton.dart';
import 'package:card_swiper/card_swiper.dart';
import 'bottom_side.dart';

class TodolistScreen extends StatelessWidget {
  const TodolistScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double sizew = MediaQuery.of(context).size.width;
    double sizeh = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: todopageBg,
      //this is bootom screen
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) =>  Bottomside());
        },
        backgroundColor: white,
        child: const Icon(
          Icons.add,
          color: purple,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            //This is appbar
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: sizew * 0.02, vertical: sizeh * 0.003),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: sizeh * 0.010),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: sizeh * 0.007, left: sizew * 0.02),
                          child: CircleAvatar(
                            radius: sizeh * 0.037,
                            backgroundColor: black,
                            backgroundImage: const AssetImage(userImage),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: sizew * 0.025),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hello,',
                                style: TextStyle(
                                    color: grey, fontSize: sizeh * 0.02),
                              ),
                              Text(
                                'Fahad Ali',
                                style: TextStyle(
                                    color: black,
                                    fontSize: sizeh * 0.023,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        appbarIcons(context),
                        appbarIcons(
                          context,
                          icon: Icons.notifications,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            //This is On progress
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: sizew * 0.033, vertical: sizeh * 0.024),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        'On Progress'.text.size(sizeh * 0.024).semiBold.make(),
                        4.widthBox,
                        '(12)'.text.color(grey).size(sizeh * 0.022).make(),
                      ],
                    ),
                  ),
                  'View more'.text.color(purple).scale(sizeh * 0.0014).make()
                ],
              ),
            ),
            //This is todo's
            Flexible(
              flex: 4,
              child: Swiper(
                pagination: const SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                      color: white, activeColor: purple),
                ),
                itemCount: 4,
                itemBuilder: ((context, index) {
                  return Todocard(
                    index: index,
                  );
                }),
              ),
            ),
            //This is completed line
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: sizew * 0.033, vertical: sizeh * 0.010),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        'Completed'.text.size(sizeh * 0.024).semiBold.make(),
                      ],
                    ),
                  ),
                  'View more'.text.color(purple).scale(sizeh * 0.0014).make()
                ],
              ),
            ),
            //This is completed todo's
            Expanded(
              flex: 3,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: ((context, index) {
                  return smallcardWidget(context: context, index: index);
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

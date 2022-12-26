import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../const.dart';

class TeamOrPersonal extends StatefulWidget {
  const TeamOrPersonal({super.key});

  @override
  State<TeamOrPersonal> createState() => _TeamOrPersonalState();
}

class _TeamOrPersonalState extends State<TeamOrPersonal> {
  bool personal = true;
  bool team = false;

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
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    personal = true;
                    team = false;
                  });
                },
                child: Container(
                  height: sizeh * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: personal ? purple : white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.person,
                        color: personal ? white : purple,
                        size: sizeh * 0.04,
                      ),
                      'Personal'
                          .text
                          .size(sizeh * 0.025)
                          .bold
                          .color(personal ? white : purple)
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
                  setState(() {
                    personal = false;
                    team = true;
                  });
                },
                child: Container(
                  height: sizeh * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: team ? purple : white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.group,
                        color: team ? white : purple,
                        size: sizeh * 0.04,
                      ),
                      'Team'
                          .text
                          .size(sizeh * 0.025)
                          .bold
                          .color(team ? white : purple)
                          .make()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

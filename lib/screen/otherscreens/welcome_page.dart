import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_flutter/screen/otherscreens/signin_screen.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:ui_flutter/const.dart';

class WelcomePage extends StatelessWidget {
  static const id = 'WelcomePage';
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double sizew = MediaQuery.of(context).size.width;
    double sizeh = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(0.9, -0.7),
              radius: 0.3,
              focalRadius: 10,
              colors: [white, purple],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: sizeh * 0.01,
              ),
              'Jobsly'.text.size(sizew * 0.15).semiBold.white.make(),
              Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Container(
                      height: sizeh * 0.72,
                      width: sizew * 0.90,
                      decoration: const BoxDecoration(
                          color: purplelight,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: null),
                  Container(
                    padding: EdgeInsets.all(sizeh * 0.02),
                    height: sizeh * 0.70,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/signin.png',
                          height: sizeh * 0.40,
                        ),
                        'Jobsly Interprise'
                            .text
                            .color(purplemedium)
                            .semiBold
                            .center
                            .size(sizew * 0.04)
                            .make(),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: sizew * 0.09),
                          child: 'Transformative collaboration for larger teams'
                              .text
                              .size(sizew * 0.068)
                              .semiBold
                              .center
                              .maxLines(2)
                              .make(),
                        ),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          height: sizeh * 0.07,
                          minWidth: sizew * 0.82,
                          elevation: 0,
                          color: purplelight,
                          onPressed: () {
                            Get.to(() => SigninScreen());
                          },
                          child: 'Get Started'
                              .text
                              .color(purple)
                              .size(sizew * 0.042)
                              .semiBold
                              .make(),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

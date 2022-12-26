import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_flutter/screen/otherscreens/signin_screen.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../components/materialbutton.dart';
import '../../components/textfield.dart';
import '../../const.dart';
import '../../controller/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  static const id = 'LoginScreen';
  LoginScreen({super.key});
  var authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    double sizew = MediaQuery.of(context).size.width;
    double sizeh = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: GetX<AuthController>(builder: (controller) {
          return controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
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
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const BackButton(
                              color: white,
                            ),
                            "Don't have an account ?"
                                .text
                                .maxLines(1)
                                .white
                                .size(sizew * 0.045)
                                .make(),
                            MaterialButton(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: purplemedium,
                              onPressed: () {
                                Get.to(() => SigninScreen());
                              },
                              child: 'Get Started'
                                  .text
                                  .center
                                  .white
                                  .size(sizeh * 0.01)
                                  .make(),
                            ),
                          ],
                        ),
                        'Jobsly'.text.size(sizew * 0.14).semiBold.white.make(),
                        Padding(
                          padding: EdgeInsets.only(top: sizeh * 0.07),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              Container(
                                  height: sizeh * 0.74,
                                  width: sizew * 0.90,
                                  decoration: const BoxDecoration(
                                      color: purplelight,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20))),
                                  child: null),
                              Container(
                                height: sizeh * 0.72,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20))),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: sizeh * 0.01),
                                      child: Column(
                                        children: [
                                          'Welcome Back'
                                              .text
                                              .center
                                              .bold
                                              .size(sizew * 0.08)
                                              .make(),
                                          SizedBox(
                                            height: sizeh * 0.015,
                                          ),
                                          'Enter your details below'
                                              .text
                                              .center
                                              .color(purplemedium)
                                              .size(sizew * 0.05)
                                              .make(),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        TextfieldWidget(
                                          controller:
                                              authController.emailClogin,
                                          icon: const Icon(Icons.email),
                                        ),
                                        Obx(
                                          (() {
                                            return TextfieldWidget(
                                              controller:
                                                  controller.passwordClogin,
                                              obscureText: controller
                                                      .ispasswordVisible.value
                                                  ? false
                                                  : true,
                                              icon: controller
                                                      .ispasswordVisible.value
                                                  ? const Icon(
                                                      Icons
                                                          .remove_red_eye_sharp,
                                                      color: black,
                                                    )
                                                  : const Icon(
                                                      Icons.remove_red_eye),
                                              labelText: 'Password',
                                              iconOnTap: () {
                                                controller.passwordVisible();
                                              },
                                            );
                                          }),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        MaterialButtonWidget(
                                          text: 'Log in',
                                          onTap: () {
                                            authController
                                                .loginUserWithEmail(context);
                                          },
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: sizeh * 0.01),
                                          child: 'Forget your password ?'
                                              .text
                                              .size(sizew * 0.04)
                                              .color(purplemedium)
                                              .bold
                                              .make(),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: sizew * 0.096,
                                              vertical: sizeh * 0.02),
                                          child: Row(
                                            children: [
                                              const Expanded(
                                                child: Divider(
                                                  color: purple,
                                                ),
                                              ),
                                              'Or sign in with'
                                                  .text
                                                  .color(purplelight)
                                                  .bold
                                                  .make(),
                                              const Expanded(
                                                child: Divider(
                                                  color: purple,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SmallMaterialButton(
                                              text: 'Google'.text.make(),
                                              imageheight: sizeh * 0.05,
                                              imagewidth: sizew * 0.06, onpressed: () { 
                                                controller.signInWithGoogle(context);
                                               },
                                            ),
                                            SmallMaterialButton(
                                              text: 'Facebook'
                                                  .text
                                                  .color(blue)
                                                  .make(),
                                              networkImage: facebookImage,
                                              imageheight: sizeh * 0.07,
                                              imagewidth: sizew * 0.08, onpressed: () { 
                                                controller.loginwithfacebook(context);
                                               },
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
        }),
      ),
    );
  }
}

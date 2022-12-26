import 'package:flutter/material.dart';
import 'package:ui_flutter/components/materialbutton.dart';
import 'package:ui_flutter/components/textfield.dart';
import 'package:ui_flutter/screen/otherscreens/login_screen.dart';
import 'package:ui_flutter/screen/todoscreens/todolist_screen.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'package:ui_flutter/controller/auth_controller.dart';
import '../../const.dart';

class SigninScreen extends StatelessWidget {
  static const id = 'SigninScreen';
  SigninScreen({super.key});
  var authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    double sizew = MediaQuery.of(context).size.width;
    double sizeh = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: GetX<AuthController>(
          builder: (controller) {
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
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const BackButton(
                                color: white,
                              ),
                              'Already have an account ?'
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
                                  Get.to(() => LoginScreen());
                                },
                                child:
                                    'Sign in'.text.center.white.size(17).make(),
                              ),
                            ],
                          ),
                          'Jobsly'
                              .text
                              .size(sizeh * 0.07)
                              .semiBold
                              .white
                              .make(),
                          Padding(
                            padding: EdgeInsets.only(top: sizeh * 0.07),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
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
                                  padding: EdgeInsets.symmetric(
                                      vertical: sizeh * 0.02),
                                  height: sizeh * 0.72,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20))),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          'Get started free.'
                                              .text
                                              .center
                                              .bold
                                              .size(sizeh * 0.045)
                                              .make(),
                                          SizedBox(
                                            height: sizeh * 0.010,
                                          ),
                                          'Free forever. No credit card needed.'
                                              .text
                                              .center
                                              .color(purplemedium)
                                              .size(sizeh * 0.03)
                                              .make(),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          TextfieldWidget(
                                            controller:
                                                controller.usernameCsign,
                                            icon: const Icon(Icons.account_box),
                                          ),
                                          TextfieldWidget(
                                            controller: controller.emailCsign,
                                            labelText: 'Email Address',
                                            icon: const Icon(Icons.email),
                                          ),
                                          TextfieldWidget(
                                            controller:
                                                controller.passwordCsign,
                                            obscureText: controller
                                                    .ispasswordVisible.value
                                                ? false
                                                : true,
                                            icon: controller
                                                    .ispasswordVisible.value
                                                ? const Icon(
                                                    Icons.remove_red_eye_sharp,
                                                    color: black,
                                                  )
                                                : const Icon(
                                                    Icons.remove_red_eye),
                                            labelText: 'Password',
                                            iconOnTap: () {
                                              controller.passwordVisible();
                                            },
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          MaterialButtonWidget(
                                            onTap: () async {
                                              await controller
                                                  .createUserWithEmail();
                                            },
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: sizew * 0.096),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: sizeh * 0.02),
                                              child: Row(
                                                children: [
                                                  const Expanded(
                                                    child: Divider(
                                                      color: purple,
                                                    ),
                                                  ),
                                                  'Or sign up with'
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
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              SmallMaterialButton(
                                                text: 'Google'.text.make(),
                                                imageheight: sizeh * 0.05,
                                                imagewidth: sizew * 0.06,
                                                onpressed: () {
                                                  controller.signInWithGoogle(
                                                      context);
                                                },
                                              ),
                                              SmallMaterialButton(
                                                text: 'Facebook'
                                                    .text
                                                    .color(blue)
                                                    .make(),
                                                networkImage: facebookImage,
                                                imageheight: sizeh * 0.07,
                                                imagewidth: sizew * 0.08,
                                                onpressed: () {},
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
          },
        ),
      ),
    );
  }
}

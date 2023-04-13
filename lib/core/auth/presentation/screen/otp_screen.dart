import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:math' as math;

import 'package:pocket_planner/core/auth/presentation/logic/auth_controller.dart';
import 'package:pocket_planner/widget/custom_loading.dart';

import '../../../../widget/custom_card_blur.dart';
import '../../../service_locator/service_locator.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    return Stack(
      children: [
        Scaffold(
          body: CustomCardBlur(
            // colors: [
            //   Colors.grey.shade200,
            //   Colors.blueGrey.shade50,
            //   Colors.grey.shade100,
            //   Colors.grey.shade200,
            //   Colors.blueGrey.shade100,
            // ],
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.15,
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Register",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(255, 99, 16, 114),
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontSize: 30),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 60),
                        child: Text(
                          "with US",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromARGB(255, 99, 16, 114),
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 45),
                        child: AnimatedBuilder(
                            animation: authController.animatedController!,
                            builder: (context, child) {
                              return authController
                                      .animatedController!.isAnimating
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          left: 150.0, right: 150.0, top: 20.0),
                                      child: Align(
                                        alignment: FractionalOffset.center,
                                        child: AspectRatio(
                                          aspectRatio: 1.0,
                                          child: CustomPaint(
                                            painter: CustomTimerPainter(
                                              animation: authController
                                                  .animatedController,
                                              backgroundColor: Colors.white,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            child: Center(
                                              child: Text(
                                                authController.timerString,
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Theme.of(context)
                                                        .primaryColor),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink();
                            }),
                      ),
                      const Text(
                        "Verify Phone Number",
                        style: TextStyle(
                          fontFamily: 'dmsans_medium',
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Code is send to +855${getIt<AuthController>().phoneController.value.text.replaceAll(RegExp(r'^0+(?=.)'), '')}",
                        style: const TextStyle(
                          fontFamily: 'dmsans_medium',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Form(
                        key: authController.formKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: PinCodeTextField(
                            errorAnimationController:
                                authController.errorAnimationController,
                            controller:
                                authController.verifyOtpController.value,
                            appContext: context,
                            pastedTextStyle: TextStyle(
                              color: Colors.green.shade600,
                              fontWeight: FontWeight.bold,
                            ),
                            length: 4,
                            obscureText: true,
                            // obscuringCharacter: '*',
                            // obscuringWidget: FlutterLogo(
                            //   size: 24,
                            // ),
                            // blinkWhenObscuring: true,
                            animationType: AnimationType.fade,
                            // validator: (v) {
                            //   if (v!.length < 3) {
                            //     return "I'm from validator";
                            //   } else {
                            //     return null;
                            //   }
                            // },

                            autoFocus: true,
                            pinTheme: PinTheme(
                              activeColor: Colors.white,
                              selectedColor: Colors.green.shade500,
                              selectedFillColor: Colors.white,
                              inactiveFillColor: Colors.white,
                              inactiveColor: Colors.white,
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(10),
                              errorBorderColor: Colors.red.withOpacity(0.6),
                              fieldHeight: 46,
                              fieldWidth: 46,
                              activeFillColor: Colors.white,
                            ),
                            cursorColor: Colors.black,
                            animationDuration:
                                const Duration(milliseconds: 300),
                            enableActiveFill: true,
                            // errorAnimationController: errorController,
                            // controller: textEditingController,
                            keyboardType: TextInputType.number,
                            boxShadows: const [
                              BoxShadow(
                                offset: Offset(0, 1),
                                color: Colors.black12,
                                blurRadius: 10,
                              )
                            ],
                            onCompleted: (code) {
                              authController.fucntionVerifyOtp(context,
                                  code: code,
                                  phone: getIt<AuthController>()
                                      .phoneController
                                      .value
                                      .text, funcWhenSuccess: () {
                                context.go("/create-password");
                                // debugPrint("successfully");
                              });
                              authController.update();
                            },

                            onChanged: (value) {},
                            beforeTextPaste: (text) {
                              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                              //but you can show anything you want here, like your pop up saying wrong paste format or etc
                              return true;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don’t receive code? ',
                            style: TextStyle(
                                color: Color(0xff464646),
                                fontFamily: 'dmsans_medium',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                letterSpacing: 0.5),
                          ),
                          AnimatedBuilder(
                              animation: authController.animatedController!,
                              builder: (context, child) {
                                return GestureDetector(
                                  onTap: authController
                                          .animatedController!.isAnimating
                                      ? null
                                      : () {
                                          authController.animatedController!
                                              .reverse(
                                                  from: authController
                                                      .animatedController!
                                                      .value = 1.0);
                                          // authController.fucntionRequesOtp(context);
                                        },
                                  child: Text(
                                    ' Request Again',
                                    style: TextStyle(
                                        color: authController
                                                .animatedController!.isAnimating
                                            ? Colors.grey
                                            : const Color.fromARGB(
                                                255, 99, 16, 114),
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold),
                                  ),
                                );
                              })
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (getIt<AuthController>().isLoading.value) const CustomLoading()
      ],
    );
  }
}

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double>? animation;
  final Color? backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor!
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color!;
    double progress = (1.0 - animation!.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(CustomTimerPainter oldDelegate) {
    return animation!.value != oldDelegate.animation!.value ||
        color != oldDelegate.color ||
        backgroundColor != oldDelegate.backgroundColor;
  }
}

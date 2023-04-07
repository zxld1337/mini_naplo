// ignore_for_file: prefer_const_constructors
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// components
import 'package:glass_ui/routes/app_pages.dart';
import '../../controllers/frame_controller.dart';
import '../../utils/view_const.dart';
import 'components/custom_navbar.dart';


class MainFrame extends StatelessWidget {
  MainFrame({super.key});

  final frameController = Get.find<FrameController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: constBgColor,
      body: Scaffold(
        backgroundColor: constBgColor,
        body: Obx(
          () => PageTransitionSwitcher(
            transitionBuilder: (child, animation, secondaryAnimation) {
              return FadeThroughTransition(
                fillColor: constBgColor,
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              );
            },
            
            duration: const Duration(milliseconds: 300),
            child: AppPages.getPage(frameController.currentPageRoute),
          ),
        ),
      ),
      bottomNavigationBar: CustomNavbar(),
    );
  }
}

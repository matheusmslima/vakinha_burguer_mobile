import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VakinhaAppbar extends AppBar {
  VakinhaAppbar({
    Key? key,
    double elevation = 2,
    bool enableBackButton = false,
  }) : super(
          key: key,
          leading: Visibility(
            visible: enableBackButton,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Get.toNamed('/home');
              },
            ),
          ),
          backgroundColor: Colors.white,
          elevation: elevation,
          centerTitle: true,
          title: Image.asset(
            'assets/images/logo.png',
            width: 80,
          ),
        );
}


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_app/helper/constant/constant.dart';

enum SnackbarType { error, success, info }

void showCustomSnackbar({
  required String message,
  required SnackbarType type,
}) {
  IconData iconData;
  Color backgroundColor;

  switch (type) {
    case SnackbarType.error:
      iconData = Icons.error;
      backgroundColor = Colors.red;
      break;
    case SnackbarType.success:
      iconData = Icons.check_circle;
      backgroundColor = Colors.green;
      break;
    case SnackbarType.info:
      iconData = Icons.info;
      backgroundColor = Colors.black;
      break;
  }

  Get.snackbar(
    '',
    '',
    titleText: Text(message, style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 14,fontFamily: Constant.fontsFamily),),
    messageText: const SizedBox(),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: backgroundColor,
    icon: Icon(
      iconData,
      color: Colors.white,
    ),
    margin:  const EdgeInsets.only(bottom: 20, left: 20, right: 20,top: 25) ,
    borderRadius: 8,
    padding: const EdgeInsets.all(10),
    duration: const Duration(seconds: 3),
    isDismissible: true,
  );
}






import 'package:bocw_contractor_app/utilities/app_color.dart';
import 'package:extensions_pro/extensions_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';


class CustomLoader {
  static void showToast(String? message,
      {EasyLoadingToastPosition position = EasyLoadingToastPosition.center}) {
    EasyLoading.showToast(message!, toastPosition: position);
  }

  static void showLoader(String message) {
    EasyLoading.show(
        status: message,
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black);
  }

  static void closeLoader() {
    EasyLoading.dismiss();
  }

  static void message(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: primaryColor,
        textColor: whiteColor,
        fontSize: 16.0);
    Future.delayed(Duration(milliseconds: 750), () {
      Fluttertoast.cancel();
    });
  }

  static void internetMessage({required String msg, required BuildContext context}) {
    context.showCustomSnackBar(message: "no internet", backgroundColor: errorColor);
  }

  static Widget loader() {
    return const Center(
      child: CircularProgressIndicator(color: primaryColor),
    );
  }
}

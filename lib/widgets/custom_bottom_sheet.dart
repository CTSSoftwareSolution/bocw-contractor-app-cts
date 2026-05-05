import 'package:flutter/material.dart';
import '../utilities/app_color.dart';
import '../widgets/custom_text.dart';

void customBottomSheet({
  required BuildContext context,
  required String title,
  required Widget child,
}) {
  showModalBottomSheet(
    backgroundColor: backgroundColor,
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return SafeArea(
        bottom: true,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5.0),
                  Center(
                    child: Container(
                      width: 50,
                      height: 3.5,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade600,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: CustomText(
                      text: title,
                      fontSize: 17.5,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  child,
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

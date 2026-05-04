import 'package:bocw_contractor_app/utilities/app_color.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_container.dart';
import '../widgets/custom_text.dart';


Widget buildDocumentWidget({required String title, required VoidCallback onTap, required String buttonText, required Widget child, required Color containerColor, required Color backgroundColor, BoxBorder? border}){
  return  CustomContainer(
    //height: 90.0.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        color: containerColor,
        border: border
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Container(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: child //Image.asset(cloudUploadImage, scale: 3.5),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 10.0,
                top: 15.0,
                bottom: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  CustomText(
                    text: title,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    leftPadding: 6.0,
                    topPadding: 5.0,
                    overflow: TextOverflow.visible,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 5.0,
                    ),
                    child: CustomButton(
                      width: 240.0,
                      height: 30.0,
                      buttonText: buttonText,
                      onPress: onTap,
                      backgroundColor: primaryColor,
                      foregroundColor: whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
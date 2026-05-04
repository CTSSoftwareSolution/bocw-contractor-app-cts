import 'package:bocw_contractor_app/utilities/app_color.dart';
import 'package:bocw_contractor_app/utilities/input_formatters.dart';
import 'package:bocw_contractor_app/utilities/validators.dart';
import 'package:bocw_contractor_app/widgets/custom_text.dart';
import 'package:bocw_contractor_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class ResetPasswordItem extends StatefulWidget {
  const ResetPasswordItem({super.key});

  @override
  State<ResetPasswordItem> createState() => _ResetPasswordItemState();
}

class _ResetPasswordItemState extends State<ResetPasswordItem> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isPassVisible = true;
  bool isConfirmVisible = true;

  void togglePass() {
    setState(() {
      isPassVisible = !isPassVisible;
    });
  }

  void toggleConfirm() {
    setState(() {
      isConfirmVisible = !isConfirmVisible;
    });
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          text: "Password",
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(height: 8),
        CustomTextField(
          textCapitalization: TextCapitalization.none,
          hint: "Enter new password",
          controller: passwordController,
          readOnly: false,
          obscureText: isPassVisible,
          inputFormatters: InputFormatters.spaceNotAllowed,
          fillColor: cardColor,
          validator: (value) => Validators.textValidation(value ?? "", context),
          suffixIcon: IconButton(
            icon: Icon(
              isPassVisible ? Icons.visibility_off : Icons.visibility,
              color: primaryColor,
            ),
            onPressed: togglePass,
          ),
        ),
        const SizedBox(height: 20),
        const CustomText(
          text: "Confirm Password",
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(height: 8),
        CustomTextField(
          textCapitalization: TextCapitalization.none,
          hint: "Re-enter password",
          controller: confirmPasswordController,
          readOnly: false,
          obscureText: isConfirmVisible,
          inputFormatters: InputFormatters.spaceNotAllowed,
          fillColor: cardColor,
          validator: (value) => Validators.textValidation(value ?? "", context),
          suffixIcon: IconButton(
            icon: Icon(
              isConfirmVisible ? Icons.visibility_off : Icons.visibility,
              color: primaryColor,
            ),
            onPressed: toggleConfirm,
          ),
        ),
      ],
    );
  }
}
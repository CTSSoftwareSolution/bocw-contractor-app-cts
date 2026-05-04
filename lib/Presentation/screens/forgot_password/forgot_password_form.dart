import 'package:bocw_contractor_app/utilities/app_color.dart';
import 'package:bocw_contractor_app/utilities/input_formatters.dart';
import 'package:bocw_contractor_app/utilities/validators.dart';
import 'package:bocw_contractor_app/widgets/custom_text.dart';
import 'package:bocw_contractor_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class ForgotPasswordItem extends StatefulWidget {
  const ForgotPasswordItem({super.key});

  @override
  State<ForgotPasswordItem> createState() => _ForgotPasswordItemState();
}

class _ForgotPasswordItemState extends State<ForgotPasswordItem> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          text: "Email",
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(height: 8),

        CustomTextField(
          hint: "Enter registered email",
          controller: emailController,
          readOnly: false,
          textCapitalization: TextCapitalization.none,
          inputFormatters: InputFormatters.spaceNotAllowed,
          fillColor: cardColor,
          keyboardType: TextInputType.emailAddress,
          validator: (value) => Validators.emailValidation(value ?? "", context),
        ),
      ],
    );
  }
}
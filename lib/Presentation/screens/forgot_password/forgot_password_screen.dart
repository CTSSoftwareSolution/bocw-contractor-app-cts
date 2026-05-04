import 'package:bocw_contractor_app/Presentation/screens/forgot_password/forgot_password_form.dart';
import 'package:bocw_contractor_app/Presentation/screens/reset_password/reset_password_screen.dart';
import 'package:bocw_contractor_app/utilities/app_color.dart';
import 'package:bocw_contractor_app/utilities/image_data.dart';
import 'package:bocw_contractor_app/widgets/custom_button.dart';
import 'package:bocw_contractor_app/widgets/custom_text.dart';
import 'package:bocw_contractor_app/widgets/image_assets.dart';
import 'package:bocw_contractor_app/widgets/terms_conditions.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      /// APP BAR
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: textSecondary),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      /// BODY
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      /// LOGO
                      const SizedBox(height: 40),

                      const ImageAssets(image: workerLogo, height: 90),

                      const SizedBox(height: 20),

                      /// TITLE
                      const CustomText(
                        text: "Forgot Password",
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        textAlign: TextAlign.center,
                        textColor: textPrimary,
                      ),

                      const SizedBox(height: 10),

                      const CustomText(
                        text: "Enter your registered email to reset password",
                        fontSize: 14,
                        textAlign: TextAlign.center,
                        textColor: textSecondary,
                      ),

                      const SizedBox(height: 30),
                      const ForgotPasswordItem(),
                      const SizedBox(height: 30),

                      /// NEXT BUTTON
                      CustomButton(
                        width: double.infinity,
                        height: 48,
                        buttonText: "Next",
                        onPress: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ResetPasswordScreen(),
                              ),
                            );
                          }
                        },
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: const TermsConditions(),
    );
  }
}

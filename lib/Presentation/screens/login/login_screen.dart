import 'dart:io';
import 'package:bocw_contractor_app/Presentation/screens/dashboard/dashboard_screen.dart';
import 'package:bocw_contractor_app/Presentation/screens/forgot_password/forgot_password_screen.dart';
import 'package:bocw_contractor_app/Presentation/screens/login/login_form.dart';
import 'package:bocw_contractor_app/Presentation/screens/registration/registration_screen.dart';
import 'package:bocw_contractor_app/utilities/app_color.dart';
import 'package:bocw_contractor_app/utilities/image_data.dart';
import 'package:bocw_contractor_app/widgets/image_assets.dart';
import 'package:extensions_pro/extensions_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/terms_conditions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
        leading: InkWell(
          onTap: () {
            if (Platform.isAndroid) {
              SystemNavigator.pop();
            } else {
              exit(0);
            }
          },
          child: const Icon(Icons.close, color: textSecondary),
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
                      const SizedBox(height: 50),

                      /// LOGO
                      const ImageAssets(image: workerLogo, height: 90),
                      const SizedBox(height: 20),
                      const CustomText(
                        text: "Sign In",
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        textAlign: TextAlign.center,
                        textColor: textPrimary,
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const RegistrationScreen(),
                            ),
                          );
                        },
                        child: RichText(
                          text: const TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(
                              color: textSecondary,
                              fontSize: 14,
                            ),
                            children: [
                              TextSpan(
                                text: "Sign Up",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const LoginScreenItem(),
                      const SizedBox(height: 10),
                      CustomText(
                        text: "Forgot Password?",
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600,
                        click: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ForgotPasswordScreen(),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 25),

                      /// LOGIN BUTTON
                      CustomButton(
                        width: double.infinity,
                        height: 48,
                        buttonText: "Login",
                        onPress: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Login Successful (UI test)"),
                              ),
                            );
                            context.pushReplacement(const DashboardScreen());
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

      /// BOTTOM
      bottomNavigationBar: const TermsConditions(),
    );
  }
}

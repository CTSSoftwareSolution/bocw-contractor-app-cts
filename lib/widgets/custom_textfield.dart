import 'package:bocw_contractor_app/utilities/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;

  final bool readOnly;
  final double? height;
  final double? width;
  final int? minLines;
  final int? maxLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final InputBorder? disabledBorder;
  final TextInputType? keyboardType;
  final bool? enable;
  final bool? obscureText;
  final Color? borderClr;
  final Color? fillColor;
  final EdgeInsetsGeometry? contentPadding;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final TextCapitalization textCapitalization;
  final TextStyle? hintStyle;
  final ValueChanged<String>? onChanged;
  final TextAlign? textAlign;
  final bool isDense;
  final int? errorMaxLines;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.controller,
    this.hintStyle,
    this.onChanged,
    this.onTap,
    required this.readOnly,
    this.inputFormatters,
    this.validator,
    this.keyboardType,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    this.height,
    this.suffixIcon,
    this.prefixIcon,
    this.minLines,
    this.width,
    this.maxLines,
    this.enable = true,
    this.borderClr,
    this.fillColor,
    this.obscureText = false,
    required this.textCapitalization,
    this.disabledBorder,
    this.textAlign,
    this.isDense = false,
    this.errorMaxLines,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: borderClr ?? borderColor,
        width: 1,
      ),
    );

    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        textCapitalization: textCapitalization,
        obscureText: obscureText ?? false,
        validator: validator,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        onTap: onTap,
        onChanged: onChanged,
        enabled: enable,
        controller: controller,
        readOnly: readOnly,
        minLines: obscureText == true ? 1 : minLines,
        maxLines: obscureText == true ? 1 : maxLines,
        style: const TextStyle(
          color: textPrimary,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign ?? TextAlign.start,
        cursorColor: primaryColor,
        decoration: InputDecoration(
          isDense: isDense,
          contentPadding: contentPadding,
          fillColor: fillColor ?? cardColor,
          filled: true,
          hintText: hint,
          hintStyle: hintStyle ??
              const TextStyle(
                color: textHint,
                fontSize: 14,
              ),
          enabledBorder: border,
          focusedBorder: border.copyWith(
            borderSide: const BorderSide(
              color: primaryColor,
              width: 1.5,
            ),
          ),
          border: border,
          disabledBorder: disabledBorder ?? border,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          errorMaxLines: errorMaxLines,
        ),
      ),
    );
  }
}
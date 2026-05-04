import 'package:flutter/material.dart';


class CustomContainer extends StatelessWidget {
  final Widget child;
   final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final Decoration? decoration;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;

  const CustomContainer({super.key, required this.child, this.onTap,this.margin,  this.decoration, this.padding, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        margin: margin,
        padding: padding,
        decoration: decoration,
        child: child,
      ),
    );
  }
}

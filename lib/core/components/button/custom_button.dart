
import 'package:flutter/material.dart';

import '../../init/constants/color_constants.dart';

class CustomButton extends StatelessWidget {
  final String inputText;
  final TextStyle? style;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final bool? wrapText;
  final double? width;
  final double? height;
  final double? borderRadius;
  final BoxShadow? boxShadow;
  final String? image;
  final bool? isImage;

  const CustomButton(
      {super.key,
        required this.inputText,
        this.style,
        this.backgroundColor,
        this.onPressed,
        required this.wrapText,
        this.width,
        this.height,
        this.borderRadius,
        this.boxShadow,
        this.image,
        this.isImage});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          fixedSize: Size(width ?? 150, height ?? 50),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 0)),
          elevation: boxShadow != null ? 4.0 : 0.0,
          shadowColor: boxShadow?.color,
        ),
        child: isImage != null
            ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(image!)),
            Text(
              inputText,
              softWrap: wrapText,
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
              style: style,
            ),
          ],
        )
            : Text(inputText,
            softWrap: wrapText,
            textAlign: TextAlign.center,
            overflow: TextOverflow.visible,
            style: style));
  }
}
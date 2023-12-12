import 'package:flutter/material.dart';

class ClickableText extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final TextStyle? style;

  const ClickableText({
    Key? key,
    required this.text,
    this.onTap,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // Basılınca tetiklenecek işlev
      child: Text(
        text,
        style: style ?? TextStyle(color: Colors.blue, decoration: TextDecoration.underline), // Varsayılan stil
      ),
    );
  }
}

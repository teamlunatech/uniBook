import 'package:flutter/material.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';

class CustomHeaderText extends StatelessWidget {
  final String text; // Kullanıcıdan alınacak metin

  CustomHeaderText({required this.text});

  @override
  Widget build(BuildContext context) {
    double textSize = MediaQuery.of(context).size.width * 0.06; // Text boyutu

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text, // Kullanıcıdan alınan metin
          style: TextStyle(
            fontFamily: 'PoppinsExtraBoldItalic',
            fontSize: textSize ,
            fontWeight: FontWeight.w700,
            color: ColorConstants.secondaryColor,
          ),
        ),
      ),
    );
  }
}

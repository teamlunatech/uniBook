import 'package:flutter/material.dart';
import 'package:uni_book/core/components/appbar/appbar.dart';
import 'package:uni_book/core/components/button/clickable_text.dart';
import 'package:uni_book/core/components/button/custom_button.dart';
import 'package:uni_book/core/components/navbar/navbar.dart';
import 'package:uni_book/core/components/text_field/custom_email_field.dart';
import 'package:uni_book/core/components/text_field/password_input_field.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';

class CustomInfoContainer extends StatelessWidget {
  final String title;
  final String content;
  final Color backgroundColor;

  const CustomInfoContainer({
    Key? key,
    required this.title,
    required this.content,
    this.backgroundColor = ColorConstants.primaryColor, // Varsayılan bir renk
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height/10,
      width:  MediaQuery.sizeOf(context).width/1.1,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor, // Arka plan rengi
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorConstants.secondaryColor
            ),
          ),
          SizedBox(width: MediaQuery.sizeOf(context).width/5),
          Text(
            content,
            style: TextStyle(
              color: ColorConstants.secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
